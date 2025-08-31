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
                                    <th>@lang('يبدأ من')</th>
                                    <th>@lang('ينتهي عند')</th>
                                    <th>@lang('المدة')</th>
                                    <th>@lang('الحالة')</th>
                                    <th>@lang('الإجراء')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($schedules as $item)
                                    @php
                                        $start = Carbon\Carbon::parse($item->start_from);
                                        $end   = Carbon\Carbon::parse($item->end_at);

                                        // إذا كان وقت الانتهاء أصغر من البدء، نفترض أنه لليوم التالي
                                        if ($end->lt($start)) {
                                            $end->addDay();
                                        }

                                        $diff = $start->diff($end);
                                        $h = (int)$diff->format('%h');
                                        $m = (int)$diff->format('%i');

                                        // دوال تصريف بسيطة للغة العربية
                                        $hoursTxt = $h === 0 ? '' :
                                                    ($h === 1 ? 'ساعة' : ($h === 2 ? 'ساعتان' : $h.' ساعات'));
                                        $minsTxt  = $m === 0 ? '' :
                                                    ($m === 1 ? 'دقيقة' : ($m === 2 ? 'دقيقتان' : $m.' دقائق'));

                                        $durationAr = trim(($hoursTxt.' '.$minsTxt));
                                        if ($durationAr === '') { $durationAr = '0 دقيقة'; }
                                    @endphp
                                    <tr>
                                        {{-- غيّر التنسيق إلى h:i A إن رغبت بــ 12 ساعة --}}
                                        <td>{{ showDateTime($item->start_from, 'H:i') }}</td>
                                        <td>{{ showDateTime($item->end_at,   'H:i') }}</td>

                                        <td>{{ $durationAr }}</td>

                                        <td>@php echo $item->statusBadge; @endphp</td>

                                        <td>
                                            <div class="button--group">
                                                <button type="button"
                                                        class="btn btn-sm btn-outline--primary cuModalBtn"
                                                        data-resource='@json($item)'
                                                        data-modal_title="@lang('تعديل المواعيد')">
                                                    <i class="la la-pencil"></i> @lang('تعديل')
                                                </button>

                                                @if (!$item->status)
                                                    <button type="button"
                                                            class="btn btn-sm btn-outline--success confirmationBtn"
                                                            data-action="{{ route('admin.trip.schedule.status', $item->id) }}"
                                                            data-question="@lang('هل أنت متأكد من تفعيل هذا الجدول؟')">
                                                        <i class="la la-eye"></i> @lang('تفعيل')
                                                    </button>
                                                @else
                                                    <button type="button"
                                                            class="btn btn-sm btn-outline--danger confirmationBtn"
                                                            data-action="{{ route('admin.trip.schedule.status', $item->id) }}"
                                                            data-question="@lang('هل أنت متأكد من تعطيل هذا الجدول؟')">
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

                @if ($schedules->hasPages())
                    <div class="card-footer py-4 rtl-ar">
                        {{ paginateLinks($schedules) }}
                    </div>
                @endif
            </div>
        </div>
    </div>

    <x-confirmation-modal />

    <!-- Modal: إضافة/تعديل جدول -->
    <div id="cuModal" class="modal fade rtl-ar" tabindex="-1" role="dialog" aria-labelledby="cuModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 id="cuModalLabel" class="modal-title"></h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>
                <form action="{{ route('admin.trip.schedule.store') }}" method="POST">
                    @csrf

                    <div class="modal-body">
                        <div class="form-group">
                            <label>@lang('يبدأ من')</label>
                            <input type="time" class="form-control" name="start_from" required>
                        </div>

                        <div class="form-group">
                            <label>@lang('ينتهي عند')</label>
                            <input type="time" name="end_at" class="form-control" required>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="submit" class="btn btn--primary w-100 h-45">@lang('تأكيد')</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@push('breadcrumb-plugins')
    <button type="button" class="btn btn-sm btn-outline--primary cuModalBtn" data-modal_title="@lang('إضافة جدول جديد')">
        <i class="las la-plus"></i> @lang('إضافة جديد')
    </button>
@endpush

@push('script-lib')
    <script src="{{ asset('assets/admin/js/cu-modal.js') }}"></script>
@endpush
