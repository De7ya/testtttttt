@extends('admin.layouts.app')

@push('style')
    @once
        <!-- إضافة خط Tajawal -->
        <link href="https://fonts.googleapis.com/css2?family=Tajawal:wght@400;500;700;800&display=swap" rel="stylesheet">
        <style>
            .rtl-ar {
                direction: rtl;
                text-align: right;
                font-family: 'Tajawal', system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif !important;
            }
            .rtl-ar .table th,
            .rtl-ar .table td {
                vertical-align: middle;
                font-size: 0.95rem;
            }
            .rtl-ar .table th {
                font-weight: 700;
            }
            .rtl-ar .fw-bold {
                font-weight: 700 !important;
            }
            .badge {
                font-size: 0.85rem;
            }
            .btn-outline--primary {
                font-size: 0.85rem;
            }
        </style>
    @endonce
@endpush

@section('panel')
    <div class="row rtl-ar">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body p-0">
                    <div class="table-responsive--sm table-responsive">
                        <table class="table table--light style--two">
                            <thead>
                                <tr>
                                    <th>@lang('الموضوع')</th>
                                    <th>@lang('مُقدَّم بواسطة')</th>
                                    <th>@lang('الحالة')</th>
                                    <th>@lang('الأولوية')</th>
                                    <th>@lang('آخر رد')</th>
                                    <th>@lang('الإجراء')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($items as $item)
                                    <tr>
                                        <td>
                                            <a href="{{ route('admin.ticket.view', $item->id) }}" class="fw-bold">
                                                [@lang('تذكرة')#{{ $item->ticket }}] {{ strLimit($item->subject, 30) }}
                                            </a>
                                        </td>
                                        <td>
                                            @if($item->user_id)
                                                <a href="{{ route('admin.users.detail', $item->user_id) }}">{{ @$item->user->fullname }}</a>
                                            @else
                                                <p class="fw-bold">{{ $item->name }}</p>
                                            @endif
                                        </td>
                                        <td>@php echo $item->statusBadge; @endphp</td>
                                        <td>
                                            @if($item->priority == Status::PRIORITY_LOW)
                                                <span class="badge badge--dark">@lang('منخفض')</span>
                                            @elseif($item->priority == Status::PRIORITY_MEDIUM)
                                                <span class="badge badge--warning">@lang('متوسط')</span>
                                            @elseif($item->priority == Status::PRIORITY_HIGH)
                                                <span class="badge badge--danger">@lang('عالي')</span>
                                            @endif
                                        </td>
                                        <td>{{ diffForHumans($item->last_reply) }}</td>
                                        <td>
                                            <a href="{{ route('admin.ticket.view', $item->id) }}" class="btn btn-sm btn-outline--primary ms-1">
                                                <i class="las la-desktop"></i> @lang('التفاصيل')
                                            </a>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td class="text-muted text-center" colspan="100%">@lang('لا توجد بيانات')</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
                @if ($items->hasPages())
                    <div class="card-footer py-4 rtl-ar">
                        {{ paginateLinks($items) }}
                    </div>
                @endif
            </div>
        </div>
    </div>
@endsection

@push('breadcrumb-plugins')
    <x-search-form placeholder="@lang('ابحث هنا...')" />
@endpush
