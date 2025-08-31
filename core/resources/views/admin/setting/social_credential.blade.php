@extends('admin.layouts.app')
@section('panel')
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body p-0">
                    <div class="table-responsive--sm table-responsive">
                        <table class="table table--light style--two custom-data-table">
                            <thead>
                                <tr>
                                    <th>@lang('عنوان')</th>
                                    <th>@lang('معرّف العميل')</th>
                                    <th>@lang('الحالة')</th>
                                    <th>@lang('الإجراء')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach (gs('socialite_credentials') as $key => $credential)
                                    <tr>
                                        <td class="fw-bold">{{ ucfirst($key) }}</td>
                                        <td>{{ $credential->client_id }}</td>
                                        <td>
                                            @if (@$credential->status == Status::ENABLE)
                                                <span class="badge badge--success">@lang('مفعل')</span>
                                            @else
                                                <span class="badge badge--warning">@lang('معطل')</span>
                                            @endif
                                        </td>
                                        <td>
                                            <div class="button--group">
                                                <button class="btn btn-outline--primary btn-sm editBtn"
                                                    data-client_id="{{ $credential->client_id }}"
                                                    data-client_secret="{{ $credential->client_secret }}"
                                                    data-key="{{ $key }}"><i class="la la-cogs"></i>
                                                    @lang('تهيئة')
                                                </button>
                                                <button type="button" class="btn btn-sm btn-outline--dark helpBtn" data-target-key="{{ $key }}">
                                                    <i class="la la-question"></i> @lang('مساعدة')
                                                </button>
                                                @if (@$credential->status == Status::ENABLE)
                                                    <button class="btn btn-outline--danger btn-sm confirmationBtn"  data-question="@lang('Are you sure that you want to disable this login credential?')" data-action="{{ route('admin.setting.socialite.credentials.status.update', $key) }}">
                                                        <i class="las la-eye-slash"></i>@lang('تعطيل')
                                                    </button>
                                                @else
                                                    <button class="btn btn-outline--success btn-sm confirmationBtn" data-question="@lang('Are you sure that you want to enable login credential?')" data-action="{{ route('admin.setting.socialite.credentials.status.update', $key) }}">
                                                        <i  class="las la-eye"></i>@lang('تفعيل')
                                                    </button>
                                                @endif
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit -->
    <div id="editModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">@lang('تحديث بيانات الهوية'): <span class="credential-name"></span></h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>
                <form method="POST">
                    @csrf
                    <div class="modal-body">
                        <div class="form-group">
                            <label>@lang('معرّف العميل')</label>
                            <input type="text" class="form-control" name="client_id">
                        </div>
                        <div class="form-group">
                            <label>@lang('السر الخاص بالعميل')</label>
                            <input type="text" class="form-control" name="client_secret">
                        </div>
                        <div class="form-group">
                            <label>@lang('عنوان الاستدعاء')</label>
                            <div class="input-group">
                                <input type="text" class="form-control callback" readonly>
                                <button type="button" class="input-group-text copyInput" title="@lang('نسخ')">
                                    <i class="las la-clipboard"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn--primary w-100 h-45"
                            id="editBtn">@lang('تأكيد')</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Help -->
    <div id="helpModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">@lang('كيفية الحصول على') <span class="title-key"></span> @lang('بيانات الاعتماد')?</h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>
                <div class="modal-body">

                </div>
            </div>
        </div>
    </div>

    <x-confirmation-modal />
@endsection

@push('script')
    <script>
        (function($) {
            "use strict";
            $(document).on('click', '.editBtn', function() {
                let modal = $('#editModal');
                let data = $(this).data();
                let route = "{{ route('admin.setting.socialite.credentials.update', '') }}";
                let callbackUrl = "{{ route('user.social.login.callback', '') }}";
                modal.find('form').attr('action', `${route}/${data.key}`);
                modal.find('.credential-name').text(data.key);
                modal.find('[name=client_id]').val(data.client_id);
                modal.find('[name=client_secret]').val(data.client_secret);
                modal.find('.callback').val(`${callbackUrl}/${data.key}`);
                modal.modal('show');
            });
            $('.copyInput').on('click', function(e) {
                var copybtn = $(this);
                var input = copybtn.closest('.input-group').find('input');
                if (input && input.select) {
                    input.select();
                    try {
                        document.execCommand('SelectAll')
                        document.execCommand('Copy', false, null);
                        input.blur();
                        notify('success', `Copied: ${copybtn.closest('.input-group').find('input').val()}`);
                    } catch (err) {
                        alert('Please press Ctrl/Cmd + C to copy');
                    }
                }
            });

            $(document).on('click', '.helpBtn', function() {
                var modal = $('#helpModal');

                let rules = '';
                let key = $(this).data('target-key');
                modal.find('.title-key').text(key);

                if (key == 'google') {

                    rules = `<ul class="list-group list-group-flush">
                        <li class="list-group-item"><b>@lang('الخطوة 1')</b>: @lang('اذهب الى') <a href="https://console.developers.google.com" target="_blank">@lang('google developer console').</a></li>
                        <li class="list-group-item"><b>@lang('الخطوة 2')</b>: @lang('انقر على "تحديد مشروع" ثم انقر على') <a href="https://console.cloud.google.com/projectcreate" target="_blank">@lang('New Project')</a>  @lang('and create a project providing the project name').</li>
                        <li class="list-group-item"><b>@lang('الخطوة 3')</b>: @lang('اضغط على ') <a href="https://console.cloud.google.com/apis/credentials" target="_blank">@lang('credentials').</a></li>
                        <li class="list-group-item"><b>@lang('الخطوة 4')</b>: @lang('انقر على "إنشاء بيانات اعتماد" ثم اختر') <a href="https://console.cloud.google.com/apis/credentials/oauthclient" target="_blank">@lang('OAuth client ID').</a></li>
                        <li class="list-group-item"><b>@lang('الخطوة 5')</b>: @lang('اضغط على') <a href="https://console.cloud.google.com/apis/credentials/consent" target="_blank">@lang('Configure Consent Screen').</a></li>
                        <li class="list-group-item"><b>@lang('الخطوة 6')</b>: @lang('اختر خيار "خارجي" ثم اضغط على زر "إنشاء"'). </li>
                        <li class="list-group-item"><b>@lang('الخطوة 7')</b>: @lang('يرجى تعبئة المعلومات المطلوبة لتهيئة التطبيق'). </li>
                        <li class="list-group-item"><b>@lang('الخطوة 8')</b>: @lang('انقر مرة أخرى على') <a href="https://console.cloud.google.com/apis/credentials" target="_blank">@lang('credentials')</a> @lang('and select type as web application and fill up the required informations. Also don\'t forget to add redirect url and press create button'). </li>
                        <li class="list-group-item"><b>@lang('الخطوة 9')</b>: @lang('أخيرًا، حصلت على بيانات الاعتماد. يرجى نسخ معرّف العميل (Client ID) والسر الخاص بالعميل (Client Secret) ولصقهما في إعدادات جوجل ضمن لوحة الإدارة.'). </li>
                    </ul>`;
                } else if (key == 'facebook') {
                    rules = ` <ul class="list-group list-group-flush">
                        <li class="list-group-item"><b>@lang('الخطوة 1')</b>: @lang('اذهب الى') <a href="https://developers.facebook.com/" target="_blank">@lang('مطور فيسبوك')</a></li>
                        <li class="list-group-item"><b>@lang('الخطوة 2')</b>: @lang('انقر على "ابدأ" ثم أنشئ حساب مطور على منصة Meta.').</li>
                        <li class="list-group-item"><b>@lang('الخطوة 3')</b>: @lang('أنشئ تطبيقًا عن طريق اختيار خيار "المستهلك" (Consumer).').</li>
                        <li class="list-group-item"><b>@lang('الخطوة 4')</b>: @lang('انقر على "إعداد تسجيل الدخول عبر فيسبوك" ثم اختر خيار "الويب".').</li>
                        <li class="list-group-item"><b>@lang('الخطوة 5')</b>: @lang('أضف عنوان موقع الويب (URL)').</li>
                        <li class="list-group-item"><b>@lang('الخطوة 6')</b>: @lang('اذهب إلى "تسجيل دخول فيسبوك" ثم "الإعدادات" وأدخل رابط الاستدعاء هنا.').</li>
                        <li class="list-group-item"><b>@lang('الخطوة 7')</b>: @lang('اذهب إلى الإعدادات > الأساسي، وانسخ بيانات الاعتماد ثم الصقها في لوحة الإدارة.').</li>

                    </ul>`;
                } else if (key == 'linkedin') {
                    rules = `<ul class="list-group list-group-flush">
                        <li class="list-group-item"><b>@lang('الخطوة 1')</b>: @lang('اذهب الى') <a href="https://developer.linkedin.com/" target="_blank">@lang('linkedin developer')</a>.</li>
                        <li class="list-group-item"><b>@lang('الخطوة 2')</b>: @lang('انقر على "إنشاء تطبيق" وأدخل المعلومات المطلوبة.').</li>
                        <li class="list-group-item"><b>@lang('الخطوة 3')</b>: @lang('اضغط على "تسجيل الدخول باستخدام LinkedIn" وانتقل إلى خيار "طلب الوصول".').</li>
                        <li class="list-group-item"><b>@lang('الخطوة 4')</b>: @lang('انقر على خيار "المصادقة" (Auth)، ثم انسخ بيانات الاعتماد والصقها في لوحة الإدارة، ولا تنسَ إضافة رابط إعادة التوجيه (Redirect URL) هنا.').</li>
                    </ul>`;
                }

                modal.find('.modal-body').html(rules);
                modal.modal('show');
            });
        })(jQuery);
    </script>
@endpush
