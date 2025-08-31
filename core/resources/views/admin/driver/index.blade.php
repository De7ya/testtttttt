@extends("admin.layouts.app")

@section("panel")
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h5>@lang("قائمة السائقين")</h5>
                    <button type="button" class="btn btn-sm btn-outline--primary cuModalBtn" data-modal_title="@lang("إضافة سائق جديد")" data-resource="">
                        <i class="las la-plus"></i> @lang("إضافة سائق")
                    </button>
                </div>

                <div class="card-body p-0">
                    <div class="table-responsive--md table-responsive">
                        <table class="table table--light style--two text-center">
                            <thead>
                                <tr>
                                    <th>@lang("الاسم")</th>
                                    <th>@lang("العمر")</th>
                                    <th>@lang("الهاتف")</th>
                                    <th>@lang("العنوان")</th>
                                    <th>@lang("رقم الرخصة")</th>
                                    <th>@lang("الحالة")</th>
                                    <th>@lang("العمليات")</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($drivers as $driver)
                                    <tr>
                                        <td>{{ $driver->name }}</td>
                                        <td>{{ $driver->age }}</td>
                                        <td>{{ $driver->phone }}</td>
                                        <td>{{ $driver->address }}</td>
                                        <td>{{ $driver->license_number }}</td>
                                        <td>
                                            @if($driver->status)
                                                <span class="badge badge--success">@lang("نشط")</span>
                                            @else
                                                <span class="badge badge--warning">@lang("غير نشط")</span>
                                            @endif
                                        </td>
                                        <td>
                                            <div class="button--group">
                                                <button type="button" class="btn btn-sm btn-outline--primary cuModalBtn"
                                                    data-resource="{{ $driver }}"
                                                    data-modal_title="@lang("تعديل بيانات السائق")">
                                                    <i class="la la-pencil"></i> @lang("تعديل")
                                                </button>
                                                <button type="button" class="btn btn-sm btn-outline--danger confirmationBtn"
                                                    data-action="{{ route("admin.driver.destroy", $driver->id) }}"
                                                    data-question="@lang("هل أنت متأكد من حذف هذا السائق؟")">
                                                    <i class="la la-trash"></i> @lang("حذف")
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="100%" class="text-center text-muted">@lang("لا يوجد سائقون")</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    {{-- Modal --}}
    <div id="cuModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form action="{{ route("admin.driver.store") }}" method="POST">
                    @csrf
                    <input type="hidden" name="id" id="driverId">
                    <div class="modal-header">
                        <h5 class="modal-title"></h5>
                        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                            <i class="las la-times"></i>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>@lang("الاسم")</label>
                            <input type="text" class="form-control" name="name" required>
                        </div>

                        <div class="form-group">
                            <label>@lang("العمر")</label>
                            <input type="number" class="form-control" name="age" required>
                        </div>

                        <div class="form-group">
                            <label>@lang("رقم الهاتف")</label>
                            <input type="text" class="form-control" name="phone" required>
                        </div>

                        <div class="form-group">
                            <label>@lang("العنوان")</label>
                            <input type="text" class="form-control" name="address">
                        </div>

                        <div class="form-group">
                            <label>@lang("رقم الرخصة")</label>
                            <input type="text" class="form-control" name="license_number">
                        </div>

                        <div class="form-group">
                            <label>@lang("الحالة")</label>
                            <select class="form-control" name="status" required>
                                <option value="1">@lang("نشط")</option>
                                <option value="0">@lang("غير نشط")</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn--primary w-100">@lang("حفظ")</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    {{-- Confirmation Modal --}}
    <div id="confirmationModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">@lang("تأكيد العملية")</h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <p class="question"></p>
                </div>
                <div class="modal-footer">
                    <form action="" method="POST" class="d-inline">
                        @csrf
                        <button type="button" class="btn btn--dark" data-bs-dismiss="modal">@lang("إلغاء")</button>
                        <button type="submit" class="btn btn--primary">@lang("تأكيد")</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@push("script")
<script>
    (function($){
        "use strict";

        $(".cuModalBtn").on("click", function () {
            const modal = $("#cuModal");
            const resource = $(this).data("resource");
            const title = $(this).data("modal_title");
            
            modal.find(".modal-title").text(title);

            if(resource){
                // Update form action for editing
                modal.find("form").attr("action", "{{ route("admin.driver.update", ":id") }}".replace(":id", resource.id));
                modal.find("input[name=id]").val(resource.id);
                modal.find("input[name=name]").val(resource.name);
                modal.find("input[name=age]").val(resource.age);
                modal.find("input[name=phone]").val(resource.phone);
                modal.find("input[name=address]").val(resource.address);
                modal.find("input[name=license_number]").val(resource.license_number);
                modal.find("select[name=status]").val(resource.status);
            } else {
                // Reset form for adding new driver
                modal.find("form").attr("action", "{{ route("admin.driver.store") }}");
                modal.find("form")[0].reset();
                modal.find("input[name=id]").val("");
                modal.find("select[name=status]").val("1");
            }

            modal.modal("show");
        });

        $(".confirmationBtn").on("click", function () {
            const modal = $("#confirmationModal");
            const action = $(this).data("action");
            const question = $(this).data("question");
            
            modal.find(".question").text(question);
            modal.find("form").attr("action", action);
            modal.modal("show");
        });

    })(jQuery);
</script>
@endpush