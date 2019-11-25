<?php

namespace App\Http\Models;

use Illuminate\Database\Eloquent\Model;

class Information extends Model
{
    protected $table = 'information';//表名
    protected $primaryKey = 'infor_id';//主键
    public $timestamps = false;//是否自动添加时间
}
