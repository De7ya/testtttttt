<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Driver;

class DriverController extends Controller
{
    public function index()
    {
        $pageTitle = 'قائمة السائقين';
        $drivers = Driver::latest()->paginate(10);
        return view('admin.users.list', compact('pageTitle', 'drivers'));
    }

    public function create()
    {
        $pageTitle = 'إضافة سائق جديد';
        return view('admin.driver.create', compact('pageTitle'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'age' => 'required|integer|min:18',
            'phone' => 'required|string|max:20|unique:drivers',
            'address' => 'nullable|string',
            'license_number' => 'nullable|string',
        ]);

        Driver::create($request->only(['name', 'age', 'phone', 'address', 'license_number']));

        $notify[] = ['success', 'تمت إضافة السائق بنجاح'];
        return redirect()->route('admin.users.driver')->withNotify($notify);
    }

    public function edit($id)
    {
        $driver = Driver::findOrFail($id);
        $pageTitle = 'تعديل بيانات السائق';
        return view('admin.driver.edit', compact('pageTitle', 'driver'));
    }

    public function update(Request $request, $id)
    {
        $driver = Driver::findOrFail($id);

        $request->validate([
            'name' => 'required|string|max:255',
            'age' => 'required|integer|min:18',
            'phone' => 'required|string|max:20|unique:drivers,phone,' . $id,
            'address' => 'nullable|string',
            'license_number' => 'nullable|string',
        ]);

        $driver->update($request->only(['name', 'age', 'phone', 'address', 'license_number']));

        $notify[] = ['success', 'تم تعديل بيانات السائق'];
        return redirect()->route('driver.index')->withNotify($notify);
    }

    public function destroy($id)
    {
        Driver::findOrFail($id)->delete();
        $notify[] = ['success', 'تم حذف السائق'];
        return back()->withNotify($notify);
    }
}
