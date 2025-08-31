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
                                <th>@lang('ر.ت')</th>
                                <th>@lang('التخطيط')</th>
                                <th>@lang('الإجراء')</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($layouts as $item)
                                <tr>
                                    <td>
                                        {{ ($layouts->currentPage() - 1) * $layouts->perPage() + $loop->iteration }}
                                    </td>

                                    <td>
                                        @php
                                            // دعم كلا الرمزين x و × مع المسافات، وحروف كبيرة/صغيرة
                                            $layoutRaw = trim($item->layout ?? '');
                                            $normalized = str_replace('×', 'x', mb_strtolower($layoutRaw, 'UTF-8'));
                                            $parts = array_map('trim', explode('x', $normalized));
                                        @endphp
                                        @if(count($parts) === 2 && is_numeric($parts[0]) && is_numeric($parts[1]))
                                            {{ $parts[0] }} × {{ $parts[1] }}
                                        @else
                                            {{ __($item->layout) }}
                                        @endif
                                    </td>

                                    <td>
                                        <div class="button--group">
                                            <button type="button"
                                                    class="btn btn-sm btn-outline--primary cuModalBtn"
                                                    data-resource='@json($item)'
                                                    data-modal_title="@lang('تحرير التخطيط')">
                                                <i class="la la-pencil"></i> @lang('تعديل')
                                            </button>

                                            <button type="button"
                                                    class="btn btn-sm btn-outline--danger confirmationBtn"
                                                    data-question="@lang('هل أنت متأكد من إزالة التخطيط؟')"
                                                    data-action="{{ route('admin.fleet.layouts.remove', $item->id) }}">
                                                <i class="la la-trash"></i> @lang('إزالة')
                                            </button>
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

            @if ($layouts->hasPages())
                <div class="card-footer py-4 rtl-ar">
                    {{ paginateLinks($layouts) }}
                </div>
            @endif
        </div>
    </div>
</div>

<x-confirmation-modal />

<!-- Modal: إضافة/تعديل تخطيط -->
<div id="cuModal" class="modal fade rtl-ar" tabindex="-1" role="dialog" aria-labelledby="cuModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 id="cuModalLabel" class="modal-title">@lang('إضافة تخطيط')</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <i class="las la-times"></i>
                </button>
            </div>
            <form action="{{ route('admin.fleet.layouts.store') }}" method="POST">
                @csrf
                <div class="modal-body">
                    <div class="form-group" style="direction: rtl">
                        <label>@lang('التخطيط')</label>
                        <input type="text"
                               class="form-control"
                               placeholder="@lang('مثال: 2 × 3')"
                               name="layout"
                               required>
                        <small class="text-primary text--small">
                            <i class="fas fa-info-circle"></i>
                            @lang('أدخل عدد المقاعد في الصف وعدد الأعمدة (مثال: 2 × 3). سيتم تنسيق الرمز تلقائيًا.')
                        </small>
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
    <button type="button"
            class="btn btn-sm btn-outline--primary cuModalBtn"
            data-modal_title="@lang('إضافة تخطيط جديد')">
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

    // تحويل الأرقام العربية إلى إنجليزية (إن وُجدت)
    const arToEnDigits = s => s.replace(/[٠-٩]/g, d => '٠١٢٣٤٥٦٧٨٩'.indexOf(d));

    // تنسيق قيمة الحقل إلى "a × b" عند الكتابة/اللصق
    $(document).on('input', 'input[name=layout]', function(){
        let val = $(this).val() || '';
        val = arToEnDigits(val);

        // استبدال الرمز × إلى x لتوحيد المعالجة
        val = val.replace(/×/g, 'x');

        // استخراج أول رقمين من النص بأي فاصل (x، مسافات، شرطة، فاصلة..)
        const nums = val.match(/\d+/g) || [];

        if (nums.length === 0) {
            $(this).val('');
            return;
        }
        if (nums.length === 1) {
            $(this).val(nums[0]);
            return;
        }
        // لدينا رقمين أو أكثر: نأخذ أول رقمين فقط
        const a = nums[0];
        const b = nums[1];

        $(this).val(`${a} × ${b}`);
    });

})(jQuery);
</script>
@endpush
