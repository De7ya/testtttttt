@extends('admin.layouts.app')

@section('panel')
    <div class="row rtl-ar">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body p-0">
                    <div class="table-responsive--sm table-responsive">
                        <table class="table table--light style--two">
                            <thead>
                                <tr>
                                    <th>@lang('المستخدم')</th>
                                    <th>@lang('رقم سجل اسم المسافر')</th>
                                    <th>@lang('تاريخ الرحلة')</th>
                                    <th>@lang('الرحلة')</th>
                                    <th>@lang('نقطة الالتقاء')</th>
                                    <th>@lang('نقطة الإنزال')</th>
                                    <th>@lang('الحالات')</th>
                                    <th>@lang('عدد التذاكر')</th>
                                    <th>@lang('السعر')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($tickets as $item)
                                    <tr>
                                        <td data-label="@lang('المستخدم')">
                                            <span class="fw-bold">{{ __(@$item->user->fullname) }}</span>
                                            <br>
                                            <span class="text--small">
                                                <a href="{{ route('admin.users.detail', $item->user_id) }}">
                                                    <span>@</span>{{ __(@$item->user->username) }}
                                                </a>
                                            </span>
                                        </td>

                                        <td data-label="@lang('رقم سجل اسم المسافر')">
                                            <span class="text-muted">{{ __($item->pnr_number) }}</span>
                                        </td>

                                        <td data-label="@lang('تاريخ الرحلة')">
                                            {{ __(showDateTime($item->date_of_journey, 'd M, Y')) }}
                                        </td>

                                        <td data-label="@lang('الرحلة')">
                                            <span class="fw-bold">{{ __($item->trip->fleetType->name) }}</span>
                                            <br>
                                            <span class="fw-bold">{{ __($item->trip->startFrom->name) }} - {{ __($item->trip->endTo->name) }}</span>
                                        </td>

                                        <td data-label="@lang('نقطة الالتقاء')">
                                            {{ __($item->pickup->name) }}
                                        </td>

                                        <td data-label="@lang('نقطة الإنزال')">
                                            {{ __($item->drop->name) }}
                                        </td>

                                        <td data-label="@lang('الحالات')">
                                            @if ($item->status == 1)
                                                <span class="badge badge--success text--small">@lang('محجوز')</span>
                                            @elseif ($item->status == 2)
                                                <span class="badge badge--warning text--small">@lang('معلق')</span>
                                            @else
                                                <span class="badge badge--danger text--small">@lang('مرفوض')</span>
                                            @endif
                                        </td>

                                        <td data-label="@lang('عدد التذاكر')">
                                            {{ __(sizeof($item->seats)) }}
                                        </td>

                                        <td data-label="@lang('السعر')">
                                            {{ __(showAmount($item->sub_total)) }}
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td class="text-muted text-center" colspan="100%">{{ __($emptyMessage) }}</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>

                @if ($tickets->hasPages())
                    <div class="card-footer py-4 rtl-ar">
                        {{ paginateLinks($tickets) }}
                    </div>
                @endif
            </div>
        </div>
    </div>
@endsection

@push('breadcrumb-plugins')
    <form action="{{ route('admin.vehicle.ticket.search', $scope ?? str_replace('admin.vehicle.ticket.', '', request()->route()->getName())) }}"
          method="GET" class="form-inline float-sm-right bg--white rtl-ar">
        <div class="input-group">
            <input type="text" name="search" class="form-control" placeholder="@lang('رقم سجل اسم المسافر')" value="{{ $search ?? '' }}">
            <button class="btn btn--primary" type="submit"><i class="fa fa-search"></i></button>
        </div>
    </form>
@endpush
