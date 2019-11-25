@extends('layouts.admin')
@section('title', 'Page Title')
@section('content')
    <h3 align="center">讲师收益情况</h3>
    <div class="layui-form">
        <table class="layui-table">
            <colgroup>
                <col width="150">
                <col width="150">
                <col width="200">
                <col>
            </colgroup>
            <thead>
            <tr>
                <th>id</th>
                <th>课程名称</th>
                <th>销售数量</th>
                <th>订单价格</th>
                <th>记录时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="list">
            @foreach($date as $k=>$v)
            <tr>
                <td>{{ $v['detail_id'] }}</td>
                <td>{{ $v['course_name'] }}</td>
                <td>{{$b_num}}</td>
                <td>{{ $v['price'] }}</td>
                <td>{{date('Y-m-d H:i:s',$v['d_create_time'])}}</td>
                <td>
                    <div class="layui-btn-group">
                        <a type="button" class="layui-btn" href="/admin/lect_order_del?detail_id={{ $v['detail_id'] }}&lect_id={{ $v['lect_id'] }}&course_id={{ $v['course_id'] }}">删除</a>
                        <a type="button" class="layui-btn" href="/admin/lect_order_user_list?detail_id={{ $v['detail_id'] }}&lect_id={{ $v['lect_id'] }}&course_id={{ $v['course_id'] }}">销售详情</a>
                    </div>
                </td>
            </tr>
            @endforeach
            </tbody>
        </table>
        <div align="center">
        {{ $date ->appends($query)->links() }}
        </div>

    </div>
@endsection
