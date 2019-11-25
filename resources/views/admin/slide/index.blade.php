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
<link rel="stylesheet" type="text/css" href="{{asset('css/page.css')}}">
@section('content')
    <a href="{{ url('admin/slide/create') }}" class="layui-btn">添加轮播图</a>
    <table class="layui-table">
        <colgroup>
            <col width="80">
            <col width="200">
            <col>
            <col width="150">
            <col width="150">
        </colgroup>
        <thead>
        <tr>
            <th>ID</th>
            <th>权重</th>
            <th>图片</th>
            <th>是否启用</th>
            <th>创建时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        @foreach($slide as $s)
            <tr align="center">
                <td>{{ $s['slide_id'] }}</td>
                <td>{{ $s['slide_weight'] }}</td>
                <td><img src="/{{$s['slide_url']}}" width="100" height="100"></td>
                <td class="sale" slise_id="{{$s['slide_id']}}">
                    @if (($s['slide_status'])== 1)
                        <span style="color:blue">启用</span>
                    @else
                        <span style="color:red">禁用</span>
                    @endif
                </td>
                <td>{{ date('Y-m-d H',$s['slide_time']) }}</td>
                <td style="text-align: center;">
                    <a href="{{ url('admin/slide/edit') }}?slide_id={{ $s['slide_id'] }}"
                       class="layui-btn layui-btn-xs">修改权重</a>
                    <button class="layui-btn layui-btn-danger layui-btn-xs" type="button"
                            onclick="del({{ $s['slide_id'] }})">删除
                    </button>
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
    <center>{{$slide->links()}}</center>
@endsection


@section('script')
    <script>
        layui.use(['layer'], function () {
            var layer = layui.layer;
        });

        function del(slide_id) {
            layer.confirm('你确定要删除这个轮播图吗？', {
                title: '删除确认',
                btn: ['确定', '取消'] //按钮
            }, function () {
                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': '{{ csrf_token() }}'
                    }
                });
                $.post("{{ url('admin/slide/delete') }}", {slide_id: slide_id},
                    function (data) {
                        if (data.code === 0) {
                            layer.msg('操作成功', {
                                offset: '15px'
                                , icon: 1
                                , time: 1000
                            }, function () {
                                location.href = '{{ url('admin/slide/index') }}';
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

        $(document).on('click','.sale',function(){
            var s_this=$(this);
            var sale=s_this.text();
            // alert(sale);return;
            // console.log(sale);
            if(sale == "启用"){
                sale == "1";
            }else{
                sale == "2";
            }
            var slide_id=s_this.attr("slise_id");
            // console.log(slide_id);
            // alert(slide_id);return;
            $.post(
                "/admin/slide/sale",
                {slide_id:slide_id,sale:sale},
                function(data){
                    if(data.info == 3){
                        history.go(0)
                    }
                },
                'json'
            );

        });
    </script>
@endsection