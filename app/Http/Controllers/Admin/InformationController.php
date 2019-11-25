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
use Illuminate\Http\Request;
use App\Http\Models\Information;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use App\Library\Response;
use Illuminate\Database\QueryException;


class InformationController extends Controller
{
    public function create()
    {
        return view('admin.information.create');
    }
    public function create_do(Request $request)
    {
        $res =
        $infor_title = $request -> input('infor_title');
//        dd($infor_title);
        $infor_content = $request -> input('infor_content');

//        dd($infor_content);
        $infor_content = htmlentities($infor_content,ENT_QUOTES);
//       dd($infor_title);
        $infor_time = time();

        try{
            $res = [];
            $res[] = [
                'infor_title' => $infor_title,
                'infor_content' => $infor_content,
                'infor_time' => $infor_time
            ];
            Information::insert($res);

            DB::commit();

            return Response::response();

        }catch (QueryException $e) {
            DB::rollBack();
            Log::error('资讯创建数据库异常', [$e->getMessage()]);
            return Response::response(['code' => Response::SQL_ERROR, 'e' => $e]);
        }
    }

    public function index()
    {
        $infor = Information::select('infor_id','infor_title as title','infor_content','infor_time')
            ->get()
            ->toArray();
//        dd($infor);
//        dd($a);
//        $infor[0]['infor_content'] =  html_entity_decode($infor['infor_content'],ENT_QUOTES);
//        foreach($infor as $k => $v){
//////           print_r( $v['infor_content']);
////            $v['infor_content'] =  html_entity_decode($infor['infor_content'],ENT_QUOTES);
////
////        }
//////        dd();
//        $infor_arr = [];
//        foreach( $infor  as $i ){
////            var_dump($i);die;
//            $s =  html_entity_decode($i['infor_content'],ENT_QUOTES);
//            $infor_arr[] = [
//                'infor_id' => $i['infor_id'],
//                'title' => $i['title'],
//                'infor_content' => $s,
//                'infor_time' => $i['infor_time']
//            ];
//        }
//        dd($infor_arr);
        return view('admin.Information.index',['infor_arr' => $infor]);
    }

    public function delete(Request $request)
    {
        $infor_id = $request->get('infor_id');
//        dd($infor_id);
        if (!$infor_id) {
            return Response::response(['code' => Response::PARAM_ERROR]);
        }
        try{
            Information::where('infor_id',$infor_id)->delete();
            DB::commit();

            return Response::response();
        } catch (QueryException $e) {
            DB::rollBack();
            Log::error('删除资讯数据库异常', [$e->getMessage()]);

            return Response::response(['code' => Response::PARAM_ERROR, 'e' => $e]);
        }
    }

    public function edit(Request $request)
    {
        $infor_id = $request -> get('infor_id');
//        dd($infor);
        $error = '';
        $infor  = null;
        if (!$infor_id) {
            $error = '参数有误';
        } else {
            $infor = Information::find($infor_id);
            $infor['infor_content'] = html_entity_decode($infor['infor_content'],ENT_QUOTES);
        }
        return view('admin.Information.edit', [ 'error' => $error, 'infor' => $infor]);
    }
    public function update(Request $request)
    {
//        echo 111;die;
        $data = Request() -> all();
//        var_dump($data);die;
        $infor_id = $data['infor_id'];
//        dd($infor_id);

        try{
            Information::where(['infor_id'=>$infor_id])->update($data);
            DB::commit();

            return Response::response();
        } catch (QueryException $e) {
            DB::rollBack();
            Log::error('修改资讯数据库异常', [$e->getMessage()]);

            return Response::response(['code' => Response::PARAM_ERROR, 'e' => $e]);
        }

    }

}

