@php
    $sidenav = json_decode($sidenav);

    $settings = file_get_contents(resource_path('views/admin/setting/settings.json'));
    $settings = json_decode($settings);

    $routesData = [];
    foreach (\Illuminate\Support\Facades\Route::getRoutes() as $route) {
        $name = $route->getName();
        if (strpos($name, 'admin') !== false) {
            $routeData = [
                $name => url($route->uri()),
            ];

            $routesData[] = $routeData;
        }
    }
@endphp

<!-- navbar-wrapper start -->
<nav class="navbar-wrapper bg--dark d-flex flex-wrap">
    <div class="navbar__left">
        <button type="button" class="res-sidebar-open-btn me-3"><i class="las la-bars"></i></button>
        <form class="navbar-search">
            <input type="search" name="#0" class="navbar-search-field" id="searchInput" autocomplete="off"
                placeholder="@lang('ابحث هنا...')">
            <i class="las la-search"></i>
            <ul class="search-list"></ul>
        </form>
    </div>
    <div class="navbar-right">
        <ul class="navbar__action-list">
            @if(version_compare(gs('available_version'),systemDetails()['version'],'>'))
{{--             <li><button type="button" class="primary--layer" data-bs-toggle="tooltip" data-bs-placement="bottom" title="@lang('التحديث متاح')"><a href="{{ route('admin.system.update') }}" class="primary--layer"><i class="las la-download text--warning"></i></a> </button></li>
 --}}            @endif
            <li>
                <button type="button" class="primary--layer" data-bs-toggle="tooltip" data-bs-placement="bottom" title="@lang('زيارة الموقع')">
                    <a href="{{ route('home') }}" target="_blank"><i class="las la-globe"></i></a>
                </button>
            </li>
            <li class="dropdown">
                <button type="button" class="primary--layer notification-bell" data-bs-toggle="dropdown" data-display="static"
                    aria-haspopup="true" aria-expanded="false">
                    <span data-bs-toggle="tooltip" data-bs-placement="bottom" title="@lang('الإشعارات غير المقروءة')">
                        <i class="las la-bell @if($adminNotificationCount > 0) icon-left-right @endif"></i>
                    </span>
                    @if($adminNotificationCount > 0)
                    <span class="notification-count">{{ $adminNotificationCount <= 9 ? $adminNotificationCount : '9+'}}</span>
                    @endif
                </button>
                <div class="dropdown-menu dropdown-menu--md p-0 border-0 box--shadow1 dropdown-menu-right">
                    <div class="dropdown-menu__header">
                        <span class="caption">@lang('إشعار')</span>
                        @if($adminNotificationCount > 0)
                            <p>@lang('لديك') {{ $adminNotificationCount }} @lang('إشعار غير مقروء')</p>
                        @endif
                    </div>
                    <div class="dropdown-menu__body @if(blank($adminNotifications)) d-flex justify-content-center align-items-center @endif">
                        @forelse($adminNotifications as $notification)
                            <a href="{{ route('admin.notification.read',$notification->id) }}"
                                class="dropdown-menu__item">
                                <div class="navbar-notifi">
                                    <div class="navbar-notifi__right">
                                        <h6 class="notifi__title">{{ __($notification->title) }}</h6>
                                        <span class="time"><i class="far fa-clock"></i>
                                            {{ diffForHumans($notification->created_at) }}</span>
                                    </div>
                                </div>
                            </a>
                        @empty
                        <div class="empty-notification text-center">
                            <img src="{{ getImage('assets/images/empty_list.png') }}" alt="empty">
                            <p class="mt-3">@lang('لم يتم العثور على إشعار غير مقروء')</p>
                        </div>
                        @endforelse
                    </div>
                    <div class="dropdown-menu__footer">
                        <a href="{{ route('admin.notifications') }}"
                            class="view-all-message">@lang('عرض جميع الإشعارات')</a>
                    </div>
                </div>
            </li>
            <li>
                <button type="button" class="primary--layer" data-bs-toggle="tooltip" data-bs-placement="bottom" title="@lang('إعدادات النظام')">
                    <a href="{{ route('admin.setting.system') }}"><i class="las la-wrench"></i></a>
                </button>
            </li>
            <li class="dropdown d-flex profile-dropdown">
                <button type="button" data-bs-toggle="dropdown" data-display="static" aria-haspopup="true"
                    aria-expanded="false">
                    <span class="navbar-user">
                        {{-- <span class="navbar-user__thumb"><img src="{{ getImage(getFilePath('adminProfile').'/'. auth()->guard('admin')->user()->image,getFileSize('adminProfile'))}}" alt="image"></span> --}}
                        <span class="navbar-user__info">
                            {{-- <span class="navbar-user__name">{{ auth()->guard('admin')->user()->username }}</span> --}}
                        </span>
                        <span class="icon"><i class="las la-chevron-circle-down"></i></span>
                    </span>
                </button>
                <div class="dropdown-menu dropdown-menu--sm p-0 border-0 box--shadow1 dropdown-menu-right">
                    <a href="{{ route('admin.profile') }}"
                        class="dropdown-menu__item d-flex align-items-center px-3 py-2">
                        <i class="dropdown-menu__icon las la-user-circle"></i>
                        <span class="dropdown-menu__caption">@lang('الحساب')</span>
                    </a>

                    <a href="{{ route('admin.password') }}"
                        class="dropdown-menu__item d-flex align-items-center px-3 py-2">
                        <i class="dropdown-menu__icon las la-key"></i>
                        <span class="dropdown-menu__caption">@lang('كلمة المرور')</span>
                    </a>

                    <a href="{{ route('admin.logout') }}" class="dropdown-menu__item d-flex align-items-center px-3 py-2">
                        <i class="dropdown-menu__icon las la-sign-out-alt"></i>
                        <span class="dropdown-menu__caption">@lang('تسجيل الخروج')</span>
                    </a>
                </div>
                <button type="button" class="breadcrumb-nav-open ms-2 d-none">
                    <i class="las la-sliders-h"></i>
                </button>
            </li>
        </ul>
    </div>
</nav>
<!-- navbar-wrapper end -->

@push('script')
<script>
    "use strict";
    var routes = @json($routesData);
    var settingsData = Object.assign({}, @json($settings), @json($sidenav));

    $('.navbar__action-list .dropdown-menu').on('click', function(event){
        event.stopPropagation();
    });
</script>
<script src="{{ asset('assets/admin/js/search.js') }}"></script>
<script>
    "use strict";
    function getEmptyMessage(){
        return `<li class="text-muted">
                <div class="empty-search text-center">
                    <img src="{{ getImage('assets/images/empty_list.png') }}" alt="empty">
                    <p class="text-muted">@lang('لم يتم العثور على نتائج بحث')</p>
                </div>
            </li>`
    }
</script>
@endpush

@push('style')
    <!-- Tajawal font -->
    <link href="https://fonts.googleapis.com/css2?family=Tajawal:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        html, body, button, input, select, textarea {
            font-family: 'Tajawal', system-ui, -apple-system, Segoe UI, Roboto, "Helvetica Neue", Arial, "Noto Sans", "Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
        }
    </style>
@endpush
