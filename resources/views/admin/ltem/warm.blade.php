@extends('layouts.admin')
@section('title', 'Page Title')
@section('content')

    <form  action="/admin/ltem/warm_add" method="post">
        <input type="hidden" name="type_id" value="3">
        <span>判断</span>
        <br/>
        题目：<input type="text" class="name" name="judge" value=""><br/>
        对:<input type="radio"  name="judge_answer" value="1">

        错:<input type="radio"   name="judge_answer" value="2">
        <input type="submit"   id="submit" name="sub" value="提交">
    </form>
    <script type="text/javascript">
        $(function () {

//            var s= $(".a").val();
//            alert(s);
            $("#submit").click(function(){
                var m1 = $(".name").val();
                var m2=$('input:radio[name="judge_answer"]:checked').val();
//                alert(m5);
                if (m1== "") {
//                    alert(1);
                    alert("选项或者题目名不能为空");
                    return false;
                } else {
                    if (m2== undefined) {
//                       alert(2);
                        alert("选项或者题目名不能为空");
                        return false;
                    } else {
                        $('form').submit();
                    }
                }
            });

        });
    </script>
@endsection











