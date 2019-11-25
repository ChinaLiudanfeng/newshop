<?php

namespace App\Http\Models;

use Illuminate\Database\Eloquent\Model;

class Act_course extends Model
{
    protected $table = 'activity_course';
    protected $primaryKey = 'ag_id';
    public $timestamps = false;
    protected $guarded = [];//批量添加需要的指定属性




  public static function er_array_unique($arr){
	  $newarr = array();
	  if(is_array($arr)){
	    foreach($arr as $v){
	      if(!in_array($v,$newarr,true)){
	        $newarr[] = $v;
	      }
	    }
	  }else{
	     return false;
	  }
	  return $newarr;

	}

}
