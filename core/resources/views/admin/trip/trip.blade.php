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
                                    <th>@lang('العنوان')</th>
                                    <th>@lang('التكييف')</th>
                                    <th>@lang('أيام العطلة')</th>
                                    <th>@lang('الحالة')</th>
                                    <th>@lang('الإجراء')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($trips as $item)
                                    <tr>
                                        <td>{{ __($item->title) }}</td>

                                        <td>
                                            {{ $item->fleetType->has_ac == Status::ENABLE ? __('مكيّف') : __('غير مكيّف') }}
                                        </td>

                                        <td>
                                            @if (!empty($item->day_off))
                                                @foreach ($item->day_off as $day)
                                                    {{ __(showDayOff($day)) }}@if (!$loop->last){{ '، ' }}@endif
                                                @endforeach
                                            @else
                                                @lang('لا توجد أيام عطلة')
                                            @endif
                                        </td>

                                        <td>@php echo $item->statusBadge; @endphp</td>

                                        <td>
                                            <div class="button--group">
                                                <button type="button"
                                                        class="btn btn-sm btn-outline--primary cuModalBtn"
                                                        data-resource='@json($item)'
                                                        data-modal_title="@lang('تعديل الرحلة')">
                                                    <i class="la la-pencil"></i> @lang('تعديل')
                                                </button>

                                                @if (!$item->status)
                                                    <button type="button"
                                                            class="btn btn-sm btn-outline--success confirmationBtn"
                                                            data-action="{{ route('admin.trip.status', $item->id) }}"
                                                            data-question="@lang('هل أنت متأكد من تفعيل هذه الرحلة؟')">
                                                        <i class="la la-eye"></i> @lang('تفعيل')
                                                    </button>
                                                @else
                                                    <button type="button"
                                                            class="btn btn-sm btn-outline--danger confirmationBtn"
                                                            data-action="{{ route('admin.trip.status', $item->id) }}"
                                                            data-question="@lang('هل أنت متأكد من تعطيل هذه الرحلة؟')">
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

                @if ($trips->hasPages())
                    <div class="card-footer py-4 rtl-ar">
                        {{ paginateLinks($trips) }}
                    </div>
                @endif
            </div>
        </div>
    </div>

    <x-confirmation-modal />

    <!-- Modal: إضافة/تعديل رحلة -->
    <div id="cuModal" class="modal fade rtl-ar" tabindex="-1" role="dialog" aria-labelledby="cuModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 id="cuModalLabel" class="modal-title"></h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>

                <form action="{{ route('admin.trip.store') }}" method="POST">
                    @csrf
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>@lang('العنوان')</label>
                                    <input type="text" class="form-control" name="title" required>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>@lang('نوع الأسطول')</label>
                                    <select name="fleet_type_id" class="select2" required>
                                        <option value="">@lang('اختر خيارًا')</option>
                                        @foreach ($fleetTypes as $ft)
                                            <option value="{{ $ft->id }}" data-name="{{ $ft->name }}">{{ __($ft->name) }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>@lang('الطريق')</label>
                                    <select name="vehicle_route_id" class="select2" required>
                                        <option value="">@lang('اختر خيارًا')</option>
                                        @foreach ($routes as $rt)
                                            <option value="{{ $rt->id }}" data-name="{{ $rt->name }}">{{ __($rt->name) }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>@lang('الجدول')</label>
                                    <select name="schedule_id" class="select2" required>
                                        <option value="">@lang('اختر خيارًا')</option>
                                        @foreach ($schedules as $sc)
                                            <option value="{{ $sc->id }}"
                                                    data-name="{{ showDateTime($sc->start_from, 'h:i a').' - '.showDateTime($sc->end_at, 'h:i a') }}">
                                                {{ __(showDateTime($sc->start_from, 'h:i a').' - '.showDateTime($sc->end_at, 'h:i a')) }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>@lang('يبدأ من')</label>
                                        <select name="start_from" class="select2" required>
                                            <option value="">@lang('اختر خيارًا')</option>
                                            @foreach ($stoppages as $sp)
                                                <option value="{{ $sp->id }}" data-name="{{ $sp->name }}">{{ __($sp->name) }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>@lang('ينتهي إلى')</label>
                                        <select name="end_to" class="select2" required>
                                            <option value="">@lang('اختر خيارًا')</option>
                                            @foreach ($stoppages as $sp)
                                                <option value="{{ $sp->id }}" data-name="{{ $sp->name }}">{{ __($sp->name) }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>

                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="day_off">@lang('أيام عطلة')</label>
                                    <select class="select2-auto-tokenize" name="day_off[]" id="day_off" multiple="multiple">
                                        <option value="0">@lang('الأحد')</option>
                                        <option value="1">@lang('الاثنين')</option>
                                        <option value="2">@lang('الثلاثاء')</option>
                                        <option value="3">@lang('الأربعاء')</option>
                                        <option value="4">@lang('الخميس')</option>
                                        <option value="5">@lang('الجمعة')</option>
                                        <option value="6">@lang('السبت')</option>
                                    </select>
                                </div>
                            </div>
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
    <button type="button" class="btn btn-outline--primary cuModalBtn" data-modal_title="@lang('إضافة رحلة جديدة')">
        <i class="las la-plus"></i> @lang('إضافة جديد')
    </button>
@endpush

@push('script-lib')
    <script src="{{ asset('assets/admin/js/cu-modal.js') }}"></script>
@endpush
