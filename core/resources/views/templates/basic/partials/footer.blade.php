@php
    $content = getContent('footer.content', true);
    $socialLinks = getContent('social_links.element', orderById: true);
    $policies = getContent('policy_pages.element', orderById: true);
    $pages = App\Models\Page::where('tempname', $activeTemplate)
        ->where('is_default', Status::NO)
        ->get();
@endphp
<!-- Footer Section Starts Here -->
<section class="footer-section" style="direction: rtl">
    <div class="footer-top">
        <div class="container" >
            <div class="row footer-wrapper gy-sm-5 gy-4">
                <div class="col-xl-4 col-lg-3 col-md-6 col-sm-6">
                    <div class="footer-widget">
                        <div class="logo">
                            <img src="{{ siteLogo('dark') }}" alt="@lang('شعار')">
                        </div>
                        <p>{{ __(@$content->data_values->short_description) }}</p>
                        <ul class="social-icons">
                            @foreach ($socialLinks as $item)
                                <li>
                                    <a href="{{ @$item->data_values->url }}">@php echo @$item->data_values->icon @endphp</a>
                                </li>
                            @endforeach
                        </ul>
                    </div>
                </div>
                <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                    <div class="footer-widget">
                        <h4 class="widget-title">@lang('روابط مفيدة')</h4>
                        <ul class="footer-links">
                            @foreach ($pages as $k => $data)
                                <li>
                                    <a href="{{ route('pages', [$data->slug]) }}">{{ __($data->name) }}</a>
                                </li>
                            @endforeach
                            <li>
                                <a href="{{ route('blog') }}">@lang('مدونة')</a>
                            </li>
                            <li>
                                <a href="{{ route('contact') }}">@lang('اتصال')</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                    <div class="footer-widget">
                        <h4 class="widget-title">@lang('السياسات')</h4>
                        <ul class="footer-links">
                            @foreach ($policies as $policy)
                                <li>
                                    <a
                                        href="{{ route('policy.pages', $policy->slug) }}">@php
                                            echo @$policy->data_values->title;
                                        @endphp</a>
                                </li>
                            @endforeach

                        </ul>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                    <div class="footer-widget">
                        <h4 class="widget-title">@lang('معلومات الاتصال')</h4>
                        @php
                            $contacts = getContent('contact.content', true);
                        @endphp
                        <ul class="footer-contacts">
                            <li>
                                <i class="las la-map-pin"></i> {{ __(@$contacts->data_values->address) }}
                            </li>
                            <li>
                                <i class="las la-phone-volume"></i> <a
                                    href="tel:{{ __(@$contacts->data_values->contact_number) }}">
                                    {{ __(@$contacts->data_values->contact_number) }}</a>
                            </li>
                            <li>
                                <i class="las la-envelope"></i> <a
                                    href="mailto:{{ __(@$contacts->data_values->email) }}">
                                    {{ __(@$contacts->data_values->email) }}</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Footer Section Ends Here -->


@push('style')
<style>
/* ========== 1) الأسهم يمين الروابط (تبقى كما هي) ========== */
.footer-section .footer-links{ list-style:none; padding:0; margin:0; }
.footer-section .footer-links li{ position:relative; }

.footer-section .footer-links li a{
  position: relative;
  display: block;
  direction: rtl;
  text-align: right;
  padding-right: 1.2rem;          /* مساحة للسهم يمين النص */
  padding-left: 0 !important;
  background: none !important;    /* لو القالب يضع سهم كـ background */
}
/* امنع أي أسهم قديمة على li أو ::before */
.footer-section .footer-links li::before,
.footer-section .footer-links li::after,
.footer-section .footer-links li a::before{
  content: none !important;
  display: none !important;
}
/* سهمنا نحن على اليمين */
.footer-section .footer-links li a::after{
  content: "\00BB" !important;    /* » */
  position: absolute !important;
  right: 0 !important;
  left: auto !important;
  top: 50% !important;
  transform: translateY(-50%);
  font-weight: 700;
  line-height: 1;
  opacity: .9;
}
/* لو كان هناك <i> داخل الرابط لسهم قديم */
.footer-section .footer-links li a > i{ display:none !important; }

/* ========== 2) الخطوط أسفل عناوين الودجت فقط ========== */
/* العناوين: روابط مفيدة / السياسات / معلومات الاتصال */
.footer-section .footer-widget .widget-title{
  position: relative;
  padding-bottom: 12px;    /* مساحة للخطوط */
  margin-bottom: 18px;
  text-align: right;       /* لأننا RTL */
}
/* الخط السفلي الطويل والخفيف */
.footer-section .footer-widget .widget-title::before{
  content: "";
  position: absolute;
  right: 0;                /* محاذاة يمين */
  left: auto;
  bottom: 0;
  width: 64px;             /* غيّر العرض حسب رغبتك */
  height: 1px;
  background-color: rgba(255,255,255,0.15);  /* مناسب لخلفية داكنة */
}
/* الخط الأعلى الأقصر والأغلظ */
.footer-section .footer-widget .widget-title::after{
  content: "";
  position: absolute;
  right: 0;
  left: auto;
  bottom: 3px;             /* أعلى قليلاً من الخط السفلي */
  width: 28px;
  height: 3px;
  background-color: rgba(255,255,255,0.35);
  border-radius: 2px;
}
</style>
@endpush
