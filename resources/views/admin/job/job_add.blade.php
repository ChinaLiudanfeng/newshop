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
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>Document</title>
</head>
<body >
<h2><b>作业添加</b></h2>

<form action="{{url('admin/job_doadd')}}" method="post">
    @csrf
    <div class="form-group">
        <label for="exampleInputEmail1">作业名称</label>
        <input type="text" id="name" name="job_name" class="form-control" id="exampleInputEmail1" placeholder="请输入名称">
    </div>
    <h4>作业内容</h4>
    <textarea class="form-control" rows="3" name="job_content"  placeholder="请输入内容"></textarea>
    <input type="hidden" name="catelog_id" value="{{$data}}">
   <br/>
    <button class="btn btn-default"> Submit</button>

</form>
</body>
</html>
@endsection