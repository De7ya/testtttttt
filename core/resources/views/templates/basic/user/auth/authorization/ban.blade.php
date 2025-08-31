@extends($activeTemplate . 'layouts.frontend')
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 my-5">
                <div class="card custom--card">
                    <div class="card-body">
                        <h3 class="text-center mb-3 text--danger">@lang('أنت محظور')</h3>
                        <h6>@lang('السبب'):</h6>
                        <p>{{ $user->ban_reason }}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
