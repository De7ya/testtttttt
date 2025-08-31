<div class="col-md-12">
    <div class="card overflow-hidden">
        <div class="card-body p-0">
            <div class="table-responsive table-responsive--sm">
                <table class=" table align-items-center table--light">
                    <thead>
                    <tr>
                        <th>@lang('الرمز القصير') </th>
                        <th>@lang('وصف')</th>
                    </tr>
                    </thead>
                    <tbody class="list">
                    {{-- blade-formatter-disable --}}
                    <tr>
                        <td><span class="short-codes">@{{fullname}}</span></td>
                        <td>@lang('الاسم الكامل للمستخدم')</td>
                    </tr>
                    <tr>
                        <td><span class="short-codes">@{{username}}</span></td>
                        <td>@lang('اسم المستخدم للمستخدم')</td>
                    </tr>
                    <tr>
                        <td><span class="short-codes">@{{message}}</span></td>
                        <td>@lang('الرسالة')</td>
                    </tr>
                    @foreach(gs('global_shortcodes') as $shortCode => $codeDetails)
                    <tr>
                        <td><span class="short-codes">@{{@php echo $shortCode @endphp}}</span></td>
                        <td>{{ __($codeDetails) }}</td>
                    </tr>
                    @endforeach
                    {{-- blade-formatter-enable --}}
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
