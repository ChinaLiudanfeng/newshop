<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Models\Slide;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use App\Library\Response;
use Illuminate\Database\QueryException;

class SlideController extends Controller
{
    public function create()
    {
        return view('admin.slide.create');
    }
    public function create_do(Request $request)
    {
        $slide =$request->all();
//        var_dump($move);die;
        if($slide['slide_url']!=NULL){
            $file = $_FILES['slide_url'];
            $slide_url = $this->file($file);
        }else{
            $slide_url = '';
        }
        $slide_time = time();

        try{
            $res = [];
            $res[] = [
                'slide_weight' => $slide['slide_weight'],
                'slide_url' => $slide_url,
                'slide_time' => $slide_time
            ];
            slide::insert($res);

            DB::commit();

            return Response::response();

        }catch (QueryException $e) {
            DB::rollBack();
            Log::error('轮播图创建数据库异常', [$e->getMessage()]);
            return Response::response(['code' => Response::SQL_ERROR, 'e' => $e]);
        }
    }
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
        if(!file_exists("img/".$date)){
            mkdir("img/".$date,777);
        }

        $det = "img/".$date."/".md5(time().rand(1000,9999)).'.'.$ext;
        //dd($det);
        $res = move_uploaded_file($file['tmp_name'],$det);
        return $det;
        // dd($res);
    }


    public function index()
    {
        $slide = slide::select('slide_id','slide_weight','slide_url','slide_status','slide_time')->paginate(3);
//        dd($slide);
        return view('admin.slide.index',['slide'=>$slide]);
    }

    public function delete(Request $request)
    {
        $slide_id = $request->get('slide_id');
//        dd($slide_id);
        if (!$slide_id) {
            return Response::response(['code' => Response::PARAM_ERROR]);
        }
        try{
            slide::where('slide_id',$slide_id)->delete();
            DB::commit();

            return Response::response();
        } catch (QueryException $e) {
            DB::rollBack();
            Log::error('删除轮播图数据库异常', [$e->getMessage()]);

            return Response::response(['code' => Response::PARAM_ERROR, 'e' => $e]);
        }
    }

    public function edit(Request $request)
    {
        $slide_id = $request -> get('slide_id');

        $error = '';
        $slide  = null;
        if (!$slide_id) {
            $error = '参数有误';
        } else {
            $slide = slide::find($slide_id);
        }
        return view('admin.slide.edit', [ 'error' => $error, 'slide' => $slide]);

    }
    public function update(Request $request)
    {
        $data = $request -> all();
//        var_dump($data);die;
        try{
            slide::where(['slide_id'=>$data['slide_id']])->update($data);
            DB::commit();

            return Response::response();

        } catch (QueryException $e) {
            DB::rollBack();
            Log::error('修改权限数据库异常', [$e->getMessage()]);

            return Response::response(['code' => Response::PARAM_ERROR, 'e' => $e]);
        }

    }

    // 是否上架的即点即改
    public function sale(Request $request)
    {
        $sale=request('sale');
//            var_dump($sale);die;
        if($sale == "启用"){
            $sale=2;
        }else{
            $sale=1;
        }
        $slide_id=request('slide_id');
//         var_dump($slide_id);die;
        $saleRes = slide::where('slide_id',$slide_id)->update(['slide_status'=>$sale]);
//         var_dump($saleRes);die;
        if($saleRes){
            echo json_encode(['info'=>3]);die;
        }else{
            echo json_encode(['info'=>4]);die;
        }
    }

}
