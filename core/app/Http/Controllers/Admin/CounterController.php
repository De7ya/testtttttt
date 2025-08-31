<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Counter;

class CounterController extends Controller
{
    public function counters()
    {
        $pageTitle = 'All Counter';
        $counters  = Counter::searchable(['name', 'city', 'mobile'])->paginate(getPaginate());

        // Optional flag for your Blade (true = show "Add Counter")
        $canAddCounter = !(
            auth('admin')->check() &&
            (int) auth('admin')->user()->role_id === 2 // hide add for role 2
        );

        return view('admin.counter.list', compact('pageTitle', 'counters', 'canAddCounter'));
    }

    public function counterStore(Request $request, $id = 0)
    {
        // === Permission guard: role_id 2 can EDIT but NOT ADD ===
        $admin = auth('admin')->user();
        if ($admin && (int) $admin->role_id === 2 && (int) $id === 0) {
            // Create attempt by role 2 → block
            abort(403, __('غير مسموح لك بإضافة عداد جديد.'));
        }

        // If you also have a view-only role (e.g., role_id 1), block both add & update like this:
        // if ($admin && (int) $admin->role_id === 1) {
        //     abort(403, __('غير مسموح لك بإجراء هذا الإجراء.'));
        // }

        $request->validate([
            'name'   => 'required|unique:counters,name,' . $id,
            'city'   => 'required',
            'mobile' => 'required|numeric|unique:counters,mobile,' . $id,
        ]);

        if ($id) {
            $counter = Counter::findOrFail($id);
            $message = __('تم تحديث المحطة بنجاح');
        } else {
            $counter = new Counter();
            $message = __('تم إضافة المحطة بنجاح');
        }

        $counter->name     = $request->name;
        $counter->city     = $request->city;
        $counter->location = $request->location;
        $counter->mobile   = $request->mobile;
        $counter->save();

        $notify[] = ['success', $message];
        return back()->withNotify($notify);
    }

    public function status($id)
    {
        // Role 2 is allowed to edit/toggle status. If you want to restrict,
        // add a similar guard here.
        return Counter::changeStatus($id);
    }
}

