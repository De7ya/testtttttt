@extends('admin.layouts.app')
@section('panel')
    <div class="row mb-none-30">
        <div class="col-md-12 mb-30">
            <div class="card bl--5 border--primary">
                <div class="card-body">
                    <p class="text--primary">@lang("إذا لم يتم تغيير الشعار والرمز المفضل بعد التحديث من هذه الصفحة، فيرجى') <a href="{{ route('admin.system.optimize.clear') }}" class="text--info text-decoration-underline">@lang('مسح ذاكرة التخزين المؤقت')</a> @lang('من متصفحك. بما أننا نحتفظ باسم الملف كما هو بعد التحديث، فقد تظهر الصورة القديمة للذاكرة المؤقتة. عادةً، تعمل هذه الطريقة بعد مسح الذاكرة المؤقتة، ولكن إذا استمر ظهور الشعار القديم أو أيقونة المفضلة، فقد يكون السبب هو التخزين المؤقت على مستوى الخادم أو الشبكة. يُرجى مسحها أيضًا..')</p>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <form method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="row justify-content-center">
                            <div class="form-group col-md-4 col-sm-6">
                                <label> @lang('شعار للخلفية البيضاء')</label>
                                <x-image-uploader name="logo" :imagePath="siteLogo() . '?' . time()" :size="false" class="w-100" id="uploadLogo" :required="false" />
                            </div>
                            <div class="form-group col-md-4 col-sm-6">
                                <label> @lang('شعار للخلفية الداكنة')</label>
                                <x-image-uploader name="logo_dark" :imagePath="siteLogo('dark') . '?' . time()" :size="false" :darkMode="true" class="w-100" id="uploadDarkLogo" :required="false" />
                            </div>
                            <div class="form-group col-md-4 col-sm-6">
                                <label> @lang('أيقونة مفضلة')</label>
                                <x-image-uploader name="favicon" :imagePath="siteFavicon() . '?' . time()" :size="false" class="w-100" id="uploadFavicon" :required="false" />
                            </div>
                        </div>
                        <button type="submit" class="btn btn--primary w-100 h-45">@lang('تأكيد')</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
