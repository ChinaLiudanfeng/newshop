@extends('layouts.admin')

@section('content')

    <script type="text/javascript" src="{{asset('/ueditor/ueditor.config.js')}}"></script>
    <script type="text/javascript" src="{{asset('/ueditor/ueditor.all.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('/ueditor/lang/zh-cn/zh-cn.js')}}"></script>

    <a href="{{ route('admin.Information_index.index') }}" class="layui-btn layui-btn-primary layui-btn-sm">返回</a>
    <hr>
    <form class="layui-form" action="" style="width: 900px;">
        <div class="layui-form-item" style="width: 400px;">
            <label class="layui-form-label">话题</label>
            <div class="layui-input-block">
                <input type="text" name="infor_title" required lay-verify="required" placeholder="请输入话题名称"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div>
            <label class="layui-form-label">内容</label>
            <div  class="layui-input-block">
                <textarea  name="infor_content" id="goods_intro" style="width: 600px;height: 50"></textarea>
            </div>

        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo" type="button">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
@endsection

@section('script')
    <script>
        layui.use('layedit', function(){
            var form = layui.form;
            var ue = UE.getEditor('goods_intro');
            // var title = $().html('title');
            // alert(title);

            form.on('submit(formDemo)', function (data) {
                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': '{{ csrf_token() }}'
                    }
                });
                var infor_title = $('input[name="infor_title"]').val();
                var infor_content  = $('textarea[name="infor_content"]').val();
                // alert(infor_content);return;
                $.ajax({
                    url:"/admin/information/create_do",
                    type:"POST",
                    data:{ infor_title : infor_title, infor_content : infor_content },
                    dataType:"json",
                    success:function (data) {
                        if (data.code === 0) {
                            layer.msg('操作成功', {
                                offset: '15px'
                                , icon: 1
                                , time: 1000
                            }, function () {
                                // alert(data);return;
                                location.href = '{{ route('admin.Information_index.index') }}';
                            });
                        } else {
                            layer.msg(data.msg, {
                                offset: '15px'
                                , icon: 2
                                , time: 2000
                            });
                        }
                    }
                })
            })

        })
    </script>
@endsection




