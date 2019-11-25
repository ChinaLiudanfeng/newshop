@extends('layouts.admin')
@section('title', 'Page Title')
@section('content')
    <h3 align="center">活动模块</h3>
    <div class="layui-form">
        <table class="layui-table">
            <colgroup>
                <col >
                <col>
                <col >
                <col>
                <col >
                <col>
                <col >
                <col>
                <col>
                <col width="150">
            </colgroup>
            <thead>
            <tr>
                <th></th>
                <th>活动编号</th>
                <th>活动标题</th>
                <th>活动内容</th> 
                <th>活动课程</th>
                <th>课程原价</th>
                <th>课程现价</th>
                <th>活动开始时间</th>
                <th>活动结束时间</th>  
                <th>活动创建时间</th>

                <th>操作</th>
            </tr>
            </thead>
            <tbody id="list">
            @foreach($info as $item)
                <tr>
                    <td></td>
                    <td>{{$item['ag_id']}}</td>
                    <td>{{$item['ag_title']}}</td>
                    <td>{{$item['ag_content']}}</td>
                    <td>{{$item['course_name']}}</td>
                    <td>{{$item['price']}}</td>
                    <td>{{$item['act_price']}}</td>
                    <td>{{$item['act_startTime']}}</td>
                    <td>{{$item['act_endTime']}}</td>
                    <td>{{date('Y-m-d H:i:s',$item['create_time'])}}</td>
                    <td>
                        <div class="layui-btn-group">
                            <a type="button" class="layui-btn" href="{{url('admin/activity_delmax')}}?_token={{$item['token']}}">删除该活动及相关活动产品</a>
                            <a type="button" class="layui-btn" href="{{url('admin/activity_delOnly')}}?ag_id={{$item['ag_id']}}">删除该条课程活动</a>
                        </div>
                    </td>
                </tr>
             @endforeach
            </tbody>
        </table>
    </div>
@endsection
