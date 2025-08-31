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
            .rtl-ar .table th, .rtl-ar .table td{
                vertical-align: middle;
                font-size: .95rem;
            }
            .rtl-ar .table thead th{ font-weight:700; }
            .button--group .btn{ margin-inline: .2rem; }
            .h-45{ height:45px; }
        </style>
    @endonce
@endpush

@section('panel')
    <div class="row rtl-ar">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body p-0">
                    <div class="table-responsive--sm table-responsive">
                        <table class="table table--light style--two">
                            <thead>
                                <tr>
                                    <th>@lang('الكنية')</th>
                                    <th>@lang('رقم التسجيل')</th>
                                    <th>@lang('رقم المحرك')</th>
                                    <th>@lang('رقم الهيكل')</th>
                                    <th>@lang('رقم الموديل')</th>
                                    <th>@lang('نوع الأسطول')</th>
                                    <th>@lang('الحالة')</th>
                                    <th>@lang('الإجراء')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($vehicles as $item)
                                    <tr>
                                        <td>{{ __($item->nick_name) }}</td>
                                        <td>{{ __($item->register_no) }}</td>
                                        <td>{{ __($item->engine_no) }}</td>
                                        <td>{{ __($item->chasis_no) }}</td>
                                        <td>{{ __($item->model_no) }}</td>
                                        <td>{{ __($item->fleetType->name) }}</td>
                                        <td>@php echo $item->statusBadge; @endphp</td>
                                        <td>
                                            <div class="button--group">
                                                <button type="button"
                                                        class="btn btn-sm btn-outline--primary cuModalBtn"
                                                        data-resource='@json($item)'
                                                        data-modal_title="@lang('تعديل المركبة')">
                                                    <i class="la la-pencil"></i> @lang('تعديل')
                                                </button>

                                                @if (!$item->status)
                                                    <button type="button"
                                                            class="btn btn-sm btn-outline--success confirmationBtn"
                                                            data-action="{{ route('admin.fleet.vehicles.status', $item->id) }}"
                                                            data-question="@lang('هل أنت متأكد من تمكين هذه المركبة؟')">
                                                        <i class="la la-eye"></i> @lang('تفعيل')
                                                    </button>
                                                @else
                                                    <button type="button"
                                                            class="btn btn-sm btn-outline--danger confirmationBtn"
                                                            data-action="{{ route('admin.fleet.vehicles.status', $item->id) }}"
                                                            data-question="@lang('هل أنت متأكد من تعطيل هذه المركبة؟')">
                                                        <i class="la la-eye-slash"></i> @lang('تعطيل')
                                                    </button>
                                                @endif
                                            </div>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td class="text-muted text-center" colspan="100%">{{ __($emptyMessage) }}</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>

                @if ($vehicles->hasPages())
                    <div class="card-footer py-4 rtl-ar">
                        {{ paginateLinks($vehicles) }}
                    </div>
                @endif
            </div>
        </div>
    </div>

    <!-- Modal: إضافة/تعديل مركبة -->
    <div id="cuModal" class="modal fade rtl-ar" tabindex="-1" role="dialog" aria-labelledby="cuModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 id="cuModalLabel" class="modal-title"></h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>
                <form action="{{ route('admin.fleet.vehicles.store') }}" method="POST">
                    @csrf
                    <div class="modal-body">
                        <div class="form-group">
                            <label>@lang('الكنية')</label>
                            <input type="text" class="form-control" name="nick_name" required>
                        </div>

                        <div class="form-group">
                            <label>@lang('نوع الأسطول')</label>
                            <select name="fleet_type_id" class="form-control select2" data-minimum-results-for-search="-1" required>
                                <option value="">@lang('حدد خيارًا')</option>
                                @foreach ($fleetType as $ft)
                                    <option value="{{ $ft->id }}">{{ __($ft->name) }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="form-group">
                            <label>@lang('رقم التسجيل')</label>
                            <input type="text" class="form-control" name="register_no" required>
                        </div>

                        <div class="form-group">
                            <label>@lang('رقم المحرك')</label>
                            <input type="text" class="form-control" name="engine_no" required>
                        </div>

                        <div class="form-group">
                            <label>@lang('رقم الهيكل')</label>
                            <input type="text" class="form-control" name="chasis_no" required>
                        </div>

                        <div class="form-group">
                            <label>@lang('رقم الموديل')</label>
                            <input type="text" class="form-control" name="model_no" required>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="submit" class="btn btn--primary w-100 h-45">@lang('تأكيد')</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <x-confirmation-modal />
@endsection

@push('breadcrumb-plugins')
    <x-search-form placeholder="@lang('ابحث بالاسم...')" />
    <button type="button" class="btn btn-outline--primary cuModalBtn" data-modal_title="@lang('إضافة مركبة جديدة')">
        <i class="las la-plus"></i> @lang('إضافة جديد')
    </button>
@endpush

@push('script-lib')
    <script src="{{ asset('assets/admin/js/cu-modal.js') }}"></script>
@endpush
