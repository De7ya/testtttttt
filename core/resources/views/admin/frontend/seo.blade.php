@extends('admin.layouts.app')

@section('panel')
    <div class="row">
        <div class="col-lg-12 col-md-12 mb-30">
            <div class="card">
                <div class="card-body">
                    <form action="{{ route('admin.frontend.sections.content', 'seo') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" name="type" value="data">
                        <input type="hidden" name="seo_image" value="1">
                        <div class="row">
                            <div class="col-xl-4">
                                <div class="form-group">
                                    <label>@lang('صورة تحسين محركات البحث')</label>
                                    <x-image-uploader class="w-100" :imagePath="getImage(getFilePath('seo') . '/' . @$seo->data_values->image, getFileSize('seo'))" :size="getFileSize('seo')" :required="false" name="image_input" />

                                </div>
                            </div>

                            <div class="col-xl-8 mt-xl-0 mt-4">
                                <div class="form-group">
                                    <label>@lang('الكلمات الرئيسية الوصفية')</label>
                                    <small class="ms-2 mt-2  ">@lang('افصل الكلمات الرئيسية المتعددة حسب') <code>,</code>(@lang('فاصلة')) @lang('أو') <code>@lang('أدخل')</code> @lang('مفتاح')</small>
                                    <select name="keywords[]" class="form-control select2-auto-tokenize" multiple="multiple" required>
                                        @if (@$seo->data_values->keywords)
                                            @foreach ($seo->data_values->keywords as $option)
                                                <option value="{{ $option }}" selected>{{ __($option) }}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>@lang('الوصف التعريفي')</label>
                                    <textarea name="description" rows="3" class="form-control" required>{{ @$seo->data_values->description }}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>@lang('اللقب الاجتماعي')</label>
                                    <input type="text" class="form-control" name="social_title" value="{{ @$seo->data_values->social_title }}" required>
                                </div>
                                <div class="form-group">
                                    <label>@lang('الوصف الاجتماعي')</label>
                                    <textarea name="social_description" rows="3" class="form-control" required>{{ @$seo->data_values->social_description }}</textarea>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn--primary w-100 h-45">@lang('تأكيد')</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('style')
    <style>
        .image-upload-preview {
            background-size: cover;
        }
    </style>
@endpush
