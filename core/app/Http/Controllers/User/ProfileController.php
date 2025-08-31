<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules\Password;

class ProfileController extends Controller
{
    public function profile()
    {
        $pageTitle = "Profile Setting";
        $user = auth()->user();
        return view('Template::user.profile_setting', compact('pageTitle','user'));
    }

    public function submitProfile(Request $request)
    {
        $user = auth()->user();

        // نمط الحروف العربية/الإنجليزية + مسافة + شرطة وسطية
        $lettersOnly = 'regex:/^[\p{Arabic}A-Za-z\s\-]+$/u';

        // ملاحظة: لا يوجد أي تحقق أو حفظ لحقل الهاتف هنا (تم إلغاؤه)
        $request->validate([
            'firstname' => ['required', 'string', 'max:100', $lettersOnly],
            'lastname'  => ['required', 'string', 'max:100', $lettersOnly],

            // حروف فقط حسب طلبك
            'address'   => ['nullable', 'string', 'max:255', $lettersOnly],
            'city'      => ['nullable', 'string', 'max:100',  $lettersOnly],

            // بإمكانك إضافة state/zip إذا أردت قواعد إضافية
            'state'     => ['nullable', 'string', 'max:100'],
            'zip'       => ['nullable', 'string', 'max:50'],
        ],[
            'firstname.required' => 'حقل الاسم الأول مطلوب',
            'firstname.regex'    => 'الاسم الأول يجب أن يحتوي على حروف فقط',
            'lastname.required'  => 'حقل الاسم الأخير مطلوب',
            'lastname.regex'     => 'الاسم الأخير يجب أن يحتوي على حروف فقط',

            'address.regex'      => 'العنوان يجب أن يحتوي على حروف فقط',
            'city.regex'         => 'المدينة يجب أن تحتوي على حروف فقط',
        ]);

        // حفظ البيانات (بدون الهاتف)
        $user->firstname = $request->firstname;
        $user->lastname  = $request->lastname;

        $user->address   = $request->address;
        $user->city      = $request->city;
        $user->state     = $request->state;
        $user->zip       = $request->zip;

        $user->save();

        $notify[] = ['success', 'تم تحديث الملف الشخصي بنجاح'];
        return back()->withNotify($notify);
    }

    public function changePassword()
    {
        $pageTitle = 'Change Password';
        return view('Template::user.password', compact('pageTitle'));
    }

    public function submitPassword(Request $request)
    {
        $passwordValidation = Password::min(6);
        if (gs('secure_password')) {
            $passwordValidation = $passwordValidation->mixedCase()->numbers()->symbols()->uncompromised();
        }

        $request->validate([
            'current_password' => 'required',
            'password' => ['required','confirmed',$passwordValidation]
        ],[
            'current_password.required' => 'كلمة المرور الحالية مطلوبة',
            'password.required'         => 'كلمة المرور الجديدة مطلوبة',
            'password.confirmed'        => 'تأكيد كلمة المرور غير مطابق',
        ]);

        $user = auth()->user();

        if (Hash::check($request->current_password, $user->password)) {
            $user->password = Hash::make($request->password);
            $user->save();
            $notify[] = ['success', 'تم تغيير كلمة المرور بنجاح'];
            return back()->withNotify($notify);
        } else {
            $notify[] = ['error', 'كلمة المرور الحالية غير صحيحة'];
            return back()->withNotify($notify);
        }
    }
}
