@extends('layouts.admin')
@section('title', 'Page Title')
@section('content')
    <h3 align="center">课程收益情况</h3>
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
                <th>课程名称: {{ $data['course_name'] }}</th>
                <th>销售金额{{$data['revenue']}} </th>
            </tr>
            <tr>
                <th>购买人</th>
                <th>购买价格</th>
                <th>原价格</th>
                <th>是否参加了活动</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="list">
            @foreach($data['data'] as $kk=>$vv)
                <tr>
                    <td>{{ $vv['u_name'] }}</td>
                    <td>{{ $data['act_price'] }}</td>
                    <td>{{ $data['price'] }}</td>
                    <td>
                        @if ($data['price']>$data['act_price'])
                            参加了活动
                        @else
                            没有参加
                        @endif
                    </td>
                    <td>
                        <div class="layui-btn-group">
                            <a type="button" class="layui-btn">修改订单</a>
                        </div>
                    </td>
                </tr>
            @endforeach
            </tbody>
        </table>
    </div>

@endsection
