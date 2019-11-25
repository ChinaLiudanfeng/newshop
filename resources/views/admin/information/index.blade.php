@extends('layouts.admin')

@section('style')
    <style>
        #page li {
            display: inline-block;
        }

        #page .active span {
            background-color: #009688;
            color: #fff;
            border: 0px;
            height: 30px;
            border-radius: 2px;
        }

        #page .disabled span {
            color: #ccc;
        }
    </style>
@endsection

@section('content')
    <a href="{{ url('admin/information/create') }}" class="layui-btn">添加资讯</a>
    <table class="layui-table">
        <colgroup>
            <col width="50">
            <col width="130">
            <col>
            <col width="110">
            <col width="115">
        </colgroup>
        <thead>
        <tr>
            <th>ID</th>
            <th>话题</th>
            <th>内容</th>
            <th>创建时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
            @foreach($infor_arr as $infor)
            <tr>
                <td>{{ $infor['infor_id'] }}</td>
                <td>{{ $infor['title'] }}</td>
                <td><?= html_entity_decode($infor['infor_content'],ENT_QUOTES)?></td>
                <td>{{ date('Y-m-d H',$infor['infor_time']) }}</td>
                <td style="text-align: center;">
                    <a href="{{ url('admin/information/edit') }}?infor_id={{ $infor['infor_id'] }}"
                       class="layui-btn layui-btn-xs">编辑</a>
                    <button class="layui-btn layui-btn-danger layui-btn-xs" type="button"
                            onclick="del({{ $infor['infor_id'] }})">删除
                    </button>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>

@endsection

@section('script')
    <script>
        layui.use(['layer'], function () {
            var layer = layui.layer;
        });

        function del(infor_id) {
            layer.confirm('你确定要删除这个资讯吗？', {
                title: '删除确认',
                btn: ['确定', '取消'] //按钮
            }, function () {
                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': '{{ csrf_token() }}'
                        }
                    });
                    $.post("{{ url('admin/information/delete') }}", {infor_id: infor_id},
                        function (data) {
                            if (data.code === 0) {
                                layer.msg('操作成功', {
                                    offset: '15px'
                                    , icon: 1
                                    , time: 1000
                                }, function () {
                                    location.href = '{{ url('admin/information/index') }}';
                                });
                            } else {
                                layer.msg(data.msg, {
                                    offset: '15px'
                                    , icon: 2
                                    , time: 2000
                                });
                            }
                        });
                })
        }
    </script>
@endsection