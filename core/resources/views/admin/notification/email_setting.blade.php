@extends('admin.layouts.app')
@section('panel')
@push('topBar')
  @include('admin.notification.top_bar')
@endpush
<div class="row">
        <div class="col-md-12">
            <div class="card">
                <form method="POST">
                    @csrf
                    <div class="card-body">
                        <div class="form-group">
                            <label>@lang('طريقة إرسال البريد الإلكتروني')</label>
                            <select name="email_method" class="select2 form-control" data-minimum-results-for-search="-1">
                                <option value="php" @if (gs('mail_config')->name == 'php') selected @endif>@lang('بريد PHP')</option>
                                <option value="smtp" @if (gs('mail_config')->name == 'smtp') selected @endif>@lang('SMTP')</option>
                                <option value="sendgrid" @if (gs('mail_config')->name == 'sendgrid') selected @endif>@lang('SendGrid API')</option>
                                <option value="mailjet" @if (gs('mail_config')->name == 'mailjet') selected @endif>@lang('Mailjet API')</option>
                            </select>
                        </div>
                        <div class="row mt-4 d-none configForm" id="smtp">
                            <div class="col-md-12">
                                <h6 class="mb-2">@lang('تكوين SMTP')</h6>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>@lang('يستضيف') </label>
                                    <input type="text" class="form-control" placeholder="e.g. @lang('smtp.googlemail.com')" name="host" value="{{ gs('mail_config')->host ?? '' }}">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>@lang('Port') </label>
                                    <input type="text" class="form-control" placeholder="@lang('Available port')" name="port" value="{{ gs('mail_config')->port ?? '' }}">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>@lang('التشفير')</label>
                                    <select class="form-control select2" data-minimum-results-for-search="-1" name="enc">
                                        <option value="ssl" @selected(@gs('mail_config')->enc == 'ssl')>@lang('SSL')</option>
                                        <option value="tls" @selected(@gs('mail_config')->enc == 'tls')>@lang('TLS')</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>@lang('اسم المستخدم') </label>
                                    <input type="text" class="form-control" placeholder="@lang('عادةً ما يكون بريدك الإلكتروني') address" name="username" value="{{ gs('mail_config')->username ?? '' }}">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>@lang('كلمة المرور') </label>
                                    <input type="text" class="form-control" placeholder="@lang('عادةً ما تكون كلمة مرور بريدك الإلكتروني')" name="password" value="{{ gs('mail_config')->password ?? '' }}">
                                </div>
                            </div>
                        </div>
                        <div class="row mt-4 d-none configForm" id="sendgrid">
                            <div class="col-md-12">
                                <h6 class="mb-2">@lang('SendGrid API Configuration')</h6>
                            </div>
                            <div class="form-group col-md-12">
                                <label>@lang('مفتاح التطبيق') </label>
                                <input type="text" class="form-control" placeholder="@lang('مفتاح تطبيق SendGrid')" name="appkey" value="{{ gs('mail_config')->appkey ?? '' }}">
                            </div>
                        </div>
                        <div class="row mt-4 d-none configForm" id="mailjet">
                            <div class="col-md-12">
                                <h6 class="mb-2">@lang('Mailjet API Configuration')</h6>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>@lang('Api Public Key') </label>
                                    <input type="text" class="form-control" placeholder="@lang('مفتاح عام لـ API Mailjet')" name="public_key" value="{{ gs('mail_config')->public_key ?? '' }}">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>@lang('Api Secret Key') </label>
                                    <input type="text" class="form-control" placeholder="@lang('مفتاح سري لـ Mailjet API')" name="secret_key" value="{{ gs('mail_config')->secret_key ?? '' }}">
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn--primary w-100 h-45">@lang('تأكيد')</button>
                    </div>
                </form>
            </div><!-- card end -->
        </div>


    </div>


    {{-- TEST MAIL MODAL --}}
    <div id="testMailModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">@lang('Test Mail Setup')</h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>
                <form action="{{ route('admin.setting.notification.email.test') }}" method="POST">
                    @csrf
                    <input type="hidden" name="id">
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>@lang('تم الإرسال إلى') </label>
                                    <input type="text" name="email" class="form-control" placeholder="@lang('عنوان البريد الإلكتروني')">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn--primary w-100 h-45">@lang('تأكيد')</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
@push('breadcrumb-plugins')
    <button type="button" data-bs-target="#testMailModal" data-bs-toggle="modal" class="btn btn-sm btn-outline--primary"><i class="las la-paper-plane"></i> @lang('إرسال بريد اختباري')</button>
@endpush

@push('script')
    <script>
        (function($) {
            "use strict";



            var method = '{{ gs('mail_config')->name }}';
            emailMethod(method);
            $('select[name=email_method]').on('change', function() {
                var method = $(this).val();
                emailMethod(method);
            });

            function emailMethod(method) {
                $('.configForm').addClass('d-none');
                if (method != 'php') {
                    $(`#${method}`).removeClass('d-none');
                }
            }

        })(jQuery);
    </script>
@endpush
