<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
{
    Schema::create('drivers', function (Blueprint $table) {
        $table->id();
        $table->string('name');            // اسم السائق
        $table->integer('age');            // عمر السائق
        $table->string('phone');           // رقم الهاتف
        $table->text('address')->nullable();       // العنوان (اختياري)
        $table->string('license_number')->nullable(); // رقم الرخصة (اختياري)
        $table->timestamps();
    });
}


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('drivers');
    }
};
