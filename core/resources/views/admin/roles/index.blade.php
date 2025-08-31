@extends('admin.layouts.app')

@section('panel')
<div class="row">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-body p-0">
        <div class="table-responsive--md table-responsive">
          <table class="table table--light style--two">
            <thead>
              <tr>
                <th>@lang('الاسم')</th>
                <th class="text-end">@lang('الإجراءات')</th>
              </tr>
            </thead>
            <tbody>
              @forelse($roles as $role)
                <tr>
                  <td>{{ $role->name }}</td>
                  <td class="text-end">
                    {{-- زر تعديل يجلب فورم التعديل من ملف منفصل --}}
                    <button type="button"
                            class="btn btn-sm btn-outline--primary btn-open-edit"
                            data-url="{{ route('admin.role.edit', $role->id) }}">
                      <i class="la la-pencil"></i> @lang('تعديل')
                    </button>

                    {{-- (اختياري) رابط يفتح صفحة التعديل الكاملة --}}
                    {{-- <a href="{{ route('admin.role.edit', $role->id) }}" class="btn btn-sm btn--secondary">
                      @lang('فتح صفحة التعديل')
                    </a> --}}
                  </td>
                </tr>
              @empty
                <tr>
                  <td class="text-muted text-center" colspan="100%">
                    {{ __($emptyMessage ?? 'لا توجد بيانات') }}
                  </td>
                </tr>
              @endforelse
            </tbody>
          </table>
        </div>
      </div>

      @if(method_exists($roles, 'links'))
      <div class="card-footer">
        {{ $roles->links() }}
      </div>
      @endif
    </div>
  </div>
</div>

{{-- Modal: سنحقن فيه فورم التعديل القادم من ملف منفصل --}}
<div class="modal fade" id="editModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">@lang('تعديل صلاحية')</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="@lang('إغلاق')"></button>
      </div>
      <div class="modal-body">
        <div class="py-4 text-center text-muted">@lang('جاري التحميل ...')</div>
      </div>
    </div>
  </div>
</div>
@endsection

@push('script')
<script>
"use strict";
(function () {
  const editModal = document.getElementById('editModal');
  const modalBody = editModal.querySelector('.modal-body');

  document.querySelectorAll('.btn-open-edit').forEach(btn => {
    btn.addEventListener('click', async () => {
      const url = btn.getAttribute('data-url');
      // إظهار المودال أولاً
      const bsModal = new bootstrap.Modal(editModal);
      bsModal.show();

      // Placeholder
      modalBody.innerHTML = '<div class="py-4 text-center text-muted">@lang("جاري التحميل ...")</div>';

      try {
        const res = await fetch(url, { headers: { 'X-Requested-With': 'XMLHttpRequest' } });
        const html = await res.text();
        modalBody.innerHTML = html;
      } catch (e) {
        modalBody.innerHTML = '<div class="alert alert--danger m-3">@lang("تعذر تحميل نموذج التعديل")</div>';
      }
    });
  });
})();
</script>
@endpush

@push('style')
<link href="https://fonts.googleapis.com/css2?family=Tajawal:wght@400;500;700&display=swap" rel="stylesheet">
<style>
  html, body {
    font-family: 'Tajawal', system-ui, -apple-system, Segoe UI, Roboto, "Helvetica Neue", Arial, "Noto Sans", "Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
  }
</style>
@endpush
