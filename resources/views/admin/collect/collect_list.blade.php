@extends('layouts.admin')

@section('content')
    @parent

    <fieldset class="layui-elem-field layui-field-title" style:margin-top: 20px;>
        <legend align="center">收藏列表</legend>
    </fieldset>

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
                <th>ID</th>
                <th>课程名称</th>
                <th>用户名</th>
                <th>收藏夹</th>
                <th>收藏时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="list">

            @if($data)
                @foreach($data as $v)
                    <tr align="center" collect_id={{$v->collect_id}}>
                        <td>{{$v->collect_id}}</td>
                        <td>{{$v->course_name}}</td>
                        <td>{{$v->u_email}}</td>
                        <td>{{$v->f_id}}</td>
                        <td>{{date('Y-m-d',$v->create_time)}}</td>
                        <td class="del">
                            <a href="javascript:;" id="{{$v->collect_id}}">删除</a>
                        </td>
                    </tr>
                @endforeach
            @endif
            </tbody>
        </table>
    </div>
    <script>
        $(function(){
            //点击删除
            $(document).on('click','.del',function(){
                var _this=$(this);
                var collect_id=_this.parents('tr').attr('collect_id');
                if(!collect_id){
                    alert('请选择一条记录');
                }
                //把商品id传给控制器
                $.ajax({
                    url:"/admin/collect_destroy",
                    data:{collect_id:collect_id},
                    type:"POST",
                    dataType:"json",
                    success:function(res){
                        if(res.code==1){
                            alert(res.msg);
                            location.href="/admin/collect_list";
                        }else{
                            alert(res.msg);
                            location.href="/admin/colllect_list";
                        }
                        // alert(res.msg);
                        // location.href="http://www.education.com/admin/course_cate_list";
                    }
                })
            })
        });
    </script>

@endsection

