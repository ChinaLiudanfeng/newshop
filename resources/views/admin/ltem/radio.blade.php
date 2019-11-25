@extends('layouts.admin')
@section('title', 'Page Title')
@section('content')

    <form  action="/admin/ltem/bank_add" method="post">

            <span>单选题</span><br/>
        <input type="hidden" name="type_id" value="1">
            题目：<input type="text" name="problem" class="name" value=""><br/>
            A:<input type="radio"  name="single_answer" value="1">
            <input type="text" class="a" name="single_a" value=""><br/>
            B:<input type="radio" name="single_answer" value="2">
            <input type="text"  class="b" name="single_b" value=""><br/>
            C:<input type="radio" name="single_answer" value="3">
            <input type="text" class="c" name="single_c" value=""><br/>
            D:<input type="radio" name="single_answer" value="4">
            <input type="text" class="d" name="single_d" value=""><br/>
        <input type="submit" id="submit" name="sub" value="提交">
    </form>
    <script type="text/javascript">
        $(function () {

//            var s= $(".a").val();
//            alert(s);
            $("#submit").click(function(){
                var m1 = $(".a").val();
                var m2 = $(".b").val();
                var m3 = $(".c").val();
                var m4 = $(".d").val();
                var m6 = $(".name").val();
                var m5=$('input:radio[name="single_answer"]:checked').val();
//                alert(m5);
                if (m1== "") {
//                    alert(1);
                    alert("选项或者题目名不能为空");
                    return false;
                } else {
                   if (m2== "") {
//                       alert(2);
                       alert("选项或者题目名不能为空");
                       return false;
                    } else {
                       if (m3== "") {
//                           alert(3);

                           alert("选项或者题目名不能为空");
                           return false;
                       } else {
                           if (m4== "") {
//                               alert(4);

                               alert("选项或者题目名不能为空");
                               return false;
                           } else {
                               if (m5== undefined) {
//                                   alert(5);

                                   alert("选项或者题目名不能为空");
                                   return false;
                               } else {
                                   if (m6== "") {
//                                       alert(6);

                                       alert("选项或者题目名不能为空");
                                       return false;
                                   } else {
                                       $('form').submit();
                                   }
                               }
                           }
                       }
                   }
                }
            });

            });
    </script>
@endsection











