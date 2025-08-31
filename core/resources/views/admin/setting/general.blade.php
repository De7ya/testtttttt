@extends('admin.layouts.app')
@section('panel')
    <div class="row mb-none-30">
        <div class="col-lg-12 col-md-12 mb-30">
            <div class="card">
                <div class="card-body">
                    <form method="POST">
                        @csrf
                        <div class="row">
                            <div class="col-xl-3 col-sm-6">
                                <div class="form-group ">
                                    <label> @lang('عنوان الموقع')</label>
                                    <input class="form-control" type="text" name="site_name" required value="{{gs('site_name')}}">
                                </div>
                            </div>
                            <div class="col-xl-3 col-sm-6">
                                <div class="form-group ">
                                    <label>@lang('عملة')</label>
                                    <input class="form-control" type="text" name="cur_text" required value="{{gs('cur_text')}}">
                                </div>
                            </div>
                            <div class="col-xl-3 col-sm-6">
                                <div class="form-group ">
                                    <label>@lang('رمز العملة')</label>
                                    <input class="form-control" type="text" name="cur_sym" required value="{{gs('cur_sym')}}">
                                </div>
                            </div>
                            <div class="form-group col-xl-3 col-sm-6">
                                <label class="required"> @lang('التوقيت')</label>
                                <select class="select2 form-control" name="timezone" >
                                    @foreach($timezones as $key => $timezone)
                                    <option value="{{ @$key}}" @selected(@$key == $currentTimezone)>{{ __($timezone) }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-xl-3 col-sm-6">
                                <label class="required"> @lang('لون قاعدة الموقع')</label>
                                <div class="input-group">
                                    <span class="input-group-text p-0 border-0">
                                        <input type='text' class="form-control colorPicker" value="{{gs('base_color')}}">
                                    </span>
                                    <input type="text" class="form-control colorCode" name="base_color" value="{{ gs('base_color') }}">
                                </div>
                            </div>
                            <div class="form-group col-xl-3 col-sm-6">
                                <label> @lang('سجل للعرض لكل صفحة')</label>
                                <select class="select2 form-control" name="paginate_number" data-minimum-results-for-search="-1">
                                    <option value="20" @selected(gs('paginate_number') == 20 )>@lang('20 عنصرًا في الصفحة')</option>
                                    <option value="50" @selected(gs('paginate_number') == 50 )>@lang('50 عنصرًا في الصفحة')</option>
                                    <option value="100" @selected(gs('paginate_number') == 100 )>@lang('100 عنصر في الصفحة')</option>
                                </select>
                            </div>

                            <div class="form-group col-xl-3 col-sm-6 ">
                                <label class="required"> @lang('تنسيق عرض العملة')</label>
                                <select class="select2 form-control" name="currency_format" data-minimum-results-for-search="-1">
                                    <option value="1" @selected(gs('currency_format') == Status::CUR_BOTH)>@lang('إظهار نص العملة ورمزها معًا')</option>
                                    <option value="2" @selected(gs('currency_format') == Status::CUR_TEXT)>@lang('إظهار نص العملة فقط')</option>
                                    <option value="3" @selected(gs('currency_format') == Status::CUR_SYM)>@lang('إظهار رمز العملة فقط')</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <button type="submit" class="btn btn--primary w-100 h-45">@lang('تأكيد')</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection


@push('script-lib')
<script src="{{ asset('assets/admin/js/spectrum.js') }}"></script>
@endpush

@push('style-lib')
    <link rel="stylesheet" href="{{ asset('assets/admin/css/spectrum.css') }}">
@endpush

@push('script')
    <script>
        (function ($) {
            "use strict";


            $('.colorPicker').spectrum({
                color: $(this).data('color'),
                change: function (color) {
                    $(this).parent().siblings('.colorCode').val(color.toHexString().replace(/^#?/, ''));
                }
            });

            $('.colorCode').on('input', function () {
                var clr = $(this).val();
                $(this).parents('.input-group').find('.colorPicker').spectrum({
                    color: clr,
                });
            });
        })(jQuery);

    </script>
@endpush

