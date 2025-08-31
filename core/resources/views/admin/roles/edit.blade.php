@extends('admin.layouts.app')

@section('panel')
<div class="row mb-none-30">
  <div class="col-xl-12 col-lg-12 col-md-12 mb-30">
    <div class="card">
      <h5 class="card-header">@lang('تعديل صلاحية')</h5>
      <div class="card-body">
        @include('admin.role.partials.edit_form', ['role' => $role])
      </div>
    </div>
  </div>
</div>
@endsection

@push('breadcrumb-plugins')
  <a href="{{ route('admin.role.index') }}" class="btn btn-sm btn--secondary">
    <i class="la la-arrow-right"></i> @lang('عودة للقائمة')
  </a>
@endpush
