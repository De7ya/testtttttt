@extends('admin.layouts.app')
@section('panel')
    <div class="row mb-none-30 justify-content-center">
        <div class="col-xl-4 col-md-6 mb-30">
            <div class="card overflow-hidden box--shadow1">
                <div class="card-body">
                    <h5 class="mb-20 text-muted">
                        @lang('الإيداع ')
{{--                         @if($deposit->method_code < 5000) {{ __(@$deposit->gateway->name) }} @else @lang('') @endif
 --}}                    </h5>

                    <ul class="list-group">
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('التاريخ')
                            <span class="fw-bold">{{ showDateTime($deposit->created_at) }}</span>
                        </li>

                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('رقم المعاملة')
                            <span class="fw-bold">{{ $deposit->trx }}</span>
                        </li>

                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('اسم المستخدم')
                            <span class="fw-bold">
                                <a href="{{ route('admin.users.detail', $deposit->user_id) }}">
                                    <span>@</span>{{ @$deposit->user->username }}
                                </a>
                            </span>
                        </li>

                        {{-- ❌ تمت إزالة صف "طريقة" --}}

                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('كمية')
                            <span class="fw-bold">{{ showAmount($deposit->amount) }}</span>
                        </li>


                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('الحالة')
                            @php echo $deposit->statusBadge @endphp
                        </li>

                        @if($deposit->admin_feedback)
                            <li class="list-group-item">
                                <strong>@lang('رد الإدارة')</strong>
                                <br>
                                <p>{{ __($deposit->admin_feedback) }}</p>
                            </li>
                        @endif
                    </ul>
                </div>
            </div>
        </div>

        @if($details || $deposit->status == Status::PAYMENT_PENDING)
        <div class="col-xl-8 col-md-6 mb-30">
            <div class="card overflow-hidden box--shadow1">
                <div class="card-body">
                    <h5 class="card-title border-bottom pb-2">@lang('معلومات إيداع المستخدم')</h5>

                    @if($details != null)
                        @foreach(json_decode($details) as $val)
                            @if($deposit->method_code >= 1000)
                                <div class="row mt-4">
                                    <div class="col-md-12">
                                        @if($val->type == 'checkbox')
                                            {{ implode(',', $val->value) }}
                                        @elseif($val->type == 'file')
                                            @if(@$val->value)
                                                <a href="{{ route('admin.download.attachment', encrypt(getFilePath('verify').'/'.$val->value)) }}">
                                                    <i class="fa-regular fa-file"></i> @lang('مرفق')
                                                </a>
                                            @else
                                                @lang('لا يوجد ملف')
                                            @endif
                                        @else
                                        @endif
                                    </div>
                                </div>
                            @endif
                        @endforeach

                        @if($deposit->method_code < 1000)
                            @include('admin.deposit.gateway_data', ['details' => json_decode($details)])
                        @endif
                    @endif

                    @if($deposit->status == Status::PAYMENT_PENDING)
                        <div class="row mt-4">
                            <div class="col-md-12">
                                <button class="btn btn-outline--success btn-sm ms-1 confirmationBtn"
                                    data-action="{{ route('admin.deposit.approve', $deposit->id) }}"
                                    data-question="@lang('هل أنت متأكد من الموافقة على هذه المعاملة؟')">
                                    <i class="las la-check"></i> @lang('يعتمد')
                                </button>

                                <button class="btn btn-outline--danger btn-sm ms-1"
                                    data-bs-toggle="modal" data-bs-target="#rejectModal">
                                    <i class="las la-ban"></i> @lang('مرفوض')
                                </button>
                            </div>
                        </div>
                    @endif
                </div>
            </div>
        </div>
        @endif
    </div>

    {{-- REJECT MODAL --}}
    <div id="rejectModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">@lang('رفض تأكيد الإيداع')</h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>

                <form action="{{ route('admin.deposit.reject') }}" method="POST">
                    @csrf
                    <input type="hidden" name="id" value="{{ $deposit->id }}">
                    <div class="modal-body">
                        <p>
                            @lang('هل انت متأكد من ذلك؟')
                            <span class="fw-bold">@lang('مرفوض')</span>
                            <span class="fw-bold text--success">{{ showAmount($deposit->amount) }}</span>
                            @lang('وديعة')
                            <span class="fw-bold">{{ @$deposit->user->username }}</span>?
                        </p>

                        <div class="form-group">
                            <label class="mt-2">@lang('سبب الرفض')</label>
                            <textarea name="message" maxlength="255" class="form-control" rows="5" required>{{ old('message') }}</textarea>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="submit" class="btn btn--primary w-100 h-45">@lang('تأكيد')</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <x-confirmation-modal />
@endsection
