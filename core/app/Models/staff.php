<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class staff extends Model
{
    protected $table = 'admins'; // make sure this matches your table name

    protected $fillable = [
        'name',
        'email',
        'phone',
        'status',
    ];
}
