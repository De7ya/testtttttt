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
            .rtl-ar .table th,
            .rtl-ar .table td{
                vertical-align: middle;
                font-size: .95rem;
            }
            .rtl-ar .table thead th{ font-weight:700; }
            .rtl-ar .fw-bold{ font-weight:700 !important; }
            .rtl-ar .small{ font-size:.85rem; }
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
                                    <th>@lang('الاسم')</th>
                                    <th>@lang('رقم الهاتف')</th>
                                    <th>@lang('المدينة')</th>
                                    <th>@lang('الموقع')</th>
                                    <th>@lang('الحالة')</th>
                                    <th>@lang('الإجراء')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($counters as $item)
                                    <tr>
                                        <td>{{ __($item->name) }}</td>
                                        <td>{{ __($item->mobile) }}</td>
                                        <td>{{ __($item->city) }}</td>
                                        <td>{{ __($item->location) ?? '--' }}</td>
                                        <td>@php echo $item->statusBadge; @endphp</td>
                                        <td>
                                            <div class="button--group">
                                                <button type="button"
                                                        class="btn btn-sm btn-outline--primary cuModalBtn"
                                                        data-resource="{{ $item }}"
                                                        data-modal_title="@lang('تعديل العداد')">
                                                    <i class="la la-pencil"></i> @lang('تعديل')
                                                </button>

                                                @if (!$item->status)
                                                    <button type="button"
                                                            class="btn btn-sm btn-outline--success confirmationBtn"
                                                            data-action="{{ route('admin.counter.status', $item->id) }}"
                                                            data-question="@lang('هل أنت متأكد من تفعيل هذا العداد؟')">
                                                        <i class="la la-eye"></i> @lang('تفعيل')
                                                    </button>
                                                @else
                                                    <button type="button"
                                                            class="btn btn-sm btn-outline--danger confirmationBtn"
                                                            data-action="{{ route('admin.counter.status', $item->id) }}"
                                                            data-question="@lang('هل أنت متأكد من تعطيل هذا العداد؟')">
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

                @if ($counters->hasPages())
                    <div class="card-footer py-4 rtl-ar">
                        {{ paginateLinks($counters) }}
                    </div>
                @endif
            </div>
        </div>
    </div>

    <x-confirmation-modal />

    <!-- Modal: إضافة/تعديل عداد -->
    <div id="cuModal" class="modal fade rtl-ar" tabindex="-1" role="dialog" aria-labelledby="cuModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 id="cuModalLabel" class="modal-title"></h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>
                <form action="{{ route('admin.counter.store') }}" method="POST">
                    @csrf
                    <div class="modal-body">
                        <div class="form-group">
                            <label>@lang('الاسم')</label>
                            <input type="text" class="form-control" name="name" required>
                        </div>

                        <div class="form-group">
                            <label>@lang('المدينة')</label>
                            <input type="text" class="form-control" name="city" required>
                        </div>

                        <div class="form-group">
                            <label>@lang('الموقع')</label>
                            <textarea name="location" class="form-control" rows="3"></textarea>
                        </div>

                        <div class="form-group">
                            <label>@lang('الهاتف')</label>
                            <input type="text" class="form-control" name="mobile" required>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="submit" class="btn btn--primary h-45 w-100">@lang('تأكيد')</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@push('breadcrumb-plugins')
    <x-search-form placeholder="@lang('ابحث بالاسم...')" />

    @if(!empty($canAddCounter) && $canAddCounter)
        <button type="button"
                class="btn btn-sm btn-outline--primary h-45 cuModalBtn"
                data-modal_title="@lang('إضافة عداد جديد')">
            <i class="las la-plus"></i> @lang('إضافة جديد')
        </button>
    @endif
@endpush

@if(!empty($canAddCounter) && $canAddCounter)
    {{-- Include the Add Counter modal + JS here --}}
@endif

@push('script-lib')
    <script src="{{ asset('assets/admin/js/cu-modal.js') }}"></script>
@endpush
