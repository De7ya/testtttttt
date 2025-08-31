@extends($activeTemplate . 'layouts.app')
@section('app')
    @include($activeTemplate . 'partials.user_header')

    @if (!request()->routeIs('home') && !request()->routeIs('ticket') && !request()->routeIs('search'))
        @include($activeTemplate . 'partials.breadcrumb')
    @endif

    @yield('content')

    @include($activeTemplate . 'partials.footer')
    <a href="javascript::void()" class="scrollToTop active"><i class="las la-chevron-up"></i></a>
@endsection

@push('style')
<link href="https://fonts.googleapis.com/css2?family=Tajawal:wght@400;500;700&display=swap" rel="stylesheet">
<style>
  /* يطبّق Tajawal فقط على العناصر العربية */
  :lang(ar), [lang="ar"] {
    font-family: 'Tajawal', system-ui, -apple-system, Segoe UI, Roboto, "Helvetica Neue", Arial, "Noto Sans", "Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
  }
</style>
@endpush
