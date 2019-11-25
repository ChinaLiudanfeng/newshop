@extends('layouts.admin')

@section('content')
    @parent

    <fieldset class="layui-elem-field layui-field-title" style:margin-top: 20px;>
        <legend align="center">个人订单详情</legend>
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
                <th>讲师ID</th>
                <th>课程ID</th>
                <th>订单编号</th>
                <th>订单价格</th>
                <th>订单时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="list">

                @foreach($date as $v)
                    <tr align="center" order_id={{$v->order_id}}>
                        <td>{{$v->lect_id}}</td>
                        <td>{{$v->course_id}}</td>
                        <td>{{$v->order_mark}}</td>
                        <td>{{$v->pay_price}}</td>
                        <td>{{$v->d_create_time}}</td>
                        <td class="del">
                            <a href="javascript:;" id="{{$v->order_id}}">删除</a>
                        </td>
                    </tr>
                @endforeach

            </tbody>
        </table>
    </div>
{{--    <script>--}}
{{--        $(function(){--}}
{{--            //点击删除--}}
{{--            $(document).on('click','.del',function(){--}}
{{--                var _this=$(this);--}}
{{--                var order_id=_this.parents('tr').attr('order_id');--}}
{{--                if(!order_id){--}}
{{--                    alert('请选择一条记录');--}}
{{--                }--}}
{{--                //把商品id传给控制器--}}
{{--                $.ajax({--}}
{{--                    url:"/admin/geren_del",--}}
{{--                    data:{order_id:order_id},--}}
{{--                    type:"POST",--}}
{{--                    dataType:"json",--}}
{{--                    success:function(res){--}}
{{--                        if(res.code==1){--}}
{{--                            alert(res.msg);--}}
{{--                            location.href="/admin/geren";--}}
{{--                        }else{--}}
{{--                            alert(res.msg);--}}
{{--                            location.href="/admin/geren";--}}
{{--                        }--}}

{{--                    }--}}
{{--                })--}}
{{--            })--}}
{{--        });--}}
{{--    </script>--}}

@endsection

