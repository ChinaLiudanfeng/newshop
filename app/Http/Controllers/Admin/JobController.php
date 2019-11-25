<?php

namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Models\Job;
use App\Http\Models\Catelog;
use App\Http\Models\Course;
class JobController extends Controller
{
    //作业添加
    public function  job_add(Request $request)
    {
        //x循环讲师表 ，输出id和讲师名
        //循环该讲师下的课程
        //循环该课程下的章
        $data = request()->input('id');
        //var_dump($data);die;
        return view('admin.job.job_add',['data'=>$data]);
    }

    //处理作业添加
    public function  job_doadd(Request $request)
    {
        $info = $request->all();

        unset($info['_token']);
        $info['create_time'] = time();
        $catelog=$info['catelog_id'];
        $data = Catelog::where('catelog_id',$catelog)->first()->toArray();
        $id =$data['course_id'];

        $date =Course::join('catalog','catalog.course_id', '=','course.course_id')->where(['course.is_del'=>1,'catalog.course_id'=>$id])->get()->toArray();
        //var_dump($date);die;
        //$course_id=$date[0]['course_id'];
        //var_dump($course_id);die;
        $test = [
            'course_id'=>$date[0]['course_id'],
            'catelog_id'=>$date[0]['catelog_id'],
            'job_name'=>$info['job_name'],
            'create_time'=>$info['create_time'],
            'job_content'=>$info['job_name'],
        ];
        $res = Job::insert($test);
        if ($res) {
            echo "<script>alert('添加成功');window.location.href = 'job_index';</script>";
        } else {
            echo "<script>alert('添加失败');window.location.href = 'job_add';</script>";
        };
    }
    //作业页面展示
    public function job_index(Request $request)
    {
        $catelog_id = $request->all();
        $info =Job::join('Catalog','Catalog.catelog_id','=','Job.catelog_id')->where(['Job.is_del'=>1])->get()->toArray();
        //var_dump($info);die;
        return view('admin.job.job_index',['info'=>$info]);
    }

    public function job_del(Request $request)
    {
        $id=request('id');

        $res=Job::where('job_id',$id)->update(['is_del'=>2]);
        if($res){
            echo json_encode(['content'=>'删除成功','icon'=>6,'code'=>1]);
        }else{
            echo json_encode(['content'=>'删除失败','icon'=>5,'code'=>2]);
        }

    }

}

