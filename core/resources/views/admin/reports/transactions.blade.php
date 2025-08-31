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
            .h-45{ height:45px; }
        </style>
    @endonce
@endpush

@section('panel')
<div class="row rtl-ar">

    <div class="col-lg-12">
        <div class="show-filter mb-3 text-end">
            <button type="button" class="btn btn-outline--primary showFilterBtn btn-sm">
                <i class="las la-filter"></i> @lang('فلترة')
            </button>
        </div>

        <div class="card responsive-filter-card mb-4">
            <div class="card-body">
                <form>
                    <div class="d-flex flex-wrap gap-4">
                        <div class="flex-grow-1">
                            <label>@lang('رقم المعاملة / اسم المستخدم')</label>
                            <input type="search" name="search" value="{{ request()->search }}" class="form-control">
                        </div>

                        <div class="flex-grow-1">
                            <label>@lang('النوع')</label>
                            <select name="trx_type" class="form-control select2" data-minimum-results-for-search="-1">
                                <option value="">@lang('الكل')</option>
                                <option value="+" @selected(request()->trx_type == '+')>@lang('زيادة')</option>
                                <option value="-" @selected(request()->trx_type == '-')>@lang('نقصان')</option>
                            </select>
                        </div>

                        <div class="flex-grow-1">
                            <label>@lang('ملاحظة')</label>
                            <select class="form-control select2" data-minimum-results-for-search="-1" name="remark">
                                <option value="">@lang('الكل')</option>
                                @foreach($remarks as $remark)
                                    <option value="{{ $remark->remark }}" @selected(request()->remark == $remark->remark)">
                                        {{ __(keyToTitle($remark->remark)) }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <div class="flex-grow-1">
                            <label>@lang('التاريخ')</label>
                            <input name="date" type="search" class="datepicker-here form-control bg--white pe-2 date-range"
                                   placeholder="@lang('تاريخ البدء - تاريخ الانتهاء')" autocomplete="off"
                                   value="{{ request()->date }}">
                        </div>

                        <div class="flex-grow-1 align-self-end">
                            <button class="btn btn--primary w-100 h-45">
                                <i class="fas fa-filter"></i> @lang('فلترة')
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div class="card">
            <div class="card-body p-0">
                <div class="table-responsive--sm table-responsive">
                    <table class="table table--light style--two">
                        <thead>
                            <tr>
                                <th>@lang('المستخدم')</th>
                                <th>@lang('رمز المعاملة')</th>
                                <th>@lang('تاريخ العملية')</th>
                                <th>@lang('المبلغ')</th>
                                <th>@lang('الرصيد بعد العملية')</th>
                                <th>@lang('التفاصيل')</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($transactions as $trx)
                                <tr>
                                    <td>
                                        <span class="fw-bold">{{ $trx->user->fullname }}</span>
                                        <br>
                                        <span class="small">
                                            <a href="{{ appendQuery('search',$trx->user->username) }}">
                                                <span>@</span>{{ $trx->user->username }}
                                            </a>
                                        </span>
                                    </td>

                                    <td><strong>{{ $trx->trx }}</strong></td>

                                    <td>
                                        {{ showDateTime($trx->created_at) }}<br>
                                        <span class="text-muted">{{ diffForHumans($trx->created_at) }}</span>
                                    </td>

                                    <td class="budget">
                                        <span class="fw-bold @if($trx->trx_type == '+') text--success @else text--danger @endif">
                                            {{ $trx->trx_type }} {{ showAmount($trx->amount) }}
                                        </span>
                                    </td>

                                    <td class="budget">{{ showAmount($trx->post_balance) }}</td>

                                    <td>{{ __($trx->details) }}</td>
                                </tr>
                            @empty
                                <tr>
                                    <td class="text-muted text-center" colspan="100%">{{ __($emptyMessage) }}</td>
                                </tr>
                            @endforelse

                        </tbody>
                    </table><!-- table end -->
                </div>
            </div>

            @if($transactions->hasPages())
                <div class="card-footer py-4 rtl-ar">
                    {{ paginateLinks($transactions) }}
                </div>
            @endif
        </div><!-- card end -->
    </div>
</div>

@endsection

@push('script-lib')
    <script src="{{ asset('assets/global/js/moment.min.js') }}"></script>
    <script src="{{ asset('assets/global/js/daterangepicker.min.js') }}"></script>
@endpush

@push('style-lib')
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/global/css/daterangepicker.css') }}">
@endpush

@push('script')
    <script>
        (function($){
            "use strict";

            const rangesAr = {
                'اليوم': [moment(), moment()],
                'أمس': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                'آخر 7 أيام': [moment().subtract(6, 'days'), moment()],
                'آخر 15 يومًا': [moment().subtract(14, 'days'), moment()],
                'آخر 30 يومًا': [moment().subtract(30, 'days'), moment()],
                'هذا الشهر': [moment().startOf('month'), moment().endOf('month')],
                'الشهر الماضي': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')],
                'آخر 6 أشهر': [moment().subtract(6, 'months').startOf('month'), moment().endOf('month')],
                'هذا العام': [moment().startOf('year'), moment().endOf('year')],
            };

            const datePicker = $('.date-range').daterangepicker({
                autoUpdateInput: false,
                showDropdowns: true,
                ranges: rangesAr,
                maxDate: moment(),
                locale: {
                    cancelLabel: 'مسح',
                    applyLabel: 'تطبيق',
                    fromLabel: 'من',
                    toLabel: 'إلى',
                    customRangeLabel: 'مخصص',
                    daysOfWeek: ['ح', 'ن', 'ث', 'ر', 'خ', 'ج', 'س'],
                    monthNames: ['يناير','فبراير','مارس','أبريل','مايو','يونيو','يوليو','أغسطس','سبتمبر','أكتوبر','نوفمبر','ديسمبر'],
                    firstDay: 6,
                    format: 'MMMM DD, YYYY'
                }
            });

            const changeDatePickerText = (event, startDate, endDate) => {
                $(event.target).val(startDate.format('MMMM DD, YYYY') + ' - ' + endDate.format('MMMM DD, YYYY'));
            }

            $('.date-range').on('apply.daterangepicker', (event, picker) =>
                changeDatePickerText(event, picker.startDate, picker.endDate)
            );

            if ($('.date-range').val()) {
                let dateRange = $('.date-range').val().split(' - ');
                $('.date-range').data('daterangepicker').setStartDate(new Date(dateRange[0]));
                $('.date-range').data('daterangepicker').setEndDate(new Date(dateRange[1]));
            }
        })(jQuery)
    </script>
@endpush
