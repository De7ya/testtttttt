@extends('admin.layouts.app')

@push('style')
    @once
        <!-- استدعاء خط Tajawal -->
        <link href="https://fonts.googleapis.com/css2?family=Tajawal:wght@400;500;700;800&display=swap" rel="stylesheet">
        <style>
            /* تنسيق RTL وخط عربي */
            .rtl-ar {
                direction: rtl;
                text-align: right;
                font-family: 'Tajawal', system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif !important;
            }

            .rtl-ar .table th,
            .rtl-ar .table td {
                font-size: 0.95rem;
                vertical-align: middle;
            }

            .rtl-ar .table th { font-weight: 700; }
            .rtl-ar .fw-bold { font-weight: 700 !important; }
            .rtl-ar .small { font-weight: 500; opacity: 0.9; }

            .btn-outline--primary { font-size: 0.85rem; }
        </style>
    @endonce
@endpush

@section('panel')
    <div class="row justify-content-center rtl-ar">
        @if (request()->routeIs('admin.deposit.list') || request()->routeIs('admin.deposit.method'))
            <div class="col-12">
                @include('admin.deposit.widget')
            </div>
        @endif

        <div class="col-md-12">
            <div class="card">
                <div class="card-body p-0">
                    <div class="table-responsive--sm table-responsive">
                        <table class="table table--light style--two">
                            <thead>
                                <tr>
                                    <th>@lang('بوابة | معاملة')</th>
                                    <th>@lang('بدأت')</th>
                                    <th>@lang('المستخدم')</th>
                                    <th>@lang('الكمية')</th>
                                    {{-- أزيل عمود تحويل --}}
                                    <th>@lang('الحالة')</th>
                                    <th>@lang('الإجراء')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($deposits as $deposit)
                                    @php $details = $deposit->detail ? json_encode($deposit->detail) : null; @endphp
                                    <tr>
                                        <td>
                                            {{-- تم حذف اسم البوابة والإبقاء على رقم المعاملة فقط --}}
                                            <span class="fw-bold d-block">{{ $deposit->trx }}</span>
                                        </td>

                                        <td>
                                            {{ showDateTime($deposit->created_at) }}<br>
                                            <span class="text-muted">{{ diffForHumans($deposit->created_at) }}</span>
                                        </td>

                                        <td>
                                            <br>
                                            <span class="small">
                                                <a href="{{ appendQuery('search', @$deposit->user->username) }}">
                                                </a>
                                            </span>
                                        </td>

                                        <td>
                                            {{-- ✅ عرض الإجمالي فقط (المبلغ + الرسوم) --}}
                                            <strong title="@lang('المبلغ مع الرسوم')">
                                                {{ showAmount(($deposit->amount ?? 0) + ($deposit->charge ?? 0)) }}
                                            </strong>
                                        </td>

                                        {{-- أزيلت خلية "تحويل" هنا بالكامل --}}

                                        <td>@php echo $deposit->statusBadge @endphp</td>

                                        <td>
                                            <a href="{{ route('admin.deposit.details', $deposit->id) }}"
                                               class="btn btn-sm btn-outline--primary ms-1">
                                                <i class="la la-desktop"></i> @lang('التفاصيل')
                                            </a>
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

                @if ($deposits->hasPages())
                    <div class="card-footer py-4 rtl-ar">
                        @php echo paginateLinks($deposits) @endphp
                    </div>
                @endif
            </div>
        </div>
    </div>
@endsection

@push('breadcrumb-plugins')
    <x-search-form dateSearch="yes" placeholder="@lang('اسم المستخدم / رقم المعاملة')" />
@endpush
