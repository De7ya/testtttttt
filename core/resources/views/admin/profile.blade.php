@extends('admin.layouts.app')
@section('panel')

    <div class="row mb-none-30">
        <div class="col-xl-3 col-lg-4 mb-30">

            <div class="card b-radius--5 overflow-hidden">
                <div class="card-body p-0">
                    <div class="d-flex p-3 bg--primary align-items-center">
                        <div class="avatar avatar--lg">
                            <img src="{{ getImage(getFilePath('adminProfile').'/'. $admin->image,getFileSize('adminProfile'))}}" alt="Image">
                        </div>
                        <div class="ps-3">
                            <h4 class="text--white">{{__($admin->name)}}</h4>
                        </div>
                    </div>
                    <ul class="list-group">
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('الاسم')
                            <span class="fw-bold">{{__($admin->name)}}</span>
                        </li>

                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('اسم المستخدم')
                            <span  class="fw-bold">{{__($admin->username)}}</span>
                        </li>

                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('بريد الالكتروني')
                            <span  class="fw-bold">{{$admin->email}}</span>
                        </li>

                    </ul>
                </div>
            </div>
        </div>

        <div class="col-xl-9 col-lg-8 mb-30">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title mb-4 border-bottom pb-2">@lang('معلومات الحساب')</h5>

                    <form action="{{ route('admin.profile.update') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            <div class="col-xxl-4 col-lg-6">
                                <div class="form-group">
                                    <label>@lang('صورة')</label>
                                    <x-image-uploader image="{{ $admin->image }}" class="w-100" type="adminProfile" :required=false />
                                </div>
                            </div>
                            <div class="col-xxl-8 col-lg-6">
                                <div class="form-group ">
                                    <label>@lang('الاسم')</label>
                                    <input class="form-control" type="text" name="name" value="{{ $admin->name }}" required>
                                </div>
                                <div class="form-group">
                                    <label>@lang('بريد الالكتروني')</label>
                                    <input class="form-control" type="email" name="email" value="{{ $admin->email }}" required>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn--primary h-45 w-100">@lang('تأكيد')</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('breadcrumb-plugins')
    <a href="{{route('admin.password')}}" class="btn btn-sm btn-outline--primary"><i class="las la-key"></i>@lang('اعدادات كلمة المرور')</a>
@endpush

@push('style')
    <!-- Tajawal font -->
    <link href="https://fonts.googleapis.com/css2?family=Tajawal:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        html, body, button, input, select, textarea {
            font-family: 'Tajawal', system-ui, -apple-system, Segoe UI, Roboto, "Helvetica Neue", Arial, "Noto Sans", "Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
        }
        .list-group-item:first-child{
            border-top-left-radius:unset;
            border-top-right-radius:unset;
        }
    </style>
@endpush
