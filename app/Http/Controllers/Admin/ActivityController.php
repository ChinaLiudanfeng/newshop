<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Models\Information;
use App\Models\Activity;
use App\Http\Models\Course;
use App\Http\Models\Act_course;

class ActivityController extends Controller
{



    public function activity_addgoods()
    {

        $goodsInfo=Course::where('is_del',1)->get()->toArray();
    	return view('admin.activity.activity_goods',['goodsInfo'=>$goodsInfo]);
    }


    public function activity_doaddgoods(Request $request)
    {

    	$info = $request->all();
     foreach ($info['course_id'] as $key => $value) {
       foreach ($info['price'] as $k => $v) {
     	 $data=[
      	'course_id'=>$value,
      	'ag_title'=>$info['ag_title'],
      	'ag_content'=>$info['ag_content'],
      	'act_price'=>$v*0.85,
        'act_startTime'=>str_replace('T',' ',$info['act_startTime']),
        'act_endTime'=>str_replace('T',' ',$info['act_endTime']),
        'create_time'=>time(),
        'token'=>$info['_token']
      ];
      //
      $res=Act_course::create($data);
        }
     }

      if($res){
      	return redirect('admin/activity_courseList');
      }else{
      	 echo "<script>alert('创建失败'),window.location.href=activity_addgoods;<script/>";
      }
    }


     ////活动课程详情页面
    public function  activity_courseList(Request $request)
    {

       $actcorInfo=Act_course::where('is_del',1)->get()->toArray();  //查询活动表
       $course_id=array_column($actcorInfo, 'course_id');//取出活动表中课程一列id
       $user=Course::whereIn('course_id',$course_id)->where('is_del',1)->get()->toArray();//根据活动表中的课程id，查课程表的详细信息。
       $info=Act_course::join('course','activity_course.course_id','=','course.course_id')->where('activity_course.is_del',1)->get()->toArray();
       foreach ($info as $key => $value) {

            $value['act_startTime']=str_replace('T',' ',$value['act_startTime']);
       }
       return view('admin.activity.activity_courseList',['info'=>$info]);

    }


    public function activity_delOnly(Request $request)
    {
    	$id=request('ag_id');
    	$res=Act_course::where('ag_id',$id)->update(['is_del'=>2]);
    	if($res){
    		return redirect('admin/activity_courseList');
    	}

    }
    public function activity_delmax()
    {
    	$token=request('_token');

    	$res=Act_course::where('token',$token)->update(['is_del'=>2]);
    	if($res){
    		return redirect('admin/activity_courseList');
    	}
    }




}
