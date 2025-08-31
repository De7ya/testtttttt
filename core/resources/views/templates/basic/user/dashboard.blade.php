@extends($activeTemplate . 'layouts.master')
@section('content')
    <!-- booking history Starts Here -->
    <section class="dashboard-section padding-top padding-bottom">
        <div class="container">
            <div class="dashboard-wrapper" >
                <div class="row pb-60 gy-4 justify-content-center" style="direction: rtl" >
                    <div class="col-lg-4 col-md-6 col-sm-10">
                        <div class="dashboard-widget">
                            <div class="dashboard-widget__content">
                                <p>@lang('إجمالي التذاكر المحجوزة')</p>
                                <h3 class="title">{{ __($widget['booked']) }}</h3>
                            </div>
                            <div class="dashboard-widget__icon">
                                <i class="las la-ticket-alt"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-10">
                        <div class="dashboard-widget" style="direction: rtl">
                            <div class="dashboard-widget__content">
                                <p>@lang('إجمالي التذاكر المرفوضة')</p>
                                <h3 class="title">{{ __($widget['rejected']) }}</h3>
                            </div>
                            <div class="dashboard-widget__icon">
                                <i class="las la-ticket-alt"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-10">
                        <div class="dashboard-widget">
                            <div class="dashboard-widget__content">
                                <p>@lang('إجمالي التذاكر المعلقة')</p>
                                <h3 class="title">{{ __($widget['pending']) }}</h3>
                            </div>
                            <div class="dashboard-widget__icon">
                                <i class="las la-ticket-alt"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="booking-table-wrapper"> 
                    <table class="booking-table" style="direction: rtl">
                        <thead>
                            <tr>
                                <th>@lang('رقم الحجز')</th>
                                <th>@lang('تكييف/بدون تكييف')</th>
                                <th>@lang('نقطة البداية')</th>
                                <th>@lang('نقطة النهاية')</th>
                                <th>@lang('تاريخ الرحلة')</th>
                                <th>@lang('وقت الاستلام')</th>
                                <th>@lang('المقاعد المحجوزة')</th>
                                <th>@lang('حالة')</th>
                                <th>@lang('أجرة')</th>
                                <th>@lang('الكل')</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($bookedTickets as $item)
                                <tr>
                                    <td class="ticket-no" data-label="@lang('رقم الرحلة')">{{ __($item->pnr_number) }}</td>
                                    <td class="" data-label="@lang('تكييف / بدون تكييف')">{{ $item->trip->fleetType->has_ac ? 'AC' : 'Non-Ac' }}</td>
                                    <td class="pickup" data-label="Starting Point">{{ __($item->pickup->name) }}</td>
                                    <td class="drop" data-label="Dropping Point">{{ __($item->drop->name) }}</td>
                                    <td class="date" data-label="Journey Date">{{ __(showDateTime($item->date_of_journey, 'd M, Y')) }}</td>
                                    <td class="time" data-label="Pickup Time">{{ __(showDateTime($item->trip->schedule->start_from, 'H:i a')) }}</td>
                                    <td class="seats" data-label="Booked Seats">{{ __(implode(',', $item->seats)) }}</td>
                                    <td data-label="@lang('الحالة')">
                                        @if ($item->status == 1)
                                            <span class="badge badge--success"> @lang('محجوز')</span>
                                        @elseif($item->status == 2)
                                            <span class="badge badge--warning"> @lang('معلق')</span>
                                        @else
                                            <span class="badge badge--danger"> @lang('مرفوض')</span>
                                        @endif
                                    </td>
                                    <td class="fare" data-label="Fare">{{ __(showAmount($item->sub_total)) }}</td>
                                    <td class="action" data-label="Action">
                                        <div class="action-button-wrapper">
                                            @if ($item->date_of_journey >= \Carbon\Carbon::today()->format('Y-m-d') && $item->status == 1)
                                                <a href="{{ route('user.ticket.print', $item->id) }}" target="_blank" class="print"><i class="las la-print"></i></a>
                                            @else
                                                <a href="javascript::void(0)" class="checkinfo" data-info="{{ $item }}" data-bs-toggle="modal" data-bs-target="#infoModal"><i class="las la-info-circle"></i></a>
                                            @endif
                                        </div>
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td class="text-center" colspan="100%">{{ $emptyMessage }}</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
                @if ($bookedTickets->hasPages())
                    <div class="custom-pagination">
                        {{ paginateLinks($bookedTickets) }}
                    </div>
                @endif
            </div>
        </div>
    </section>
    <!-- booking history end Here -->

    <div class="modal fade" id="infoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"> @lang('سجل حجز التذاكر')</h5>
                    <button type="button" class="w-auto btn--close" data-bs-dismiss="modal"><i class="las la-times"></i></button>
                </div>
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn--danger w-auto btn--sm px-3" data-bs-dismiss="modal">
                        @lang('مغلق')
                    </button>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('style')
    <style>
        .modal-body p:not(:last-child) {
            border-bottom: 1px dashed #ebebeb;
            padding: 5px 0;
        }
    </style>
@endpush

@push('style')
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Tajawal:wght@400;500;700;800&display=swap" rel="stylesheet">
    <style>
        /* 1) طبّق Tajawal على النصوص الشائعة فقط */
        body, h1, h2, h3, h4, h5, h6,
        p, a, span, small, strong, em, code,
        label, input, textarea, select, button,
        th, td, .title, .booking-table, .dashboard-widget,
        .modal, .form-control, .btn {
            font-family: "Tajawal", system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol" !important;
        }

        /* 2) استثناء وإرجاع عائلات الخط الصحيحة للأيقونات */
        .fa, .fas, .far, .fab, [class^="fa-"], [class*=" fa-"],
        .la, .las, .lar, .lab, [class^="la-"], [class*=" la-"],
        .flaticon, [class^="flaticon-"], [class*=" flaticon-"],
        .fa::before, .fas::before, .far::before, .fab::before, [class^="fa-"]::before, [class*=" fa-"]::before,
        .la::before, .las::before, .lar::before, .lab::before, [class^="la-"]::before, [class*=" la-"]::before,
        .flaticon::before, [class^="flaticon-"]::before, [class*=" flaticon-"]::before,
        .dropdown-toggle::after, .menu-item-has-children > a::after {
            font-family:
                "Line Awesome Free", "Line Awesome",
                "Font Awesome 6 Free", "Font Awesome 6 Brands",
                "Font Awesome 5 Free", "Font Awesome 5 Brands",
                "FontAwesome",
                "Flaticon" !important;
        }
    </style>
@endpush

@push('script')
    <script>
        "use strict"

        $('.checkinfo').on('click', function() {
            var info = $(this).data('info');
            var modal = $('#infoModal');
            var html = '';
            html += `
                    <p class="d-flex flex-wrap justify-content-between pt-0"><strong>@lang('تاريخ الرحلة')</strong>  <span>${info.date_of_journey}</span></p>
                    <p class="d-flex flex-wrap justify-content-between"><strong>@lang('رقم الرحلة')</strong>  <span>${info.pnr_number}</span></p>
                    <p class="d-flex flex-wrap justify-content-between"><strong>@lang('الطريق')</strong>  <span>${info.trip.start_from.name} @lang('الى') ${info.trip.end_to.name}</span></p>
                    <p class="d-flex flex-wrap justify-content-between"><strong>@lang('الأجرة')</strong>  <span>${parseInt(info.sub_total).toFixed(2)} {{ __(gs('cur_text')) }}</span></p>
                    <p class="d-flex flex-wrap justify-content-between"><strong>@lang('الحالة')</strong>  <span>${info.status == 1 ? '<span class="badge badge--success">@lang('ناجح')</span>' : info.status == 2 ? '<span class="badge badge--warning">@lang('معلقة')</span>' : '<span class="badge badge--danger">@lang('مرفوضة')</span>'}</span></p>
                `;
            modal.find('.modal-body').html(html);
        })
    </script>
@endpush
