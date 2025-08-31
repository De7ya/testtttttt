@extends('admin.layouts.app')

@push('style')
    @once
        <!-- خط Tajawal -->
        <link href="https://fonts.googleapis.com/css2?family=Tajawal:wght@400;500;700;800&display=swap" rel="stylesheet">
        <style>
            .rtl-ar{
                direction: rtl;
                text-align: right;
                font-family: 'Tajawal', system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif !important;
            }
            .rtl-ar .table th,
            .rtl-ar .table td{
                vertical-align: middle;
                font-size: .95rem;
            }
            .rtl-ar .table thead th{ font-weight:700; }
            .rtl-ar .fw-bold{ font-weight:700 !important; }
            .rtl-ar .small{ font-size:.85rem; }
        </style>
    @endonce
@endpush

@section('panel')
    <div class="row rtl-ar">

        <div class="col-lg-12">
            <div class="card">
                <div class="card-body p-0">

                    <div class="table-responsive--sm table-responsive">
                        <table class="table table--light style--two">
                            <thead>
                            <tr>
                                <th>@lang('المستخدم')</th>
                                <th>@lang('تاريخ تسجيل الدخول')</th>
                                <th>@lang('عنوان IP')</th>
                                <th>@lang('الموقع')</th>
                                <th>@lang('المتصفح | نظام التشغيل')</th>
                            </tr>
                            </thead>
                            <tbody>
                            @forelse($loginLogs as $log)
                                <tr>
                                    <td>
                                        <span class="fw-bold">{{ @$log->user->fullname }}</span>
                                        <br>
                                        <span class="small">
                                            <a href="{{ route('admin.users.detail', $log->user_id) }}">
                                                <span>@</span>{{ @$log->user->username }}
                                            </a>
                                        </span>
                                    </td>

                                    <td>
                                        {{ showDateTime($log->created_at) }} <br>
                                        <span class="text-muted">{{ diffForHumans($log->created_at) }}</span>
                                    </td>

                                    <td>
                                        <span class="fw-bold">
                                            <a href="{{ route('admin.report.login.ipHistory',[$log->user_ip]) }}">{{ $log->user_ip }}</a>
                                        </span>
                                    </td>

                                    <td>{{ __($log->city) }} <br> {{ __($log->country) }}</td>

                                    <td>{{ __($log->browser) }} <br> {{ __($log->os) }}</td>
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

                @if ($loginLogs->hasPages())
                    <div class="card-footer py-4 rtl-ar">
                        {{ paginateLinks($loginLogs) }}
                    </div>
                @endif
            </div><!-- card end -->
        </div>

    </div>
@endsection

@push('breadcrumb-plugins')
    @if(request()->routeIs('admin.report.login.history'))
        <x-search-form placeholder="@lang('ابحث باسم المستخدم')" dateSearch="yes" />
    @endif
@endpush

@if(request()->routeIs('admin.report.login.ipHistory'))
    @push('breadcrumb-plugins')
        <a href="https://www.ip2location.com/{{ $ip }}" target="_blank" class="btn btn-outline--primary">
            @lang('استعلام عن عنوان IP') {{ $ip }}
        </a>
    @endpush
@endif
