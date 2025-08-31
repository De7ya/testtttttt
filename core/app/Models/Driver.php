<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Driver extends Model
{
    protected $table = 'drivers'; // make sure this matches your table name

    protected $fillable = [
        'name',
        'age',
        'phone',
        'address',
        'license_number',
        'status',
    ];
}
