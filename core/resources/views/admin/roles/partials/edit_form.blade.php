{{-- تنبيه: هذا Partial فقط للفورم بدون حاويات كروت/تخطيط --}}

{{-- أخطاء التحقق --}}
@if ($errors->any())
  <div class="alert alert--danger">
    <ul class="mb-0">
      @foreach ($errors->all() as $error)
        <li>{{ $error }}</li>
      @endforeach
    </ul>
  </div>
@endif

<form action="{{ route('admin.role.update', $role->id) }}" method="POST">
  @csrf
  @method('PUT')

  <div class="row">
    {{-- الاسم --}}
    <div class="col-md-6">
      <div class="form-group">
        <label>@lang('الاسم')</label>
        <input type="text"
               class="form-control"
               name="name"
               value="{{ old('name', $role->name) }}"
               required>
        @error('name') <small class="text-danger">{{ $message }}</small> @enderror
      </div>
    </div>

    {{-- صلاحيات الكاونتر --}}
    <div class="col-md-3">
      <div class="form-group">
        <label>@lang('صلاحيات الكاونتر')</label>
        <select name="counter" class="form-control" required>
          <option value="1" {{ (int)old('counter', $role->counter) === 1 ? 'selected' : '' }}>
            @lang('عرض فقط')
          </option>
          <option value="2" {{ (int)old('counter', $role->counter) === 2 ? 'selected' : '' }}>
            @lang('عرض + تعديل')
          </option>
          <option value="3" {{ (int)old('counter', $role->counter) === 3 ? 'selected' : '' }}>
            @lang('عرض + تعديل + إضافة')
          </option>
        </select>
        @error('counter') <small class="text-danger">{{ $message }}</small> @enderror
      </div>
    </div>

    {{-- صلاحيات الأسطول --}}
    <div class="col-md-3">
      <div class="form-group">
        <label>@lang('صلاحيات الأسطول')</label>
        <select name="fleet" class="form-control" required>
          <option value="1" {{ (int)old('fleet', $role->fleet) === 1 ? 'selected' : '' }}>
            @lang('عرض فقط')
          </option>
          <option value="2" {{ (int)old('fleet', $role->fleet) === 2 ? 'selected' : '' }}>
            @lang('عرض + تعديل')
          </option>
          <option value="3" {{ (int)old('fleet', $role->fleet) === 3 ? 'selected' : '' }}>
            @lang('عرض + تعديل + إضافة')
          </option>
        </select>
        @error('fleet') <small class="text-danger">{{ $message }}</small> @enderror
      </div>
    </div>
  </div>

  <button type="submit" class="btn btn--primary w-100 h-45 mt-2">
    @lang('تأكيد')
  </button>
</form>
