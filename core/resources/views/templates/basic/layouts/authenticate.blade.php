@extends($activeTemplate . 'layouts.app')
@section('app')
    @php
        $content = getContent('auth.content', true);
    @endphp

   <section class="account-section bg_img left-half"
         style="background-image:url('{{ asset('assets/images/frontend/auth/6686a2e20d8421720099554.jpg') }}');
                background-position: left center;
                background-size: 50% 100%;
                background-repeat: no-repeat;">

    <div class="account-wrapper sign-up">
        <div class="account-form-wrapper">
            <div class="account-header">
                <div class="logo mb-4">
                    <a href="{{ route('home') }}"><img src="{{ siteLogo() }}" alt="Logo"></a>
                </div>
            </div>
            @yield('content')
        </div>
    </div>
</section>



    @stack('modal')
@endsection

@push('style')
    <style>
        .account-wrapper {
            min-height: 100vh;
            background: #fff;
            padding-left: 120px;
            padding-right: 120px;
            width: 100%;
            position: relative;
            max-width: 720px;
            margin-left: auto;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            padding-top: 50px;
            padding-bottom: 50px;
        }
        
        
    </style>
@endpush
