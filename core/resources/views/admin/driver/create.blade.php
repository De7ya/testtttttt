@extends('admin.layouts.app')

@push('style')
    @once
        <!-- خط Tajawal -->
        <link href="https://fonts.googleapis.com/css2?family=Tajawal:wght@400;500;700;800&display=swap" rel="stylesheet">
        <style>
            .rtl-ar{
                direction: rtl;
                text-align: right;
                font-family: 'Tajawal', system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif !important;
            }
            .rtl-ar .form-group label{ font-weight:700; }
            .rtl-ar .text-danger{ font-size:.85rem; }
            .h-45{ height:45px; }
        </style>
    @endonce
@endpush

@section('panel')
<div class="row rtl-ar">
    <div class="col-md-12">
        <div class="card">
            @isset($pageTitle)
            <div class="card-header">
                <h5 class="m-0">{{ $pageTitle }}</h5>
            </div>
            @endisset

            <div class="card-body">
                <form action="{{ route('admin.driver.store') }}" method="POST" novalidate>
                    @csrf

                    <div class="form-group mb-3">
                        <label>@lang('الاسم')</label>
                        <input type="text" name="name" class="form-control" value="{{ old('name') }}" required>
                        @error('name') <div class="text-danger">{{ $message }}</div> @enderror
                    </div>

                    <div class="form-group mb-3">
                        <label>@lang('العمر')</label>
                        <input type="number" name="age" class="form-control" value="{{ old('age') }}" min="18" max="80" required>
                        @error('age') <div class="text-danger">{{ $message }}</div> @enderror
                    </div>

                    <div class="form-group mb-3">
                        <label>@lang('رقم الهاتف')</label>
                        <input type="text" name="phone" class="form-control" value="{{ old('phone') }}"
                               pattern="^[0-9+\-\s()]{7,20}$" placeholder="@lang('مثال: 0912345678')" required>
                        @error('phone') <div class="text-danger">{{ $message }}</div> @enderror
                    </div>

                    <div class="form-group mb-3">
                        <label>@lang('العنوان')</label>
                        <input type="text" name="address" class="form-control" value="{{ old('address') }}">
                        @error('address') <div class="text-danger">{{ $message }}</div> @enderror
                    </div>

                    <div class="form-group mb-3">
                        <label>@lang('رقم الرخصة')</label>
                        <input type="text" name="license_number" class="form-control" value="{{ old('license_number') }}"
                               pattern="^[A-Za-z0-9\-\/]{4,30}$" placeholder="@lang('مثال: AB-12345')">
                        @error('license_number') <div class="text-danger">{{ $message }}</div> @enderror
                    </div>

                    <button type="submit" class="btn btn--primary h-45 mt-2">@lang('حفظ')</button>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
