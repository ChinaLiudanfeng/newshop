@extends('layouts.admin')
@section('title', 'Page Title')
@section('content')

    <form  action="/admin/ltem/danger_add" method="post">
        <input type="hidden" name="type_id" value="2">
        <span>多选</span><br/>
        题目：<input type="text" class="problem" name="problem" value=""><br/>
        A:<input type="checkbox"   name="single_answer[]" value="1">
        <input type="text"  class="a" name="single_a"><br/>
        B:<input type="checkbox"   name="single_answer[]" value="2">
        <input type="text"  class="b" name="single_b"><br/>
        C:<input type="checkbox"  class="c" name="single_answer[]" value="3">
        <input type="text"  class="c" name="single_c"><br/>
        D:<input type="checkbox"   name="single_answer[]" value="4">
        <input type="text" class="d" name="single_d"><br/>
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
                var m6 = $(".problem").val();
                var m5=$('input:checkbox[name="single_answer[]"]:checked').val();
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











