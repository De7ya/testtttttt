@php
    $sideBarLinks = json_decode($sidenav);
@endphp

<div class="sidebar bg--dark">
    <button class="res-sidebar-close-btn"><i class="las la-times"></i></button>
    <div class="sidebar__inner">
        <div class="sidebar__logo">
            <a href="{{route('admin.dashboard')}}" class="sidebar__main-logo"><img src="{{siteLogo("dark")}}" alt="image"></a>
        </div>
        <div class="sidebar__menu-wrapper">
            <ul class="sidebar__menu">

                @foreach($sideBarLinks as $key => $data)
                    @if (@$data->header)
                        <li class="sidebar__menu-header">{{ __($data->header) }}</li>
                    @endif
                    @if(@$data->submenu)
                        <li class="sidebar-menu-item sidebar-dropdown">
                            <a href="javascript:void(0)" class="{{ menuActive(@$data->menu_active, 3) }}">
                                <i class="menu-icon {{ @$data->icon }}"></i>
                                <span class="menu-title">{{ __(@$data->title) }}</span>
                                @foreach(@$data->counters ?? [] as $counter)
                                    @if($$counter > 0)
                                        <span class="menu-badge menu-badge-level-one bg--warning ms-auto">
                                            <i class="fas fa-exclamation"></i>
                                        </span>
                                        @break
                                    @endif
                                @endforeach
                            </a>
                            <div class="sidebar-submenu {{ menuActive(@$data->menu_active, 2) }} ">
                                <ul>
                                    @foreach($data->submenu as $menu)
                                    @php
                                        $submenuParams = null;
                                        if (@$menu->params) {
                                            foreach ($menu->params as $submenuParamVal) {
                                                $submenuParams[] = array_values((array)$submenuParamVal)[0];
                                            }
                                        }
                                    @endphp
                                        <li class="sidebar-menu-item {{ menuActive(@$menu->menu_active) }} ">
                                            <a href="{{ route(@$menu->route_name,$submenuParams) }}" class="nav-link">
                                                <i class="menu-icon las la-dot-circle"></i>
                                                <span class="menu-title">{{ __($menu->title) }}</span>
                                                @php $counter = @$menu->counter; @endphp
                                                @if(@$$counter)
                                                    <span class="menu-badge bg--info ms-auto">{{ @$$counter }}</span>
                                                @endif
                                            </a>
                                        </li>
                                    @endforeach
                                    
                                </ul>
                            </div>
                        </li>
                    @else
                        @php
                            $mainParams = null;
                            if (@$data->params) {
                                foreach ($data->params as $paramVal) {
                                    $mainParams[] = array_values((array)$paramVal)[0];
                                }
                            }
                        @endphp
                        <li class="sidebar-menu-item {{ menuActive(@$data->menu_active) }}">
                            <a href="{{ route(@$data->route_name,$mainParams) }}" class="nav-link ">
                                <i class="menu-icon {{ $data->icon }}"></i>
                                <span class="menu-title">{{ __(@$data->title) }}</span>
                                @php $counter = @$data->counter; @endphp
                                @if (@$$counter)
                                    <span class="menu-badge bg--info ms-auto">{{ @$$counter }}</span>
                                @endif
                            </a>
                        </li>
                    @endif
                @endforeach
            </ul>
        </div>
       
    </div>
</div>
<!-- sidebar end -->

@push('script')
    <script>
        if($('li').hasClass('active')){
            $('.sidebar__menu-wrapper').animate({
                scrollTop: eval($(".active").offset().top - 320)
            },500);
        }
    </script>
    @push('style')
<style>
    /* نقل القائمة الجانبية إلى اليمين */
    .sidebar {
        right: 0 !important;
        left: auto !important;
    }

    /* تعديل الحشو للمحتوى */
    .page-wrapper {
        padding-right: 260px !important;
        padding-left: 0 !important;
    }

    /* تنسيق الرموز والعناوين */
    .sidebar .menu-icon {
        margin-left: 10px;
        margin-right: 0;
    }

    .sidebar__menu {
        text-align: right;
    }

    .sidebar-submenu ul {
        padding-right: 20px;
        padding-left: 0;
    }

    .menu-title, .menu-badge {
        float: right;
    }
</style>
@endpush

@endpush
