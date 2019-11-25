@extends('layouts.admin')

@section('content')
    <table class="layui-table">
        <colgroup>
            <col width="50">
            <col width="120">
            <col width="80">
            <col width="100">
            <col>
            <col>
            <col width="120">
        </colgroup>mnc
        <thead>
        <tr>
            <th>ID</th>
            <th>登录人</th>
            <th>ip</th>
            <th>请求方式</th>
            <th>执行sql</th>
            <th>操作时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        @foreach($data as $v)
        <tr>
            <td>{{$v['id']}}</td>
            <td>{{$v['name']}}</td>
            <td>{{$v['ip']}}</td>
            <td>{{$v['method']}}</td>
            <td>{{$v['sql']}}</td>
            <td>{{date('Y-m-d H:i:s',$v['time'])}}</td>
            <td>
                <div class="layui-btn-group">
                    <button class="layui-btn layui-btn-sm edit">
                        <i class="layui-icon">&#xe642;</i>
                    </button>
                    <button class="layui-btn layui-btn-sm del">
                        <i class="layui-icon">&#xe640;</i>
                    </button>
                </div>
            </td>
        </tr>
        @endforeach
        </tbody>
    </table>




@endsection