@extends('layouts.admin')
@section('title', 'Page Title')
@section('content')
    <fieldset class="layui-elem-field layui-field-title" style:margin-top: 20px;>
        <legend align="center">个人中心详情</legend>
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
                <th>详情ID</th>
                <th>用户名称</th>
                <th>头像</th>
                <th>年龄</th>
                <th>性别</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="list">

                @if($data)
                    @foreach($data as $v)
                        <tr align="center" user_info_id={{$v->user_info_id}}>
                            <td>{{$v->u_id}}</td>
                            <td>{{$v->u_name}}</td>
                            <td><img src="http://{{$name}}/{{$v->u_head}}" width="100"></td>
                            <td>{{$v->u_age}}</td>
                            <td>{{$v->u_sex}}</td>
                            <td>{{$v->is_del}}</td>
                            <td>
                                <a class="del" href="javascript:;" id="{{$v->user_info_id}}">删除</a>&nbsp;
                                <a class="jin" href="javascript:;" id="{{$v->user_info_id}}">禁用</a>&nbsp;
                                <a class="qi" href="javascript:;" id="{{$v->user_info_id}}">启用</a>&nbsp;
                                <a class="cang" href="/admin/collect_list?id={{$v->user_info_id}}" >用户收藏</a>&nbsp;
                                <a class="sheng" href="/admin/lect/user_jiang?id={{$v->user_info_id}}" >提升讲师</a>&nbsp;
                                <a class="ding" href="/admin/geren?id={{$v->user_info_id}}" >个人订单详情</a>
                            </td>
                        </tr>
                    @endforeach
                @endif
            </tbody>
        </table>
    </div>

@endsection
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script>
    $(function(){
        //点击删除
        $(document).on('click','.del',function(){
            var _this=$(this);
            var user_info_id=_this.parents('tr').attr('user_info_id');
             //console.log(user_info_id);
            if(!user_info_id){
                alert('请选择一条记录');
            }
            //把商品id传给控制器
            $.ajax({
                url:"{{url('admin/destroy')}}",
                data:{user_info_id:user_info_id},
                dataType:'json',
                success:function(res){
                    alert(res.msg);
                    location.href="/admin/user_desc_list";
                },
            });
        });


        $(document).on('click','.jin',function(){
            var _this=$(this);
            var user_info_id=_this.parents('tr').attr('user_info_id');
            $.ajax({
                url:"{{url('admin/jin')}}",
                data:{user_info_id:user_info_id},
                dataType:'json',
                success:function(res){
                    alert(res.msg);
                    location.href="/admin/user_desc_list";
                },
            });
        });


        $(document).on('click','.qi',function(){
            var _this=$(this);
            var user_info_id=_this.parents('tr').attr('user_info_id');
            $.ajax({
                url:"{{url('admin/qi')}}",
                data:{user_info_id:user_info_id},
                dataType:'json',
                success:function(res){
                    alert(res.msg);
                    location.href="/admin/user_desc_list";
                },
            });
        });



        });
</script>