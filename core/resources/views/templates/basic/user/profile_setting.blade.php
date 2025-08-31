@extends($activeTemplate . 'layouts.master')
@section('content')
    <div class="padding-top padding-bottom">
        <div class="container">
            <div class="profile__edit__wrapper" style="direction: rtl">
                <div class="profile__edit__form">
                    <form class="register prevent-double-click" action="" method="post" enctype="multipart/form-data">
                        @csrf
                        <div class="row justify-content-center">
                            <div class="col-xl-10">
                                <div class="profile__content__edit p-0">
                                    <div class="row gy-3 p-4">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">@lang('الاسم الأول')</label>
                                                <input type="text" class="form-control form--control radius-0" name="firstname" placeholder="@lang('الاسم الأول')" value="{{ $user->firstname }}" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">@lang('الاسم الأخير')</label>
                                                <input type="text" class="form-control form--control radius-0" id="lastname" name="lastname" placeholder="@lang('الاسم الأخير')" value="{{ $user->lastname }}" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">@lang('البريد الالكتروني')</label>
                                                <input class="form-control form--control radius-0" value="{{ $user->email }}" disabled>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">@lang('رقم الهاتف')</label>
                                                <input class="form-control form--control radius-0" value="{{ $user->mobile }}" disabled>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">@lang('العنوان')</label>
                                                <input type="text" class="form-control form--control radius-0" name="address" placeholder="@lang('العنوان')" value="{{ @$user->address }}" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">@lang('المنطقة')</label>
                                                <input type="text" class="form-control form--control radius-0" name="state" placeholder="@lang('المنطقة')" value="{{ @$user->state }}" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">@lang('المدينة')</label>
                                                <input type="text" class="form-control form--control radius-0" name="city" placeholder="@lang('المدينة')" value="{{ @$user->city }}" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-label">@lang('الدولة')</label>
                                                <input class="form-control form--control radius-0" value="{{ @$user->country_name }}" disabled>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <button type="submit" class="btn btn--base btn--block h-auto">@lang('تحديث الحساب')</button>
                                        </div>
                                    </div> <!-- /.row -->
                                </div> <!-- /.profile__content__edit -->
                            </div> <!-- /.col-xl-10 -->
                        </div> <!-- /.row justify-content-center -->
                    </form>
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
