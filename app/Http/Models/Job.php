<?php

namespace App\Http\Models;

use Illuminate\Database\Eloquent\Model;

class Job extends Model
{
    protected $table = 'job';
    protected $primaryKey = 'job_id';
    public $timestamps = false;
    protected $guarded = [];//批量添加需要的指定属性
}
