@extends($activeTemplate . 'layouts.authenticate')
@section('content')
    <div class="verification-code-wrapper">
        <div class="verification-area">
            <form action="{{ route('user.verify.mobile') }}" method="POST" class="submit-form">
                @csrf
                <p class="verification-text">@lang('A 6 digit verification code sent to your mobile number') :
                    +{{ showMobileNumber(auth()->user()->mobileNumber) }}</p>
                @include($activeTemplate . 'partials.verification_code')
                <div class="mb-3">
                    <button type="submit" class="btn btn--base w-100">@lang('تأكيد')</button>
                </div>
                <div class="form-group">
                    <p>
                        @lang('اذا لم تستلم رمز التحقق'), <span class="countdown-wrapper">@lang('حاول بعد قليل') <span id="countdown" class="fw-bold">--</span> @lang('seconds')</span> <a href="{{ route('user.send.verify.code', 'sms') }}" class="try-again-link d-none">
                            @lang('حاول مرة أخرى')</a>
                    </p>
                    <a href="{{ route('user.logout') }}">@lang('Loتسجيل الخروجgout')</a>
                </div>
            </form>
        </div>
    </div>
@endsection
@push('script')
    <script>
        var distance = Number("{{ @$user->ver_code_send_at->addMinutes(2)->timestamp - time() }}");
        var x = setInterval(function() {
            distance--;
            document.getElementById("countdown").innerHTML = distance;
            if (distance <= 0) {
                clearInterval(x);
                document.querySelector('.countdown-wrapper').classList.add('d-none');
                document.querySelector('.try-again-link').classList.remove('d-none');
            }
        }, 1000);
    </script>
@endpush
