@php
    $content = getContent('contact.content', true);
    $language = App\Models\Language::all();
    $selectedLang = $language->where('code', session('lang'))->first();
    $pages = App\Models\Page::where('tempname', $activeTemplate)
        ->where('is_default', Status::NO)
        ->get();
@endphp
<!-- Header Section Starts Here -->

<div class="header-top" style="direction: rtl">
    <div class="container">
        <div class="header-top-area">
            <ul class="left-content">
                <li>
                    <i class="las la-phone"></i>
                    <a href="tel:{{ __(@$content->data_values->contact_number) }}">
                        {{ __(@$content->data_values->contact_number) }}
                    </a>
                </li>
                <li>
                    <i class="las la-envelope-open"></i>
                    <a href="mailto:{{ __(@$content->data_values->email) }}">
                        {{ __(@$content->data_values->email) }}
                    </a>
                </li>
            </ul>

            {{-- Language dropdown (hidden for now). Keep the @if/@endif balanced --}}
            @if (gs('multi_language'))
                {{-- <div class="language dropdown"> ... </div> --}}
            @endif

            @guest
                <ul class="header-login">
                    <li><a class="sign-in" href="{{ route('user.login') }}"><i class="fas fa-sign-in-alt"></i>@lang(' تسجيل الدخول')</a></li>
                    <li><a class="sign-up" href="{{ route('user.register') }}"><i class="fas fa-user-plus"></i>@lang('تسجيل')</a></li>
                </ul>
            @endguest

            @auth
                <ul class="header-login">
                    <li>
                        <a href="{{ route('user.home') }}">@lang('لوحة التحكم')</a>
                    </li>
                </ul>
            @endauth
        </div>
    </div>
</div>

<div class="header-bottom">
    <div class="container">
        <div class="header-bottom-area">
            <div class="logo">
                <a href="{{ route('home') }}">
                    <img src="{{ siteLogo() }}" alt="@lang('شعار')">
                </a>
            </div> <!-- Logo End -->
            <ul class="menu">
                <li>
                    <a href="{{ route('home') }}">@lang('الرئيسية')</a>
                </li>
                @foreach ($pages as $k => $data)
                    <li>
                        <a href="{{ route('pages', [$data->slug]) }}">{{ __($data->name) }}</a>
                    </li>
                @endforeach

                <li>
                    <a href="{{ route('blog') }}">@lang('مدونة')</a>
                </li>
                <li>
                    <a href="{{ route('contact') }}">@lang('تواصل')</a>
                </li>
            </ul>
            <div class="d-flex flex-wrap align-items-center">
                <a href="{{ route('ticket') }}" class="cmn--btn btn--sm">@lang('شراء تذكرة')</a>
                <div class="header-trigger-wrapper d-flex d-lg-none ms-4">
                    <div class="header-trigger d-block d-lg-none">
                        <span></span>
                    </div>
                    <div class="top-bar-trigger">
                        <i class="las la-ellipsis-v"></i>
                    </div>
                </div><!-- Trigger End-->
            </div>
        </div>
    </div>
</div>

@push('style')
    <!-- Tajawal font (Arabic only) -->
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Tajawal:wght@400;500;700;800&display=swap" rel="stylesheet">
    <style>
        /* طبّق Tajawal على النصوص العربية فقط (بدون التأثير على الأيقونات) */
        :lang(ar),
        html[lang="ar"] body,
        html[dir="rtl"] body {
            font-family: "Tajawal", system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans",
                         "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif !important;
        }
        /* استثناء خطوط الأيقونات حتى لا تختفي الأسهم/الأيقونات */
        .fa, .fas, .far, .fab, [class^="fa-"], [class*=" fa-"],
        .la, .las, .lar, .lab, [class^="la-"], [class*=" la-"],
        .flaticon, [class^="flaticon-"], [class*=" flaticon-"],
        .fa::before, .fas::before, .far::before, .fab::before, [class^="fa-"]::before, [class*=" fa-"]::before,
        .la::before, .las::before, .lar::before, .lab::before, [class^="la-"]::before, [class*=" la-"]::before,
        .flaticon::before, [class^="flaticon-"]::before, [class*=" flaticon-"]::before {
            font-family: "Line Awesome Free","Line Awesome",
                         "Font Awesome 6 Free","Font Awesome 6 Brands",
                         "Font Awesome 5 Free","Font Awesome 5 Brands",
                         "FontAwesome","Flaticon" !important;
        }

        /* ===== TOP BAR LAYOUT =====
           Container is RTL: first child (phone/email) stays on the right,
           last child (login) is pushed to the left. */
        .header-top-area{
            display:flex;
            align-items:center;
            justify-content: space-between; /* right-most & left-most */
            gap: 16px;
            width: 100%;
        }

        /* Lists inline */
        .left-content,
        .header-login{
            display:flex;
            align-items:center;
            margin:0;
            padding:0;
            list-style:none;
            gap: 10px;
        }

        .left-content i,
        .header-login i{
            margin-inline-end:6px;
        }

        .language-wrapper {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            width: max-content;
            margin-left: 12px;
            padding: 0;
            background-color: transparent;
            border: 0;
        }

        .language_flag { flex-shrink: 0; display: flex; }
        .language_flag img { height: 20px; width: 20px; object-fit: cover; border-radius: 50%; }

        .language-wrapper.show .collapse-icon { transform: rotate(180deg) }
        .collapse-icon { font-size: 14px; display: flex; transition: all linear 0.2s; color: #111 }
        .language_text_select { font-size: 14px; font-weight: 400; color: #111; }
        .language-content { display: flex; align-items: center; gap: 6px; }
        .language_text { color: #111 }
        .language-list { display: flex; align-items: center; gap: 6px; padding: 6px 12px; cursor: pointer; }
        .language-list:hover { background-color: rgba(0, 0, 0, 0.04); }
        .language .dropdown-menu {
            position: absolute; opacity: 0; visibility: hidden; top: 100%; display: unset;
            background: #ffffffea; box-shadow: 0 0 4px rgba(0,0,0,.04), 0 8px 16px rgba(0,0,0,.08);
            min-width: 150px; padding: 7px 0 !important; border-radius: 8px; border: 1px solid rgb(255 255 255 / 10%);
        }
        .language .dropdown-menu.show { visibility: visible; opacity: 1; }

        /* === Logo size (unchanged) === */
        .header-bottom .logo img{
            height: 72px !important;
            width: auto !important;
            max-width: 100%;
            max-height: none !important;
            image-rendering: -webkit-optimize-contrast;
        }
        @media (max-width: 991.98px){
            .header-bottom .logo img{ height: 56px !important; }
        }
    </style>
@endpush

@push('script')
    <script>
        $(document).ready(function() {
            "use strict";
            $(".langSel").on("click", function() {
                window.location.href = "{{ route('home') }}/change/" + $(this).data('code');
            });
        });
    </script>
@endpush
