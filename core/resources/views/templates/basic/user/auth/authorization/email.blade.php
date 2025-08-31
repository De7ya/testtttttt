@extends('Template::layouts.authenticate')
@section('content')
    <div class="verification-code-wrapper">
        <div class="verification-area">
            <form action="{{ route('user.verify.email') }}" method="POST" class="submit-form">
                @csrf
                <p class="verification-text">@lang('تم إرسال رمز تحقق مكون من 6 أرقام إلى عنوان بريدك الإلكتروني.'): {{ showEmailAddress(auth()->user()->email) }}</p>

                @include('Template::partials.verification_code')

                <div class="mb-3">
                    <button type="submit" class="btn btn--base w-100">@lang('Submit')</button>
                </div>

                <div class="mb-3">
                    <p>
                        @lang('إذا لم تستلم أي رمز'), <span class="countdown-wrapper">@lang('حاول مرة أخرى بعد ذلك.') <span id="countdown" class="fw-bold">--</span> @lang('seconds')</span> <a href="{{ route('user.send.verify.code', 'email') }}" class="try-again-link d-none">
                            @lang('أعد المحاولة')</a>
                    </p>
                    <a href="{{ route('user.logout') }}" class="text--base">@lang('تسجيل الخروج')</a>
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
