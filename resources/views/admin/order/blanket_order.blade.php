@extends('layouts.admin')
@section('title', 'Page Title')
@section('content')
    <h3 align="center">总订单</h3>
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
                <th>订单编号</th>
                <th>订单价格</th>
                <th>课程名称</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="list">
            @foreach($date as $k=>$v)
            <tr>
                <td>{{$v['order_id']}}</td>
                <td>{{$v['order_mark']}}</td>
                <td>{{$v['pay_price']}}</td>
                <td>{{$v['course_name']}}</td>
                <td>
                    <div class="layui-btn-group">
                        <a type="button" class="layui-btn" href="/admin/blanket_del?order_id={{ $v['order_id'] }}">删除</a>
                    </div>
                </td>
            </tr>
            @endforeach
            </tbody>
        </table>
        <div align="center">
        {{ $date ->links() }}
        </div>

    </div>
@endsection
