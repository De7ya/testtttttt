<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Role;

class RoleController extends Controller
{
    public function index()
    {
        $pageTitle = 'قائمة صلاحيات';
        $roles = Role::latest()->paginate(10);
        return view('admin.roles.index', compact('pageTitle', 'roles'));
    }

    public function edit(Request $request, $id)
    {
        $role = Role::findOrFail($id);

        // لو الطلب AJAX نرجّع الفورم الجزئي فقط (للمودال)
        if ($request->ajax()) {
            return view('admin.roles.partials.edit_form', compact('role'))->render();
        }

        // غير كذا نعرض صفحة كاملة
        $pageTitle = 'تعديل صلاحية';
        return view('admin.roles.edit', compact('pageTitle', 'role'));
    }

    public function update(Request $request, $id)
    {
        $role = Role::findOrFail($id);

        $request->validate([
            'name'    => 'required|string|max:255',
            'counter' => 'required|integer|in:1,2,3',
            'fleet'   => 'required|integer|in:1,2,3',
        ]);

        $role->update($request->only(['name','counter','fleet']));

        $notify[] = ['success', 'تم تعديل بيانات الصلاحية بنجاح'];
        return redirect()->route('admin.role.index')->withNotify($notify);
    }
}
