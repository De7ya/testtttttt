@extends('admin.layouts.master')
@section('content')
    <div class="login-main" style="background-image: url('{{ asset('assets/admin/images/login.jpg') }}')">
        <div class="container custom-container">
            <div class="row justify-content-center">
                <div class="col-xxl-5 col-xl-5 col-lg-6 col-md-8 col-sm-11">
                    <div class="login-area">
                        <div class="login-wrapper">
                            <div class="login-wrapper__top">
                                <h3 class="title text-white">@lang('استعادة الحساب')</h3>
                            </div>
                            <div class="login-wrapper__body">
                                <form action="{{ route('admin.password.reset') }}" method="POST" class="login-form verify-gcaptcha">
                                    @csrf
                                    <div class="form-group">
                                        <label>@lang('بريد الالكتروني')</label>
                                        <input type="email" name="email" class="form-control" value="{{ old('email') }}" required>
                                    </div>

                                    <x-captcha />

                                    <button type="submit" class="btn cmn-btn w-100">@lang('تأكيد')</button>

                                    <div class="text-center mt-3">
                                        <a href="{{ route('admin.login') }}" class="text--base"><i class="las la-sign-in-alt"></i>@lang('العودة إلى تسجيل الدخول')</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('style')
    <!-- Tajawal font -->
    <link href="https://fonts.googleapis.com/css2?family=Tajawal:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        html, body, button, input, select, textarea {
            font-family: 'Tajawal', system-ui, -apple-system, Segoe UI, Roboto, "Helvetica Neue", Arial, "Noto Sans", "Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
        }
    </style>
@endpush
