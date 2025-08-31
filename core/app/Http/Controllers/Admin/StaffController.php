<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\staff;

class StaffController extends Controller
{
    public function index()
    {
        $pageTitle = 'قائمة السائقين';
        $staffs = staff::latest()->paginate(10);
        return view('admin.staff.index', compact('pageTitle', 'staffs'));
    }

    public function create()
    {
        $pageTitle = 'إضافة سائق جديد';
        return view('admin.staff.create', compact('pageTitle'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|min:18',
            'phone' => 'required|string|max:20',
            'status' => 'nullable|string',
        ]);
         staff::create([
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'status' => $request->status,
        ]);

        $notify[] = ['success', 'تمت إضافة الموظف بنجاح'];
        return redirect()->route('admin.staff.index')->withNotify($notify);
    }

    public function edit($id)
    {
        $staff = staff::findOrFail($id);
        $pageTitle = 'تعديل بيانات السائق';
        return view('admin.staff.edit', compact('pageTitle', 'staff'));
    }

    public function update(Request $request, $id)
    {
        $staff = staff::findOrFail($id);

        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|integer|min:18',
            'phone' => 'required|string|max:20|unique:staffs,phone,' . $id,
            'status' => 'nullable|string',
        ]);

        $staff->update($request->only(['name', 'email', 'phone', 'status']));

        $notify[] = ['success', 'تم تعديل بيانات السائق'];
        return redirect()->route('staff.index')->withNotify($notify);
    }

    public function destroy($id)
    {
        staff::findOrFail($id)->delete();
        $notify[] = ['success', 'تم حذف السائق'];
        return back()->withNotify($notify);
    }
}
