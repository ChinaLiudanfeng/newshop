@extends('layouts.admin')
@section('title', 'Page Title')
@section('content')
        <!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="{{asset('css/bootstrap.min.css')}}">
    <script type="text/javascript" src="/public/js/jquery.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>Document</title>
</head>
<body >
<h2><b>添加活动</b></h2>
 <br>
  <br>
   <br>
<form action="{{url('admin/activity_doaddgoods')}}" method="post">
    @csrf



      <div class="layui-form layui-form-pane" >
        <div class="layui-form-item">
            <label class="layui-form-label">活动标题</label>
            <div class="layui-input-block">
                <input type="text" name="ag_title" id="ag_title" lay-verify="title" autocomplete="off" placeholder="请输入活动标题" class="layui-input">
            </div>
        </div>
        <div>   

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">活动内容</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容" name="ag_content" class="layui-textarea" id="act_content"></textarea>
            </div>
        </div>
   
    <h4></h4>
       <div class="layui-form-item">
    <label class="layui-form-label">选择课程</label>
    <div class="layui-input-block">
        @foreach($goodsInfo as $item)
     <input type="checkbox" value="{{$item['course_id']}}" name="course_id[]" title="{{$item['course_name']}}"> 
        @endforeach 
    </div>
  </div>



   <div class="form-group">
    <label for="exampleInputEmail1">活动价钱</label>
    <input type="number" class="form-control" name="act_price" id="exampleInputEmail1" placeholder="price">
  </div>


  <div class="form-group">
    <label for="exampleInputEmail1">活动开始时间</label>
    <input type="datetime-local" class="form-control" name="act_startTime">
  </div>

   <div class="form-group">
    <label for="exampleInputEmail1">活动结束时间</label>
    <input type="datetime-local" class="form-control"  name="act_endTime">
  </div>
   <br/>
    <button class="btn btn-default"> Submit</button>

</form>
</body>
</html>
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
    });
</script>
@endsection