<div class="input-group w-auto flex-fill">
    <input name="date" type="search" class="datepicker-here form-control bg--white pe-2 date-range" placeholder="@lang('تاريخ البدء - تاريخ الانتهاء')" autocomplete="off" value="{{ request()->date }}">
    <button class="btn btn--primary input-group-text"><i class="la la-search"></i></button>
</div>

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
            "use strict"

            const datePicker = $('.date-range').daterangepicker({
                autoUpdateInput: false,
                locale: {
                    cancelLabel: 'Clear'
                },
                showDropdowns: true,
                ranges: {
                    'اليوم': [moment(), moment()],
                    'الأمس': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                    'أخر 7 أيام': [moment().subtract(6, 'days'), moment()],
                    'أخر 15 يوم': [moment().subtract(14, 'days'), moment()],
                    'أخر 30 يوم': [moment().subtract(30, 'days'), moment()],
                    'هذا الشهر': [moment().startOf('month'), moment().endOf('month')],
                    'أخر شهر': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')],
                    'أخر ستة أشهر': [moment().subtract(6, 'months').startOf('month'), moment().endOf('month')],
                    'هذه السنة': [moment().startOf('year'), moment().endOf('year')],
                },
                maxDate: moment()
            });
            const changeDatePickerText = (event, startDate, endDate) => {
                $(event.target).val(startDate.format('MMMM DD, YYYY') + ' - ' + endDate.format('MMMM DD, YYYY'));
            }


            $('.date-range').on('apply.daterangepicker', (event, picker) => changeDatePickerText(event, picker.startDate, picker.endDate));


            if ($('.date-range').val()) {
                let dateRange = $('.date-range').val().split(' - ');
                $('.date-range').data('daterangepicker').setStartDate(new Date(dateRange[0]));
                $('.date-range').data('daterangepicker').setEndDate(new Date(dateRange[1]));
            }

        })(jQuery)
    </script>
@endpush
