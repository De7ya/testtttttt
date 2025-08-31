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
                                    <th>@lang('الاسم')</th>
                                    <th>@lang('نقطة البداية')</th>
                                    <th>@lang('نقطة النهاية')</th>
                                    <th>@lang('المسافة')</th>
                                    <th>@lang('الوقت')</th>
                                    <th>@lang('الحالة')</th>
                                    <th>@lang('الإجراء')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($routes as $item)
                                    <tr>
                                        <td>{{ __($item->name) }}</td>
                                        <td>{{ __($item->startFrom->name) }}</td>
                                        <td>{{ __($item->endTo->name) }}</td>
                                        <td>{{ __($item->distance) }}</td>
                                        <td>{{ __($item->time) }}</td>
                                        <td>@php echo $item->statusBadge; @endphp</td>
                                        <td>
                                            <div class="button--group">
                                                <a href="{{ route('admin.trip.route.edit',$item->id) }}"
                                                   class="btn btn-sm btn-outline--primary">
                                                    <i class="la la-pencil"></i> @lang('تعديل')
                                                </a>

                                                @if (!$item->status)
                                                    <button type="button"
                                                            class="btn btn-sm btn-outline--success confirmationBtn"
                                                            data-action="{{ route('admin.trip.route.status', $item->id) }}"
                                                            data-question="@lang('هل أنت متأكد من تمكين هذا المسار؟')">
                                                        <i class="la la-eye"></i> @lang('تفعيل')
                                                    </button>
                                                @else
                                                    <button type="button"
                                                            class="btn btn-sm btn-outline--danger confirmationBtn"
                                                            data-action="{{ route('admin.trip.route.status', $item->id) }}"
                                                            data-question="@lang('هل أنت متأكد من تعطيل هذا المسار؟')">
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

                @if ($routes->hasPages())
                    <div class="card-footer py-4 rtl-ar">
                        @php echo paginateLinks($routes) @endphp
                    </div>
                @endif
            </div>
        </div>
    </div>

    <x-confirmation-modal />
@endsection

@push('breadcrumb-plugins')
    <x-search-form placeholder="@lang('ابحث بالاسم...')" />
    <a href="{{ route('admin.trip.route.create') }}" class="btn btn-sm btn-outline--primary h-45">
        <i class="las la-plus"></i> @lang('إضافة جديد')
    </a>
@endpush
