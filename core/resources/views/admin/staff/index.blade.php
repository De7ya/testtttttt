@extends('admin.layouts.app')

@section('panel')

<div class="row">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-body p-0">
                <div class="table-responsive--md table-responsive">
                    <table class="table table--light style--two">
                        <thead>
                            <tr>
                                <th>@lang('الاسم')</th>
                                <th>@lang('بريد الإلكتروني')</th>
                                <th>@lang('رقم الهاتف')</th>
                                <th>@lang('الحالة')</th>
                                <th>@lang('الإجراءات')</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($staffs as $staff)
                            <tr>
                                <td>{{ $staff->name }}</td>
                                <td>{{ $staff->email }}</td>
                                <td>{{ $staff->phone }}</td>
                                <td>{{ $staff->status }}</td>
                                <td>
                                    <div class="button--group">
                                        <a href="#" class="btn btn-sm btn-outline--primary">
                                            <i class="las la-eye"></i> @lang('التفاصيل')
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            @empty
                            <tr>
                                <td class="text-muted text-center" colspan="100%">
                                    {{ __($emptyMessage ?? 'لا توجد بيانات') }}
                                </td>
                            </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

{{-- Modal --}}
<div id="cuModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form action="{{ route('admin.staff.store') }}" method="POST">
                @csrf
                <div class="modal-header">
                    <h5 class="modal-title">@lang('إضافة موظف جديد')</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="إغلاق"></button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>@lang('الاسم')</label>
                        <input type="text" class="form-control" name="name" required>
                    </div>
                    <div class="form-group">
                        <label>@lang('بريد الإلكتروني')</label>
                        <input type="email" class="form-control" name="email" required>
                    </div>
                    <div class="form-group">
                        <label>@lang('رقم الهاتف')</label>
                        <input type="text" class="form-control" name="phone" required>
                    </div>
                    <div class="form-group">
                        <label>@lang('الحالة')</label>
                        <select name="status" class="form-control" required>
                            <option value="active">@lang('نشط')</option>
                            <option value="suspended">@lang('معلق')</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn--primary w-100">@lang('حفظ')</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection

@push('breadcrumb-plugins')
    <button type="button"
        class="btn btn-outline--primary"
        data-bs-toggle="modal"
        data-bs-target="#cuModal"
        data-modal_title="@lang('إضافة موظف جديد')">
        <i class="las la-plus"></i> @lang('إضافة موظف جديد')
    </button>
@endpush

@push('breadcrumb-plugins')
    <x-search-form placeholder="الاسم / الهاتف" />
@endpush

@push('style')
<link href="https://fonts.googleapis.com/css2?family=Tajawal:wght@400;500;700&display=swap" rel="stylesheet">
<style>
    html, body {
        font-family: 'Tajawal', system-ui, -apple-system, Segoe UI, Roboto, "Helvetica Neue", Arial, "Noto Sans", "Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
    }
</style>
@endpush
