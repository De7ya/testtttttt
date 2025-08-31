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
                                    <th>@lang('الرحلة')</th>
                                    <th>@lang('الاسم المستعار للمركبة')</th>
                                    <th>@lang('رقم التسجيل')</th>
                                    <th>@lang('الحالة')</th>
                                    <th>@lang('الإجراء')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($assignedVehicles as $item)
                                    <tr>
                                        <td>{{ __($item->trip->title) }}</td>
                                        <td>{{ __($item->vehicle->nick_name) }}</td>
                                        <td>{{ __($item->vehicle->register_no) }}</td>
                                        <td>@php echo $item->statusBadge; @endphp</td>
                                        <td>
                                            <div class="button--group">
                                                <button type="button"
                                                        class="btn btn-sm btn-outline--primary cuModalBtn"
                                                        data-resource='@json($item)'
                                                        data-modal_title="@lang('تحديث المركبة المخصصة للرحلة')">
                                                    <i class="la la-pencil"></i> @lang('تعديل')
                                                </button>

                                                @if (!$item->status)
                                                    <button type="button"
                                                            class="btn btn-sm btn-outline--success confirmationBtn"
                                                            data-action="{{ route('admin.trip.vehicle.assign.status', $item->id) }}"
                                                            data-question="@lang('هل أنت متأكد من تفعيل هذه المركبة المخصصة؟')">
                                                        <i class="la la-eye"></i> @lang('تفعيل')
                                                    </button>
                                                @else
                                                    <button type="button"
                                                            class="btn btn-sm btn-outline--danger confirmationBtn"
                                                            data-action="{{ route('admin.trip.vehicle.assign.status', $item->id) }}"
                                                            data-question="@lang('هل أنت متأكد من تعطيل هذه المركبة المخصصة؟')">
                                                        <i class="la la-eye-slash"></i> @lang('تعطيل')
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

                @if ($assignedVehicles->hasPages())
                    <div class="card-footer py-4 rtl-ar">
                        {{ paginateLinks($assignedVehicles) }}
                    </div>
                @endif
            </div>
        </div>
    </div>

    <x-confirmation-modal />

    <!-- Modal: تخصيص مركبة -->
    <div id="cuModal" class="modal fade rtl-ar" tabindex="-1" role="dialog" aria-labelledby="cuModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 id="cuModalLabel" class="modal-title"></h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>
                <form action="{{ route('admin.trip.vehicle.assign.store') }}" method="POST">
                    @csrf
                    <div class="modal-body">
                        <div class="form-group">
                            <label>@lang('الرحلة')</label>
                            <select class="select2 form-control" name="trip_id" required>
                                <option value="">@lang('اختر خياراً')</option>
                                @foreach ($trips as $t)
                                    <option value="{{ $t->id }}"
                                            data-vehicles='@json($t->fleetType->activeVehicles)'>
                                        {{ __($t->title) }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <div class="form-group">
                            <label>@lang('المركبة')</label>
                            <select class="select2 form-control" name="vehicle_id" required>
                                <option value="">@lang('اختر خياراً')</option>
                            </select>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="submit" class="btn h-45 w-100 btn--primary">@lang('تأكيد')</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@push('breadcrumb-plugins')
    <x-search-form placeholder="@lang('ابحث بالاسم...')" />
    <button type="button" class="btn btn-sm btn-outline--primary h-45 cuModalBtn"
            data-modal_title="@lang('تخصيص مركبة للرحلة')">
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

    // توليد قائمة المركبات عند اختيار الرحلة
    function populateVehiclesSelect($modal, vehicles, selectedId = null){
        const $veh = $modal.find('select[name="vehicle_id"]');
        let options = `<option value="">@lang('اختر خياراً')</option>`;
        (vehicles || []).forEach(v => {
            options += `<option value="${v.id}" data-name="${v.register_no}">${v.nick_name} (${v.register_no})</option>`;
        });
        $veh.html(options);
        if (selectedId){
            $veh.val(String(selectedId)).trigger('change');
        } else {
            $veh.val('').trigger('change');
        }
    }

    // عند فتح المودال (إضافة/تعديل)
    $('.cuModalBtn').on('click', function(){
        const modal = $('#cuModal');
        const data  = $(this).data('resource') || {}; // {id, trip_id, vehicle_id, ...}
        modal.find('.modal-title').text($(this).data('modal_title') || '');

        // إعادة تهيئة الحقول
        modal.find('form')[0].reset();
        modal.find('select[name="trip_id"]').val('').trigger('change');
        populateVehiclesSelect(modal, [], null);

        if (Object.keys(data).length){
            // وضع التعديل: اختر الرحلة ثم ابنِ قائمة المركبات بناءً على data-vehicles الخاص بالرحلة المختارة
            const $trip = modal.find('select[name="trip_id"]');
            $trip.val(String(data.trip_id)).trigger('change');

            // بعد تغيير الرحلة، نقرأ المركبات من الـ option المختار
            const selectedOpt = $trip.find('option:selected');
            const vehicles = selectedOpt.data('vehicles') || [];
            populateVehiclesSelect(modal, vehicles, data.vehicle_id);
        }
    });

    // عند تغيير الرحلة ينعاد بناء قائمة المركبات
    $(document).on('change', '#cuModal select[name="trip_id"]', function(){
        const $modal = $(this).closest('#cuModal');
        const vehicles = $(this).find('option:selected').data('vehicles') || [];
        populateVehiclesSelect($modal, vehicles, null);
    });
})(jQuery);
</script>
@endpush
