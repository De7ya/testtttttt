@extends($activeTemplate . 'layouts.authenticate')
@section('content')
    @include($activeTemplate . 'partials.social_login')

    <form method="POST" class="account-form row" action="{{ route('user.login') }}" onsubmit="return submitUserForm();">
        @csrf
        <div class="col-lg-12 form-group form--group" style="direction: rtl">
            <label for="username">@lang('البريد الالكتروني')</label>
            <input id="username" name="username" type="text" class="form--control" placeholder="@lang('ادخل اسم المستخدم')" required>
        </div>
        <div class="col-lg-12 form-group form--group" style="direction: rtl">
            <label for="password">@lang('كلمة المرور')</label>
            <input id="password" type="password" name="password" class="form--control" placeholder="@lang('ادخل كلمة المرور')" required>
        </div>
        <div class="col-lg-12">
            <x-captcha />
        </div>

        <div class="col-lg-12 d-flex justify-content-between">
            <div class="form-group form--group custom--checkbox">
                <input type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>
                <label for="remember">@lang('تذكرني')</label>
            </div>
            <div class="">
                <a href="{{ route('user.password.request') }}">@lang('هل نسيت كلمة المرور؟')</a>
            </div>
        </div>
        <div class="col-md-12 form-group form--group">
            <button class="account-button w-100" type="submit">@lang('تسجيل دخول')</button>
        </div>
        <div class="col-md-12" style="direction: rtl">
            <div class="account-page-link">
                <p>@lang('ليس لديك حساب؟') <a href="{{ route('user.register') }}">@lang('تسجيل ')</a></p>
            </div>
        </div>
    </form>
@endsection

@push('script')
    <script>
        "use strict";

        function submitUserForm() {
            var response = grecaptcha.getResponse();
            if (response.length == 0) {
                document.getElementById('g-recaptcha-error').innerHTML =
                    '<span class="text-danger">@lang('حقل التحقق مطلوب')</span>';
                return false;
            }
            return true;
        }
    </script>
@endpush
