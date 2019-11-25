<?php

namespace App\Http\Models;

use Illuminate\Database\Eloquent\Model;

class Slide extends Model
{
    protected $table = 'slide';//表名
    protected $primaryKey = 'slide_id';//主键
    public $timestamps = false;//是否自动添加时间
    protected $guarded = [];//批量添加需要的指定属性
}
