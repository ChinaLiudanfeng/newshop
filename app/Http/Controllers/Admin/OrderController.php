<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Models\Detail;
use App\Http\Models\Order;
use App\Http\Models\Course;
use App\Http\Models\Lect;
use App\Http\Models\Userinfo;
use DB;
use App\Http\Models\Act_course;
class OrderController extends Controller
{
    //总订单
    public function blanket_order()
    {


        $user = request()->session()->get('user');
        //dd($user);
        if($user->administrator==1){
            $date = Order::join("Course","Order.course_id","=","Course.course_id")
                ->join("User_info","Order.u_id","=","User_info.u_id")
                ->where(['Order.is_del'=>1])->paginate(2);
            //dd($date);die;
        }else{
            $u_id = $user->id;
            $date = Order::join("Course","Order.course_id","=","Course.course_id")->where(['Order.u_id'=>$u_id,'Order.is_del'=>1])->paginate(2);
        }
        //dd($date);
        return view('admin.order.blanket_order',compact('date'));
    }

    //总订单删除
    public function blanket_del()
    {
        $post = request()->all();
        //dd($post);
        if($post['order_id']==''){
            echo "<script>alert('参数无');location.href='/admin/blanket_order';</script>";exit;
        }
       $order = Order::where(['order_id'=>$post['order_id']])->update(['is_del'=>2]);
       if($order){
            return redirect('/admin/blanket_order');
       }
    }

    //讲师订单
    public function lect_order()
    {
        $query = request()->all();
//        dd($query);
        $course_id=$query['course_id'];
        $b_num=Order::where('course_id',$course_id)->count();
        $date = Detail::join("Course","Detail.course_id","=","Course.course_id")->where(['Detail.is_del'=>1,'Detail.lect_id'=>$query['lect_id'],'Detail.course_id'=>$query['course_id']])->paginate(2);
//        $date = $date;
//        dd($date);
        $lect = Lect::where(['lect_id'=>$query['lect_id']])->get()->toArray();
//        dd($lect);

        $lect_name = $lect[0]['lect_name'];
        //dd($date);
//        dd($lect,$date);
        return view('admin.order.lect_order',compact('date','lect_name','query','b_num'));
    }

    //讲师订单删除
    public function lect_order_del()
    {
        $post = request()->all();
        //dd($post);
        if($post['detail_id']==''){
            return redirect("/admin/lect_order?lect_id=".$post['lect_id']."&course_id=".$post['course_id']);
        }
       $order = Detail::where(['detail_id'=>$post['detail_id']])->update(['is_del'=>2]);
       if($order){
            return redirect("/admin/lect_order?lect_id=".$post['lect_id']."&course_id=".$post['course_id']);
       }
    }

    public function  geren(Request $request)
    {
        $data1 = $request->all('id');
        $where=[
            'user_info_id'=>$data1['id']
        ];

        $res=Userinfo::where($where)->get()->toArray();
        //var_dump($res);die;
        $data = $res[0]['u_id'];
        //var_dump($data);die;
        //$res=Userinfo::join('Order',"Userinfo.u_id","=","Order.u_id")->join('')
        $date=DB::table('Order')
            ->join ('User_info',  'User_info.u_id','=','Order.u_id')
            ->join ('Detail',  'Order.course_id','=','Detail.course_id')
            ->where(['User_info.u_id'=>$data,'Order.is_del'=>1])
            ->get()->toArray();
        //var_dump($date);die;
        return view ('admin.user_desc.user',['date'=>$date]);
    }

//    public function geren_del()
//    {
//        $post = request()->all();
//        //dd($post);
//        if($post['order_id']==''){
//            echo "<script>alert('参数无');location.href='/admin/blanket_order';</script>";exit;
//        }
//        $order = Order::where(['order_id'=>$post['order_id']])->update(['is_del'=>2]);
//        if ($order) {
//            return json_encode(['code'=>0,'msg'=>'删除成功']);
//        }else{
//            return json_encode(['code'=>1,'msg'=>'删除失败']);
//        }
//    }
    public  function lect_order_user_list(Request $request)
    {
        $res=$request->all();
        $course_id=$res['course_id'];
        $data=Order::
            join ('User_info',  'User_info.user_info_id','=','Order.u_id')->
        where('course_id',$course_id)
            ->get()->toarray();
//        dd($data);
        $date=Act_course::where('course_id',$course_id)->get()->toarray();
//        dd($date);
        $b_num=Order::where('course_id',$course_id)->count();
        $arr=[];
        $arr['act_price']=$date[0]['act_price'];
        $arr['revenue']=$arr['act_price']*$b_num;
        $course_name=Course::where('course_id',$course_id)->get()->toarray();
//        dd($course_name);
        $arr['course_name']=$course_name[0]['course_name'];

        foreach($data as $k=>$v){
            $arr['price']=$v['pay_price'];
            $arr['data']=$data;
        }
//       dd($arr);
        return view("/admin/order/lect_user_order",['data'=>$arr]);
    }

}
