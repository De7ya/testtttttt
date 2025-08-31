<?php

namespace App\Http\Controllers\Api;

use App\Constants\Status;
use App\Http\Controllers\Controller;
use App\Lib\GoogleAuthenticator;
use App\Models\DeviceToken;
use App\Models\NotificationLog;
use App\Models\Transaction;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules\Password;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class UserController extends Controller
{
    public function userDataSubmit(Request $request)
    {
        $user = auth()->user();
        if ($user->profile_complete == Status::YES) {
            $notify[] = 'لقد أكملت ملفك الشخصي بالفعل.';
            return response()->json([
                'remark' => 'already_completed',
                'status' => 'error',
                'message' => ['error' => $notify],
            ]);
        }


        $countryData  = (array)json_decode(file_get_contents(resource_path('views/partials/country.json')));
        $countryCodes = implode(',', array_keys($countryData));
        $mobileCodes  = implode(',', array_column($countryData, 'dial_code'));
        $countries    = implode(',', array_column($countryData, 'country'));


        $validator = Validator::make($request->all(), [
            'country_code' => 'required|in:' . $countryCodes,
            'country'      => 'required|in:' . $countries,
            'mobile_code'  => 'required|in:' . $mobileCodes,
            'username'     => 'required|unique:users|min:6',
            'mobile'       => ['required', 'regex:/^([0-9]*)$/', Rule::unique('users')->where('dial_code', $request->mobile_code)],
        ]);


        if ($validator->fails()) {
            return response()->json([
                'remark' => 'validation_error',
                'status' => 'error',
                'message' => ['error' => $validator->errors()->all()],
            ]);
        }


        if (preg_match("/[^a-z0-9_]/", trim($request->username))) {
            $notify[] = '';لا أحرف خاصة أو مسافات أو حروف كبيرة في اسم المستخدم.
            return response()->json([
                'remark' => 'validation_error',
                'status' => 'error',
                'message' => ['error' => $validator->errors()->all()],
            ]);
        }


        $user->country_code = $request->country_code;
        $user->mobile       = $request->mobile;
        $user->username     = $request->username;

        $user->address = $request->address;
        $user->city = $request->city;
        $user->state = $request->state;
        $user->zip = $request->zip;
        $user->country_name = @$request->country;
        $user->dial_code = $request->mobile_code;

        $user->profile_complete = Status::YES;
        $user->save();

        $notify[] = 'تم إكمال الملف الشخصي بنجاح.';
        return response()->json([
            'remark' => 'profile_completed',
            'status' => 'success',
            'message' => ['success' => $notify],
            'data' => [
                'user' => $user
            ]
        ]);
    }



    public function depositHistory(Request $request)
    {
        $deposits = auth()->user()->deposits();
        if ($request->search) {
            $deposits = $deposits->where('trx', $request->search);
        }
        $deposits = $deposits->with(['gateway'])->orderBy('id', 'desc')->paginate(getPaginate());
        $notify[] = 'بيانات الدفع';
        return response()->json([
            'remark' => 'deposits',
            'status' => 'success',
            'message' => ['success' => $notify],
            'data' => [
                'deposits' => $deposits
            ]
        ]);
    }

    public function transactions(Request $request)
    {
        $remarks = Transaction::distinct('remark')->get('remark');
        $transactions = Transaction::where('user_id', auth()->id());

        if ($request->search) {
            $transactions = $transactions->where('trx', $request->search);
        }


        if ($request->type) {
            $type = $request->type == 'plus' ? '+' : '-';
            $transactions = $transactions->where('trx_type', $type);
        }

        if ($request->remark) {
            $transactions = $transactions->where('remark', $request->remark);
        }

        $transactions = $transactions->orderBy('id', 'desc')->paginate(getPaginate());
        $notify[] = 'بيانات التحويل';
        return response()->json([
            'remark' => 'transactions',
            'status' => 'success',
            'message' => ['success' => $notify],
            'data' => [
                'transactions' => $transactions,
                'remarks' => $remarks,
            ]
        ]);
    }

    public function submitProfile(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'firstname' => 'required',
            'lastname' => 'required',
        ], [
            'firstname.required' => 'The first name field is required',
            'lastname.required' => 'The last name field is required'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'remark' => 'validation_error',
                'status' => 'error',
                'message' => ['error' => $validator->errors()->all()],
            ]);
        }

        $user = auth()->user();

        $user->firstname = $request->firstname;
        $user->lastname = $request->lastname;

        $user->address = $request->address;
        $user->city = $request->city;
        $user->state = $request->state;
        $user->zip = $request->zip;

        $user->save();

        $notify[] = 'تم تحديث الحساب بنجاح';
        return response()->json([
            'remark' => 'profile_updated',
            'status' => 'success',
            'message' => ['success' => $notify],
        ]);
    }

    public function submitPassword(Request $request)
    {
        $passwordValidation = Password::min(6);
        if (gs('secure_password')) {
            $passwordValidation = $passwordValidation->mixedCase()->numbers()->symbols()->uncompromised();
        }

        $validator = Validator::make($request->all(), [
            'current_password' => 'required',
            'password' => ['required', 'confirmed', $passwordValidation]
        ]);

        if ($validator->fails()) {
            return response()->json([
                'remark' => 'validation_error',
                'status' => 'error',
                'message' => ['error' => $validator->errors()->all()],
            ]);
        }

        $user = auth()->user();
        if (Hash::check($request->current_password, $user->password)) {
            $password = Hash::make($request->password);
            $user->password = $password;
            $user->save();
            $notify[] = 'تم تغيير كلمة المرور بنجاح';
            return response()->json([
                'remark' => 'password_changed',
                'status' => 'success',
                'message' => ['success' => $notify],
            ]);
        } else {
            $notify[] = 'كلمة المرور غير متطابقة!';
            return response()->json([
                'remark' => 'validation_error',
                'status' => 'error',
                'message' => ['error' => $notify],
            ]);
        }
    }


    public function addDeviceToken(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'token' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'remark' => 'validation_error',
                'status' => 'error',
                'message' => ['error' => $validator->errors()->all()],
            ]);
        }

        $deviceToken = DeviceToken::where('token', $request->token)->first();

        if ($deviceToken) {
            $notify[] = 'الرمز موجود بالفعل.';
            return response()->json([
                'remark' => 'token_exists',
                'status' => 'error',
                'message' => ['error' => $notify],
            ]);
        }

        $deviceToken          = new DeviceToken();
        $deviceToken->user_id = auth()->user()->id;
        $deviceToken->token   = $request->token;
        $deviceToken->is_app  = Status::NO;
        $deviceToken->save();

        $notify[] = 'تم حفظ الرمز بنجاح.';
        return response()->json([
            'remark' => 'token_saved',
            'status' => 'success',
            'message' => ['success' => $notify],
        ]);
    }


    public function show2faForm()
    {
        $ga = new GoogleAuthenticator();
        $user = auth()->user();
        $secret = $ga->createSecret();
        $qrCodeUrl = $ga->getQRCodeGoogleUrl($user->username . '@' . gs('site_name'), $secret);
        $notify[] = '2FA Qr';
        return response()->json([
            'remark' => '2fa_qr',
            'status' => 'success',
            'message' => ['success' => $notify],
            'data' => [
                'secret' => $secret,
                'qr_code_url' => $qrCodeUrl,
            ]
        ]);
    }

    public function create2fa(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'secret' => 'required',
            'code' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'remark' => 'validation_error',
                'status' => 'error',
                'message' => ['error' => $validator->errors()->all()],
            ]);
        }

        $user = auth()->user();
        $response = verifyG2fa($user, $request->code, $request->secret);
        if ($response) {
            $user->tsc = $request->secret;
            $user->ts = Status::ENABLE;
            $user->save();

            $notify[] = 'Google authenticator activated successfully';
            return response()->json([
                'remark' => '2fa_qr',
                'status' => 'success',
                'message' => ['success' => $notify],
            ]);
        } else {
            $notify[] = 'رمز التحقق غير صحيح.';
            return response()->json([
                'remark' => 'wrong_verification',
                'status' => 'error',
                'message' => ['error' => $notify],
            ]);
        }
    }

    public function disable2fa(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'code' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'remark' => 'validation_error',
                'status' => 'error',
                'message' => ['error' => $validator->errors()->all()],
            ]);
        }

        $user = auth()->user();
        $response = verifyG2fa($user, $request->code);
        if ($response) {
            $user->tsc = null;
            $user->ts = Status::DISABLE;
            $user->save();
            $notify[] = 'تم تعطيل المصادقة الثنائية بنجاح.';
            return response()->json([
                'remark' => '2fa_qr',
                'status' => 'success',
                'message' => ['success' => $notify],
            ]);
        } else {
            $notify[] = 'رمز تحقق خاطئ';
            return response()->json([
                'remark' => 'wrong_verification',
                'status' => 'error',
                'message' => ['error' => $notify],
            ]);
        }
    }

    public function pushNotifications()
    {
        $notifications = NotificationLog::where('user_id', auth()->id())->where('sender', 'firebase')->orderBy('id', 'desc')->paginate(getPaginate());
        $notify[] = 'إشعارات الدفع';
        return response()->json([
            'remark' => 'notifications',
            'status' => 'success',
            'message' => ['success' => $notify],
            'data' => [
                'notifications' => $notifications,
            ]
        ]);
    }


    public function pushNotificationsRead($id)
    {
        $notification = NotificationLog::where('user_id', auth()->id())->where('sender', 'firebase')->find($id);
        if (!$notification) {
            $notify[] = 'اشعارات غير موجودة';
            return response()->json([
                'remark' => 'notification_not_found',
                'status' => 'error',
                'message' => ['error' => $notify]
            ]);
        }
        $notify[] = 'تم وضع علامة الإشعار كمقروء بنجاح.';
        $notification->user_read = 1;
        $notification->save();

        return response()->json([
            'remark' => 'notification_read',
            'status' => 'success',
            'message' => ['success' => $notify]
        ]);
    }


    public function userInfo()
    {
        $notify[] = 'بيانات المستخدم';
        return response()->json([
            'remark' => 'user_info',
            'status' => 'success',
            'message' => ['success' => $notify],
            'data' => [
                'user' => auth()->user()
            ]
        ]);
    }

    public function deleteAccount()
    {
        $user = auth()->user();
        $user->username = 'deleted_' . $user->username;
        $user->email = 'deleted_' . $user->email;
        $user->provider_id = 'deleted_' . $user->provider_id;
        $user->save();

        $user->tokens()->delete();

        $notify[] = 'تم حذف الحساب بنجاح';
        return response()->json([
            'remark' => 'account_deleted',
            'status' => 'success',
            'message' => ['success' => $notify],
        ]);
    }
}
