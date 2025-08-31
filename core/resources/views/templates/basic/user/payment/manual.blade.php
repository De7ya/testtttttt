@extends($activeTemplate . 'layouts.master')
@section('content')
    <div class="container padding-top padding-bottom">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card custom--card">
                    <div class="card-header card-header-bg">
                        <h5 class="card-title text-end">تأكيد الدفع</h5>
                    </div>

                    {{-- محتوى البطاقة باتجاه RTL --}}
                    <div class="card-body" dir="rtl">
                        <form action="{{ route('user.deposit.manual.update') }}" method="POST" class="disableSubmission" enctype="multipart/form-data">
                            @csrf
                            <div class="row">

                                <div class="col-md-12">
                                    {{-- تنبيه RTL مع الأيقونة في اليمين والنص بعدها --}}
                                    <div class="alert alert-primary rtl-alert" role="alert">
                                        <div class="d-flex flex-row-reverse align-items-center">
                                            <i class="las la-info-circle fs-5 icon-rtl"></i>
                                            <span class="mb-0">
                                                أنت على وشك دفع
                                                <b class="fw-semibold">{{ showAmount($data['amount']) }}</b>
                                                — يُرجى إتمام الدفع.
                                            </span>
                                        </div>
                                    </div>

                                    {{-- <div class="mb-3">@php echo $data->gateway->description @endphp</div> --}}
                                </div>

                                <div class="col-12">
                                    <x-viser-form identifier="id" identifierValue="{{ $gateway->form_id }}" />
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <button type="submit" class="btn btn--base w-100">@lang('ادفع')</button>
                                    </div>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('style')
<style>
  /* طبّق فقط داخل بطاقة هذه الصفحة */
  .custom--card .card-body .alert.alert-primary{
    float: right;                 /* الصندوق يلتصق بأقصى اليمين */
    display: inline-flex;         /* يمنع ملء العرض بالكامل */
    align-items: center;
    flex-direction: row-reverse;  /* الأيقونة يمين ثم النص */
    gap: .5rem;
    direction: rtl;
    text-align: right;
  }

  /* تنظيف الفلوت حتى لا تتداخل العناصر التي بعده */
  .custom--card .card-body::after{
    content: "";
    display: block;
    clear: both;
  }
</style>
@endpush
