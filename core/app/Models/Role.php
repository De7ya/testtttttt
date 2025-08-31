<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    protected $fillable = ['name', 'counter', 'fleet'];

   protected $casts = ['counter' => 'integer', 'fleet' => 'integer'];

}
