@extends('admin.layouts.app')

@section('panel')
<div class="row">
    <div class="col-lg-8 offset-lg-2">
        <div class="card">
            <div class="card-header bg-warning text-dark">
                <h5 class="mb-0">تعديل بيانات السائق</h5>
            </div>
            <div class="card-body">
                <form action="{{ route('drivers.update', $driver->id) }}" method="POST">
                    @csrf

                    <div class="form-group mb-3">
                        <label for="name">اسم السائق</label>
                        <input type="text" name="name" id="name" class="form-control" value="{{ $driver->name }}" required>
                    </div>

                    <div class="form-group mb-3">
                        <label for="phone">رقم الهاتف</label>
                        <input type="text" name="phone" id="phone" class="form-control" value="{{ $driver->phone }}" required>
                    </div>

                    <div class="form-group mb-3">
                        <label for="status">الحالة</label>
                        <select name="status" id="status" class="form-select">
                            <option value="1" @if($driver->status == 1) selected @endif>نشط</option>
                            <option value="0" @if($driver->status == 0) selected @endif>معطل</option>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-primary">تحديث</button>
                    <a href="{{ route('drivers.index') }}" class="btn btn-secondary">رجوع</a>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
