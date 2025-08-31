@extends('admin.layouts.app')

@push('style')
    @once
        <!-- خط Tajawal -->
        <link href="https://fonts.googleapis.com/css2?family=Tajawal:wght@400;500;700;800&display=swap" rel="stylesheet">
        <style>
            .rtl-ar{
                direction: rtl;
                text-align: right;
                font-family: 'Tajawal', system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif !important;
            }
            .rtl-ar .table th, .rtl-ar .table td{
                vertical-align: middle;
                font-size: .95rem;
            }
            .rtl-ar .table thead th{ font-weight:700; }
            .button--group .btn{ margin-inline: .2rem; }
            .h-45{ height:45px; }
        </style>
    @endonce
@endpush

@section('panel')
    <div class="row rtl-ar">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body p-0">
                    <div class="table-responsive--sm table-responsive">
                        <table class="table table--light style--two">
                            <thead>
                                <tr>
                                    <th>@lang('الاسم')</th>
                                    <th>@lang('تخطيط المقعد')</th>
                                    <th>@lang('عدد الطوابق')</th>
                                    <th>@lang('إجمالي المقاعد')</th>
                                    <th>@lang('المرافق')</th>
                                    <th>@lang('الحالة')</th>
                                    <th>@lang('الإجراء')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($fleetType as $item)
                                    <tr>
                                        <td>{{ __($item->name) }}</td>

                                        <td>
                                            @php
                                                $layoutRaw = trim($item->seat_layout ?? '');
                                                $normalized = str_replace('×', 'x', mb_strtolower($layoutRaw, 'UTF-8'));
                                                $parts = array_map('trim', explode('x', $normalized));
                                            @endphp
                                            @if(count($parts) === 2 && is_numeric($parts[0]) && is_numeric($parts[1]))
                                                {{ $parts[0] }} × {{ $parts[1] }}
                                            @else
                                                {{ __($item->seat_layout) }}
                                            @endif
                                        </td>

                                        <td>{{ __($item->deck) }}</td>

                                        <td>{{ is_array($item->deck_seats) ? array_sum($item->deck_seats) : 0 }}</td>

                                        <td>
                                            @if (!empty($item->facilities) && is_array($item->facilities))
                                                {{ __(implode('، ', $item->facilities)) }}
                                            @else
                                                @lang('لا توجد مرافق')
                                            @endif
                                        </td>

                                        <td>@php echo $item->statusBadge; @endphp</td>

                                        <td>
                                            <div class="button--group">
                                                <button type="button"
                                                        class="btn btn-sm btn-outline--primary cuModalBtn"
                                                        data-resource='@json($item)'
                                                        data-modal_title="@lang('تعديل النوع')">
                                                    <i class="la la-pencil"></i> @lang('تعديل')
                                                </button>

                                                @if (!$item->status)
                                                    <button type="button"
                                                            class="btn btn-sm btn-outline--success confirmationBtn"
                                                            data-action="{{ route('admin.fleet.type.status', $item->id) }}"
                                                            data-question="@lang('هل أنت متأكد من تمكين هذا النوع؟')">
                                                        <i class="la la-eye"></i> @lang('تفعيل')
                                                    </button>
                                                @else
                                                    <button type="button"
                                                            class="btn btn-sm btn-outline--danger confirmationBtn"
                                                            data-action="{{ route('admin.fleet.type.status', $item->id) }}"
                                                            data-question="@lang('هل أنت متأكد من تعطيل هذا النوع؟')">
                                                        <i class="la la-eye-slash"></i> @lang('إلغاء التفعيل')
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
                        </table>
                    </div>
                </div>

                @if ($fleetType->hasPages())
                    <div class="card-footer py-4 rtl-ar">
                        {{ paginateLinks($fleetType) }}
                    </div>
                @endif
            </div>
        </div>
    </div>

    <x-confirmation-modal />

    <!-- Modal: إضافة/تعديل نوع أسطول -->
    <div id="cuModal" class="modal fade rtl-ar" tabindex="-1" role="dialog" aria-labelledby="cuModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 id="cuModalLabel" class="modal-title"></h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>

                <form action="{{ route('admin.fleet.type.store') }}" method="POST">
                    @csrf
                    <div class="modal-body">
                        <div class="form-group">
                            <label>@lang('الاسم')</label>
                            <input type="text" class="form-control" name="name" required>
                        </div>

                        <div class="form-group">
                            <label>@lang('تخطيط المقعد')</label>
                            <select name="seat_layout" class="form-control select2" data-minimum-results-for-search="-1" required>
                                <option value="">@lang('حدد خيار')</option>
                                @foreach ($seatLayouts as $item)
                                    @php
                                        $layoutRaw = trim($item->layout ?? '');
                                        $normalized = str_replace('×', 'x', mb_strtolower($layoutRaw, 'UTF-8'));
                                        $parts = array_map('trim', explode('x', $normalized));
                                        $pretty = (count($parts) === 2 && is_numeric($parts[0]) && is_numeric($parts[1]))
                                            ? ($parts[0] . ' × ' . $parts[1])
                                            : $item->layout;
                                    @endphp
                                    <option value="{{ $item->layout }}">{{ __($pretty) }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="form-group">
                            <label>@lang('عدد الطوابق')</label>
                            <input type="number" min="1" class="form-control" name="deck" required>
                        </div>

                        <div class="showSeat"></div>

                        <div class="form-group">
                            <label for="facilities">@lang('المرافق')</label>
                            <select class="select2-auto-tokenize" name="facilities[]" id="facilities" multiple="multiple">
                                @foreach ($facilities as $item)
                                    <option value="{{ $item->data_values->title }}">{{ $item->data_values->title }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="has_ac">@lang('حالة التكييف')</label><br>
                            <input id="has_ac" type="checkbox"
                                   data-width="100%" data-height="40px"
                                   data-onstyle="-success" data-offstyle="-danger"
                                   data-bs-toggle="toggle" data-on="@lang('نعم')" data-off="@lang('لا')"
                                   name="has_ac">
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="submit" class="btn btn--primary h-45 w-100">@lang('تأكيد')</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@push('breadcrumb-plugins')
    <button type="button" class="btn btn-sm btn-outline--primary cuModalBtn" data-modal_title="@lang('إضافة نوع جديد')">
        <i class="las la-plus"></i> @lang('إضافة جديد')
    </button>
@endpush

@push('script-lib')
    <script src="{{ asset('assets/admin/js/cu-modal.js') }}"></script>
@endpush

@push('script')
<script>
(function($){
    "use strict";

    // إنشاء حقول "مقاعد كل طابق" عند إدخال عدد الطوابق
    $(document).on('input', 'input[name=deck]', function(){
        const count = parseInt($(this).val() || 0, 10);
        const holder = $('.showSeat').empty();
        for(let i=1; i<=count; i++){
            holder.append(`
                <div class="form-group">
                    <label>@lang('مقاعد الطابق') - ${i}</label>
                    <input type="number" class="form-control hasArray" name="deck_seats[]" min="1" step="1"
                           placeholder="@lang('أدخل عدد المقاعد')" required>
                </div>
            `);
        }
    });

    // ملء المودال عند التعديل
    $('.cuModalBtn').on('click', function(){
        const modal = $('#cuModal');
        const data = $(this).data('resource') || {};
        const title = $(this).data('modal_title') || '';
        modal.find('.modal-title').text(title);

        // إعادة تعيين الحقول
        modal.find('form')[0].reset();
        $('#facilities').val('').trigger('change');

        // تعبئة القيم إن وُجدت
        if (data.name) modal.find('input[name=name]').val(data.name);
        if (data.seat_layout) modal.find('select[name=seat_layout]').val(data.seat_layout).trigger('change');
        if (data.deck){
            const deckInput = modal.find('input[name=deck]');
            deckInput.val(data.deck).trigger('input');
            if (Array.isArray(data.deck_seats)){
                data.deck_seats.forEach((val, idx) => {
                    modal.find('.showSeat .form-group').eq(idx).find('input[name="deck_seats[]"]').val(val);
                });
            }
        }
        if (Array.isArray(data.facilities)){
            $('#facilities').val(data.facilities).trigger('change');
        }
        if (data.has_ac){
            modal.find('input[name=has_ac]').bootstrapToggle('on');
        }else{
            modal.find('input[name=has_ac]').bootstrapToggle('off');
        }
    });

})(jQuery);
</script>
@endpush
