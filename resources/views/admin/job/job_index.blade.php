@extends('layouts.admin')
@section('title', 'Page Title')
@section('content')
    <table class="layui-table">
        <colgroup>
            <col width="150">
            <col width="200">
            <col>
            <col>
            <col>
        </colgroup>

        <thead>
        <tr>
            <th>ID</th>
            <th>课程ID</th>
            <th>章节ID</th>
            <th>作业名称</th>
            <th>作业内容</th>
            <th>时间</th>
            <th>操作</th>
        </tr>
        </thead>


        <tbody>
        @foreach($info as $item)
            <tr>
                <td>{{$item['job_id']}}</td>
                <td>{{$item['course_id']}}</td>
            <td>{{$item['catelog_id']}}</td>
            <td>{{$item['job_name']}}</td>
            <td>{{$item['job_content']}}</td>
            <td>{{date('Y-m-d H:i:s',$item['create_time'])}}</td>
            <td>
                <button type="button" e_id="{{$item['job_id']}}" class="layui-btn del layui-btn-warm">删除</button>
            </td>
            </tr>
        @endforeach
        </tbody>
    </table>

    <script>

        layui.use(['form', 'layedit', 'laydate'], function(){
            var layer=layui.layer;//layui 弹框
        });
    </script>
    <script>
            //删除问题
            $(document).on('click','.del',function(){
                var id=$(this).attr('e_id');
                console.log(id);
                $.ajax({
                    url:"{{url('admin/job_del')}}",
                    data:{id:id},
                    dataType:'json',
                    success:function(e){
                        layer.msg(e.content,{icon:e.icon,time:2000});
                        window.location.reload();
                    },
                });
            });

    </script>
@endsection