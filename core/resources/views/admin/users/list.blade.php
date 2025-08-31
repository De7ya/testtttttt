@extends('admin.layouts.app')

@push('style')
    @once
        <!-- Google Fonts Tajawal -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Tajawal:wght@400;500;700;800&display=swap" rel="stylesheet">
        <style>
            /* RTL wrapper */
            .rtl-ar{ direction: rtl; text-align: right; }

            /* طبّق الخط على عناصر النص فقط (بدون الأيقونات) */
            .rtl-ar :where(h1,h2,h3,h4,h5,h6,p,span,a,small,li,td,th,label,button,input,textarea,select){
                font-family:'Tajawal',system-ui,-apple-system,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans","Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol",sans-serif !important;
            }

            /* اترك الأيقونات بخطّها الأصلي حتى لا تتكسّر */
            .rtl-ar i[class^="la"], .rtl-ar i[class*=" la-"],
            .rtl-ar .la, .rtl-ar .las, .rtl-ar .lar, .rtl-ar .lab,
            .rtl-ar i[class^="fa"], .rtl-ar i[class*=" fa-"],
            .rtl-ar .fa, .rtl-ar .fas, .rtl-ar .far, .rtl-ar .fab{
                font-family:"Line Awesome Free","Font Awesome 6 Free","Font Awesome 5 Free",
                             "Line Awesome Brands","Font Awesome 6 Brands","Font Awesome 5 Brands" !important;
                font-style: normal;
            }
            .rtl-ar .las, .rtl-ar .fas{ font-weight:900 !important; } /* solid */
            .rtl-ar .lar, .rtl-ar .far{ font-weight:400 !important; } /* regular */

            /* تحسينات الجدول */
            .arabic-table th, .arabic-table td{ vertical-align: middle; font-size: .95rem; }
            .arabic-table th{ font-weight: 700; }
            .arabic-table .fw-bold{ font-weight: 700 !important; }
            .arabic-table .small{ font-weight: 500; opacity: .9; }

            /* أزرار الإجراءات */
            .button--group .btn{ margin-inline-start:.25rem; margin-inline-end:.25rem; }

            /* حجم أيقونة التفاصيل */
            .las.la-desktop{ font-size:1rem; vertical-align:-1px; }

            /* إزالة مسافات أسفل الجدول داخل البطاقة */
            .card-body.p-0 .table{ margin-bottom:0; }
        </style>
    @endonce
@endpush

@section('panel')
    <div class="row rtl-ar">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body p-0">
                    <div>
                        <table class="table table--light style--two arabic-table">
                            <thead>
                                <tr>
                                    <th>@lang('المستخدم')</th>
                                    <th>@lang('البريد الالكتروني- الهاتف')</th>
                                    <th>@lang('الدولة')</th>
                                    <th>@lang('انضم في')</th>
                                    <th>@lang('القيمة')</th>
                                    <th>@lang('عرض')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($users as $user)
                                    <tr>
                                        <td>
                                            <span class="fw-bold">{{ $user->fullname ?? $user->name }}</span>
                                            <br>
                                            <span class="small">
                                                <a href="{{ route('admin.users.detail', $user->id) }}">
                                                    <span>@</span>{{ $user->username }}
                                                </a>
                                            </span>
                                        </td>

                                        <td>
                                            {{ $user->email }}<br>{{ $user->mobileNumber ?? $user->mobile ?? $user->phone }}
                                        </td>

                                        <td>
                                            <span class="fw-bold" title="{{ @$user->country_name }}">{{ $user->country_code }}</span>
                                        </td>

                                        <td>
                                            {{ showDateTime($user->created_at) }} <br> {{ diffForHumans($user->created_at) }}
                                        </td>

                                        <td>
                                            <span class="fw-bold">{{ showAmount($user->balance) }}</span>
                                        </td>

                                        <td>
                                            <div class="button--group">
                                                <a href="{{ route('admin.users.detail', $user->id) }}" class="btn btn-sm btn-outline--primary">
                                                    <i class="las la-desktop"></i> @lang('التفاصيل')
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td class="text-muted text-center" colspan="100%">{{ __($emptyMessage) }}</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table><!-- table end -->
                    </div>
                </div>

                @if ($users->hasPages())
                    <div class="card-footer py-4 rtl-ar">
                        {{ paginateLinks($users) }}
                    </div>
                @endif
            </div>
        </div>
    </div>
@endsection

@push('breadcrumb-plugins')
    <x-search-form placeholder="@lang('اسم المستخدم / البريد الإلكتروني')" />
@endpush

@push('script')
    @once
    <script>
        (function () {
            "use strict";
            try {
                // تقليل ظهور شارة الترجمة في المتصفح
                document.documentElement.setAttribute('translate', 'no');
                document.documentElement.classList.add('notranslate');

                if (!document.querySelector('meta[name="google"][content="notranslate"]')) {
                    var m = document.createElement('meta');
                    m.setAttribute('name', 'google');
                    m.setAttribute('content', 'notranslate');
                    document.head.appendChild(m);
                }

                if (!document.querySelector('meta[http-equiv="Content-Language"]')) {
                    var cl = document.createElement('meta');
                    cl.setAttribute('http-equiv', 'Content-Language');
                    cl.setAttribute('content', 'ar');
                    document.head.appendChild(cl);
                }
            } catch (e) {}
        })();
    </script>
    @endonce
@endpush
