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
                                    <th>@lang('نوع الأسطول')</th>
                                    <th>@lang('الطريق')</th>
                                    <th>@lang('السعر')</th>
                                    <th>@lang('الإجراء')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($prices as $item)
                                    <tr>
                                        <td>{{ __($item->fleetType->name) }}</td>
                                        <td>{{ __($item->route->name) }}</td>
                                        <td>{{ showAmount($item->price) }}</td>
                                        <td>
                                            <div class="button--group">
                                                <a href="{{ route('admin.trip.ticket.price.edit', $item->id) }}"
                                                   class="btn btn-sm btn-outline--primary">
                                                    <i class="la la-pencil"></i> @lang('تعديل')
                                                </a>

                                                <button type="button"
                                                        class="btn btn-sm btn-outline--danger confirmationBtn"
                                                        data-question="@lang('هل أنت متأكد من إزالة قائمة الأسعار؟')"
                                                        data-action="{{ route('admin.trip.ticket.price.delete', $item->id) }}">
                                                    <i class="la la-trash"></i> @lang('إزالة')
                                                </button>
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

                @if ($prices->hasPages())
                    <div class="card-footer py-4 rtl-ar">
                        {{ paginateLinks($prices) }}
                    </div>
                @endif
            </div>
        </div>
    </div>

    <x-confirmation-modal />
@endsection

@push('breadcrumb-plugins')
    <a href="{{ route('admin.trip.ticket.price.create') }}" class="btn btn-sm btn-outline--primary">
        <i class="las la-plus"></i> @lang('إضافة جديد')
    </a>
@endpush
