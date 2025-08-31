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
                                <th>@lang('البوابة')</th>
                                <th>@lang('الحالة')</th>
                                <th>@lang('الإجراء')</th>
                            </tr>
                            </thead>
                            <tbody>
                            @forelse($gateways as $gateway)
                                <tr>
                                    <td>
                                        {{__($gateway->name)}}
                                    </td>

                                    <td>
                                        @php
                                            echo $gateway->statusBadge
                                        @endphp
                                    </td>
                                    <td>
                                        <div class="button--group">
                                            <a href="{{ route('admin.gateway.manual.edit', $gateway->alias) }}" class="btn btn-sm btn-outline--primary editGatewayBtn">
                                                <i class="la la-pencil"></i>@lang('تعديل')
                                            </a>

                                            @if($gateway->status == Status::DISABLE)
                                                <button class="btn btn-sm btn-outline--success confirmationBtn" data-question="@lang('هل أنت متأكد من تفعيل هذه البوابة؟')" data-action="{{ route('admin.gateway.manual.status',$gateway->id) }}">
                                                    <i class="la la-eye"></i>@lang('تفعيل')
                                                </button>
                                            @else
                                                <button class="btn btn-sm btn-outline--danger confirmationBtn" data-question="@lang('هل أنت متأكد من تعطيل هذه البوابة؟')" data-action="{{ route('admin.gateway.manual.status',$gateway->id) }}">
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
    <div class="input-group w-auto search-form">
        <input type="text" name="search_table" class="form-control bg--white" placeholder="@lang('ابحث هنا ...">
        <button class="btn btn--primary input-group-text"><i class="fas fa-search"></i></button>
    </div>
    <a class="btn btn-outline--primary" href="{{ route('admin.gateway.manual.create') }}"><i class="las la-plus"></i>@lang('إضافة جديد')</a>
@endpush
