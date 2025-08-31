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
                                <th>@lang('العمر')</th>
                                <th>@lang('الرقم')</th>
                                <th>@lang('العنوان')</th>
                                <th>@lang('رقم الرخصة')</th>
                                <th>@lang('حدث')</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($users as $driver)
                          
                            <tr>
                                <td>{{ $driver->name }}</td>
                                <td>{{ $driver->age }}</td>
                                <td>{{ $driver->phone }}</td>
                                <td>{{ $driver->address }}</td>
                                <td>{{ $driver->license_number }}</td>
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
            <form action="{{ route('admin.driver.store') }}" method="POST">
                @csrf
                <div class="modal-header">
                    <h5 class="modal-title">@lang('إضافة سائق جديد')</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>@lang('الاسم')</label>
                        <input type="text" class="form-control" name="name" required>
                    </div>
                    <div class="form-group">
                        <label>@lang('العمر')</label>
                        <input type="number" class="form-control" name="age" required>
                    </div>
                    <div class="form-group">
                        <label>@lang('رقم الهاتف')</label>
                        <input type="text" class="form-control" name="phone" required>
                    </div>
                    <div class="form-group">
                        <label>@lang('العنوان')</label>
                        <input type="text" class="form-control" name="address">
                    </div>
                    <div class="form-group">
                        <label>@lang('رقم الرخصة')</label>
                        <input type="text" class="form-control" name="license_number">
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
        data-modal_title="@lang('إضافة سائق جديد')">
        <i class="las la-plus"></i> @lang('إضافة سائق جديد')
    </button>
@endpush

@push('breadcrumb-plugins')
    <x-search-form placeholder="Name / Phone" />
@endpush
