<?php

namespace App\Http\Controllers\admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Models\Userinfo;
use App\Http\Models\Users;
/**
 * 注册登录模块
 */
class UserinfoController extends Controller
{
    public function user_desc(Request $request){

         return view('admin.user_desc.user_desc');
    }

    public function user_desc_add(Request $request){
        $move =$request->all();
//        var_dump($move);die;
        if($move['u_head']!=NULL){
            $file = $_FILES['u_head'];
            $u_head = $this->file($file);
        }else{
            $u_head = '';
        }
//
        $user_id = $request->session()->get('user');
        $_SERVER['uid'] = $user_id;
        $user=$user_id['name'];
        $data = Users::where(['name'=>$user])->first();
//        var_dump($data['id']);die;
        $u_age = $move['u_age'];

        session(['u_age'=>$u_age]);
        $move['u_age'] =session()->all()['u_age'];
//        dd($move['u_age']);
        $move['u_time']=time();
//        //将日期转化为年龄
        $move['u_age']=$this->getAge($move['u_age'])+1;
        $u_time = time();
        $data=[
            'u_id'=>$data['id'],
            'u_name'=>$move['u_name'],
            'u_sex'=>$move['u_sex'],
            'u_age'=>$move['u_age'],
            'u_head'=>$u_head,
            'u_time'=>$u_time,
        ];
        $data = Userinfo::insert($data);
        if ($data) {
            return json_encode(['code'=>1,'msg'=>'添加成功']);
        }else{
            return json_encode(['code'=>2,'msg'=>'添加失败']);
        }
    }

//文件上传
    function file($file)
    {

        // var_dump($file);die;
        //文件上传是否错误
        if($file['error']!=0){
            echo json_encode(['code'=>201,'msg'=>"文件上传异常"]);die;
        }
        if($file['size']>1024*1024*2){
            echo json_encode(['code'=>202,'msg'=>"文件太大"]);
        }
        $type = ['image/png','image/jpg','image/jpeg','image/gif','video/mp4'];
        if(!in_array($file['type'],$type)){
            echo json_encode(['code'=>203,'msg'=>"文件类型错误"]);
        }
        $name = $file['name'];
        $ext = pathinfo($name,PATHINFO_EXTENSION);
        //var_dump($ext);die;
        $date = date("Y-n-j");
        //dd($date);
        if(!file_exists("uploads/".$date)){
            mkdir("uploads/".$date,777);
        }

        $det = "uploads/".$date."/".md5(time().rand(1000,9999)).'.'.$ext;
        //dd($det);
        $res = move_uploaded_file($file['tmp_name'],$det);
        return $det;
        // dd($res);
    }

    //将日期转换为年龄
    public function getAge(){
        $birthday =$move['u_age'] = session()->all()['u_age'];
        //转化成时间戳
        $birthday =strtotime($birthday);
        //格式化出生时间年月日
        $byear=date('Y',$birthday);
        $bmonth=date('m',$birthday);
        $bday=date('d',$birthday);

        //格式化当前时间年月日
        $tyear=date('Y');
        $tmonth=date('m');
        $tday=date('d');
        //开始计算年龄
        $age=$tyear-$byear;
        if($bmonth>$tmonth || $bmonth==$tmonth && $bday>$tday){
                    $age--;
        }
        return $age;
    }

    public function user_desc_list(Request $request){
        $data = Userinfo::where(['is_del'=>1])->get();
        $name = $_SERVER['SERVER_NAME'];
//        dd($name);
        return view('/admin/user_desc/user_desc_list',compact(['data','name']));
    }

    public function destroy(Request $request)
    {
        $user_info_id = request()->user_info_id ;
        //var_dump($user_info_id);die;
        $res =Userinfo::destroy($user_info_id);
        if($res){
            return ['code'=>1,'msg'=>'删除成功',];
        }else{
            return ['code'=>0,'msg'=>'删除失败'];
        }

    }

    public  function jin(Request $request)
    {
        $user_info_id = request()->user_info_id;
        //var_dump($user_info_id);
        $data = Userinfo::where(['user_info_id'=>$user_info_id])->update(['is_del'=>2]);
         if($data){
             return ['code'=>1,'msg'=>'禁用成功',];
         }else{
             return ['code'=>0,'msg'=>'已禁用'];
         }
    }
    public  function qi(Request $request)
    {
        $user_info_id = request()->user_info_id;
        //var_dump($user_info_id);
        $data = Userinfo::where(['user_info_id'=>$user_info_id])->update(['is_del'=>1]);
        if($data){
            return ['code'=>1,'msg'=>'成功',];
        }else{
            return ['code'=>0,'msg'=>'失败'];
        }
    }
}

