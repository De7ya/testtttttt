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
            .rtl-ar .table th,
            .rtl-ar .table td{
                vertical-align: middle;
                font-size: .95rem;
            }
            .rtl-ar .table thead th{ font-weight:700; }
            .rtl-ar .fw-bold{ font-weight:700 !important; }
            .rtl-ar .small{ font-size:.85rem; }
            .modal .close{ border:0; background:transparent; }
        </style>
    @endonce
@endpush

@section('panel')
    <div class="row rtl-ar">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body p-0">

                    <div class="table-responsive--sm table-responsive">
                        <table class="table table--light style--two">
                            <thead>
                                <tr>
                                    <th>@lang('المستخدم')</th>
                                    <th>@lang('تاريخ الإرسال')</th>
                                    <th>@lang('المرسِل')</th>
                                    <th>@lang('الموضوع')</th>
                                    <th>@lang('الإجراء')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($logs as $log)
                                    <tr>
                                        <td>
                                            @if($log->user)
                                                <span class="fw-bold">{{ $log->user->fullname }}</span>
                                                <br>
                                                <span class="small">
                                                    <a href="{{ route('admin.users.detail', $log->user_id) }}">
                                                        <span>@</span>{{ $log->user->username }}
                                                    </a>
                                                </span>
                                            @else
                                                <span class="fw-bold">@lang('النظام')</span>
                                            @endif
                                        </td>

                                        <td>
                                            {{ showDateTime($log->created_at) }}<br>
                                            <span class="text-muted">{{ diffForHumans($log->created_at) }}</span>
                                        </td>

                                        <td>
                                            <span class="fw-bold">{{ keyToTitle($log->notification_type) }}</span>
                                            <br>
                                            @lang('عبر') {{ __($log->sender) }}
                                        </td>

                                        <td>
                                            @if($log->subject) {{ __($log->subject) }} @else @lang('غير متوفر') @endif
                                        </td>

                                        <td>
                                            <button
                                                class="btn btn-sm btn-outline--primary notifyDetail"
                                                data-type="{{ $log->notification_type }}"
                                                @if($log->notification_type == 'email')
                                                    data-message="{{ route('admin.report.email.details',$log->id) }}"
                                                @else
                                                    data-message="{{ $log->message }}"
                                                    @if($log->image) data-image="{{ asset(getFilePath('push').'/'.$log->image) }}" @endif
                                                @endif
                                                data-sent_to="{{ $log->sent_to }}"
                                            >
                                                <i class="las la-desktop"></i> @lang('التفاصيل')
                                            </button>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td class="text-muted text-center" colspan="100%">{{ __($emptyMessage) }}</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table><!-- table end -->
                    </div>
                </div>

                @if($logs->hasPages())
                    <div class="card-footer py-4 rtl-ar">
                        {{ paginateLinks($logs) }}
                    </div>
                @endif
            </div><!-- card end -->
        </div>
    </div>

    <!-- Modal: تفاصيل الإشعار -->
    <div class="modal fade rtl-ar" id="notifyDetailModal" tabindex="-1" aria-labelledby="notifyDetailModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title fw-bold" id="notifyDetailModalLabel">@lang('تفاصيل الإشعار')</h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <h6 class="text-center mb-3">@lang('إلى'): <span class="sent_to fw-bold"></span></h6>
                    <div class="detail"></div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('breadcrumb-plugins')
    @if(@$user)
        <a href="{{ route('admin.users.notification.single',$user->id) }}" class="btn btn-outline--primary btn-sm">
            <i class="las la-paper-plane"></i> @lang('إرسال إشعار')
        </a>
    @else
        <x-search-form placeholder="@lang('ابحث باسم المستخدم')" dateSearch="yes" />
    @endif
@endpush

@push('script')
<script>
    (function($){
        "use strict";

        $('.notifyDetail').on('click', function(){
            let content = '';
            const hasImage = $(this).data('image');
            const type = $(this).data('type');
            let message = $(this).data('message');

            if (hasImage) {
                content += `<img src="${hasImage}" class="w-100 mb-2 rounded" alt="image">`;
            }

            // إذا كان النوع بريد إلكتروني نعرضه داخل iframe
            if (type === 'email') {
                content += `<iframe src="${message}" height="500" width="100%" style="border:0" title="Email Preview"></iframe>`;
            } else {
                content += message ?? '';
            }

            const sentTo = $(this).data('sent_to');
            const modal = $('#notifyDetailModal');

            modal.find('.detail').html(content);
            modal.find('.sent_to').text(sentTo ?? '');
            modal.modal('show');
        });
    })(jQuery);
</script>
@endpush
