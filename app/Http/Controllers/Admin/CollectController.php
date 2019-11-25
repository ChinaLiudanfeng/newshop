<?php

/*
 * This file is part of the gedongdong/laravel_rbac_permission.
 *
 * (c) gedongdong <gedongdong2010@163.com>
 *
 * This source file is subject to the MIT license that is bundled
 * with this source code in the file LICENSE.
 */

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Models\Users;
use App\Library\Response;
use App\Validate\ModifyPwdValidate;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Http\Models\Collect;
use App\Http\Models\Course;
use App\Http\Models\User;

class CollectController extends Controller
{
    public function collect_add(Request $request){
        $data['course_id']= request()->course_id;
        $data['u_id']= 1;
        $data['f_id']= 1;
        $data['create_time']=time();
        $res = Collect::create($data);
        if($res){
            return redirect('admin/collect/collect_list');
        }
    }

    public function collect_list(Request $request)
    {
      $user = $request->all('id');
       //var_dump($user['id']);die;

        $data =Collect::join('Course','Course.course_id','=','Collect.course_id')->join('User','User.u_id','=','Collect.u_id')->where(['Course.is_del'=>1,'collect.is_del'=>1,'User.u_id'=>$user['id']])->get();

        //var_dump($data);die;
        return view('admin.collect.collect_list',compact(['data']));
    }

    public function destroy(Request $request){
        $collect_id = request()->collect_id ;
        //var_dump($collect_id);die;
        $res =Collect::where(['collect_id'=>$collect_id])->update(['is_del'=>2]);
        if($res){
            return ['code'=>1,'msg'=>'删除成功',];
        }else{
            return ['code'=>0,'msg'=>'删除失败'];
        }
    }
}