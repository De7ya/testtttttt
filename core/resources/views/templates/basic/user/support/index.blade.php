@extends($activeTemplate . 'layouts.master')

@section('content')
    <div class="padding-top padding-bottom section-bg">
        <div class="container">
            <div class="row justify-content-center gy-4 gy-sm-5">
                <div class="col-md-12">
                    <div class="d-flex justify-content-end mb-4">
                        <a href="{{ route('ticket.open') }}" class="btn btn--base btn-sm">
                            <i class="fas fa-plus"></i>
                            @lang('تذكرة جديدة')
                        </a>
                    </div>

                    <div
                        class="table-responsive table-responsive-xl table-responsive-lg table-responsive-md table-responsive-sm" style="direction: rtl">
                        <table class="booking-table">
                            <thead class="thead">
                                <tr>
                                    <th>@lang('موضوع')</th>
                                    <th>@lang('الحالة')</th>
                                    <th>@lang('أولوية')</th>
                                    <th>@lang('الرد الأخير')</th>
                                    <th>@lang('الكل')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($supports as $key => $support)
                                    <tr>
                                        <td data-label="@lang('موضوع')"> <a
                                                href="{{ route('ticket.view', $support->ticket) }}"
                                                class="font-weight-bold"> [@lang('تذكرة')#{{ $support->ticket }}]
                                                {{ __($support->subject) }} </a></td>
                                        <td data-label="@lang('الحالة')">
                                            @if ($support->status == 0)
                                                <span class="badge badge--success py-2 px-3">@lang('مفتوح')</span>
                                            @elseif($support->status == 1)
                                                <span class="badge badge--primary py-2 px-3">@lang('تمت الإجابة')</span>
                                            @elseif($support->status == 2)
                                                <span class="badge badge--warning py-2 px-3">@lang('رد العميل')</span>
                                            @elseif($support->status == 3)
                                                <span class="badge badge--dark py-2 px-3">@lang('مغلق')</span>
                                            @endif
                                        </td>
                                        <td data-label="@lang('أولوية')">
                                            @if ($support->priority == 1)
                                                <span class="badge badge--dark py-2 px-3">@lang('منخفض')</span>
                                            @elseif($support->priority == 2)
                                                <span class="badge badge--success py-2 px-3">@lang('متوسط')</span>
                                            @elseif($support->priority == 3)
                                                <span class="badge badge--primary py-2 px-3">@lang('عالي')</span>
                                            @endif
                                        </td>
                                        <td data-label="@lang('الرد الأخير')">
                                            {{ \Carbon\Carbon::parse($support->last_reply)->diffForHumans() }} </td>

                                        <td data-label="@lang('الكل')">
                                            <a href="{{ route('ticket.view', $support->ticket) }}"
                                                class="btn btn--base btn-sm">
                                                <i class="fa fa-desktop"></i>
                                            </a>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="5" class="text-center">
                                            {{ __($emptyMessage) }}
                                        </td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                    @if ($supports->hasPages())
                        {{ $supports->links() }}
                    @endif
                </div>
            </div>
            <div class="col-12">

            </div>
        </div>
    </div>
    </div>
@endsection
