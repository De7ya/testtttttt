@extends('admin.layouts.app')
@push('topBar')
  @include('admin.notification.top_bar')
@endpush
@section('panel')
    @include('admin.notification.template.nav')
    @include('admin.notification.template.shortcodes')


    <form action="{{ route('admin.setting.notification.template.update',['push',$template->id]) }}" method="post">
        @csrf
        <div class="row">

            <div class="col-md-12">
                <div class="card mt-4">
                    <div class="card-header bg--primary">
                        <h5 class="card-title text-white">@lang('نموذج إشعار دفع')</h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label>@lang('أدخل عنوان الإشعار')</label>
                                    <input type="text" class="form-control" placeholder="@lang('عنوان الإشعار')" name="push_title" value="">
                                    <small class="text-primary"><i><i class="las la-info-circle"></i> @lang('اترك الحقل فارغًا إذا كنت تريد استخدام عنوان النموذج العام كعنوان للإشعار.')</i></small>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>@lang('الحالة')</label>
                                    <input type="checkbox" data-height="46px" data-width="100%" data-onstyle="-success"
                                       data-offstyle="-danger" data-bs-toggle="toggle" data-on="@lang('إرسال إشعار دفع')"
                                       data-off="@lang("لا تُرسل
")" name="push_status"
                                       @if($template->push_status) checked @endif>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>@lang('رسالة')</label>
                                    <textarea name="push_body" rows="10" class="form-control" placeholder="@lang('رسالتك باستخدام الأكواد المختصرة')" required></textarea>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn--primary w-100 h-45">@lang('تأكيد')</button>
                    </div>
                </div>
            </div>

        </div>

    </form>
@endsection


@push('breadcrumb-plugins')
    <x-back route="{{ route('admin.setting.notification.templates') }}" />
@endpush
