<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
//use App\Model\exaluateModel;
use App\Http\Models\exaluateModel;

class ExaluateController extends Controller
{
    //评价添加
    public function exalute_add()
    {
        return view('admin.exaluate.exaluate_add');
    }

    //处理评论添加
    public function exaluate_doadd(Request $request)
    {
        session_start();
        $content=request('e_content');
        // var_dump($content);die;
        $courser_id=request('courser_id');//课程id
        // $u_id=$_SESSION['u_id'];//用户id

        // $redis = new \Redis();
        // $redis->connect('127.0.0.1','6379');
        // $redis->incr('number');
        // $num=$redis->get('number');
        //  echo $num;die;  点赞个数

        $data=[
            'course_id'=>1,
            'u_id'=>1,
            'e_content'=>$content,
            'e_num'=>1,
            'create_time'=>time(),
        ];
        $res=exaluateModel::create($data);

        if($res){
            return redirect('admin/exalute_index');
        }

    }


    public function exalute_index(Request $request)
    {
        $data = $request->all();
        $course_id = $data['course_id'];
        //var_dump($issue_id);die;
        $info=exaluateModel::where(['is_del'=>1,'course_id'=>$course_id])->get()->toArray();

        return view('admin.exaluate.exalute_index',['info'=>$info]);

    }

    //软删除
    public  function exalute_del(Request $request)
    {
        $id=request('id');
        // var_dump($id);die;
        $res=exaluateModel::where('e_id',$id)->update(['is_del'=>2]);
        if($res){
            echo json_encode(['content'=>'删除成功','icon'=>6,'code'=>1]);
        }else{
            echo json_encode(['content'=>'删除失败','icon'=>5,'code'=>2]);
        }

    }
}
