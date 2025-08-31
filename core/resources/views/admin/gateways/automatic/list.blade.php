@extends('admin.layouts.app')
@section('panel')
@push('topBar')
@include('admin.gateways.top_bar')
@endpush
    <div class="row">

        <div class="col-lg-12">
            <div class="card">

                <div class="card-body p-0">
                    <div class="table-responsive--sm table-responsive">
                        <table class="table table--light style--two custom-data-table">
                            <thead>
                            <tr>
                                <th>@lang('بوابة')</th>
                                <th>@lang('العملة المدعومة')</th>
                                <th>@lang('العملة الممكّنة')</th>
                                <th>@lang('الحالة')</th>
                                <th>@lang('حدث')</th>
                            </tr>
                            </thead>
                            <tbody>
                            @forelse($gateways->sortBy('alias') as $k=>$gateway)
                                <tr>
                                    <td>
                                        {{__($gateway->name)}}
                                    </td>

                                    <td>
                                        {{ collect($gateway->supported_currencies)->count() }}
                                    </td>
                                    <td>
                                        {{ $gateway->currencies->count() }}
                                    </td>


                                    <td>
                                        @php
                                            echo $gateway->statusBadge
                                        @endphp
                                    </td>
                                    <td>
                                        <div class="button--group">
                                            <a href="{{ route('admin.gateway.automatic.edit', $gateway->alias) }}" class="btn btn-sm btn-outline--primary editGatewayBtn">
                                                <i class="la la-pencil"></i>@lang('تعديل')
                                            </a>


                                            @if($gateway->status == Status::DISABLE)
                                                <button class="btn btn-sm btn-outline--success ms-1 confirmationBtn" data-question="@lang('Are you sure to enable this gateway?')" data-action="{{ route('admin.gateway.automatic.status',$gateway->id) }}">
                                                    <i class="la la-eye"></i>@lang('تفعيل')
                                                </button>
                                            @else
                                                <button class="btn btn-sm btn-outline--danger ms-1 confirmationBtn" data-question="@lang('Are you sure to disable this gateway?')" data-action="{{ route('admin.gateway.automatic.status',$gateway->id) }}">
                                                    <i class="la la-eye-slash"></i>@lang('تعطيل')
                                                </button>
                                            @endif
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
            </div><!-- card end -->
        </div>
    </div>

    <x-confirmation-modal />
@endsection
@push('breadcrumb-plugins')
    <div class="d-inline">
        <div class="input-group justify-content-end">
            <input type="text" name="search_table" class="form-control bg--white" placeholder="@lang('ابحث هنا ...">
            <button class="btn btn--primary input-group-text"><i class="fas fa-search"></i></button>
        </div>
    </div>
@endpush
