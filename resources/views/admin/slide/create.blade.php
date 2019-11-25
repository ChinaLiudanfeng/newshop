@extends('layouts.admin')

@section('content')

    <a href="{{ url('admin/slide/index') }}" class="layui-btn layui-btn-primary layui-btn-sm">返回</a>
    <hr>
    <form class="layui-form" id="form" action="" style="width: 900px;" enctype="multipart/form-data">

        <div>
            <label class="layui-form-label">轮播图</label>
            <div  class="layui-input-block">
                <input class="layui-icon layui-btn" id="file"  type="file" name="slide_url" >
            </div>

        </div>
        <div class="layui-form-item" style="width: 400px;">
            <label class="layui-form-label">权重</label>
            <div class="layui-input-block">
                <input type="text" name="slide_weight" required lay-verify="required" placeholder="请输入权重"
                       autocomplete="off" class="layui-input">
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

            form.on('submit(formDemo)', function (data) {
                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': '{{ csrf_token() }}'
                    }
                });
                var fd = new FormData($("#form")[0]);
                // alert(form);return;
                $.ajax({
                    url:'/admin/slide/create_do',
                    type:"POST",
                    data:fd,
                    dataType:"json",
                    contentType:false,
                    processData:false,
                    success:function (data) {
                        if (data.code === 0) {
                            layer.msg('操作成功', {
                                offset: '15px'
                                , icon: 1
                                , time: 1000
                            }, function () {
                                // alert(data);return;
                                location.href = '{{ url('admin/slide/index') }}';
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




