<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::namespace('Admin')->prefix('admin')->group(function () {
    Route::get('login', 'LoginController@index')->name('admin.login.white');
    Route::post('login', 'LoginController@login')->name('admin.login.post.white');
    Route::post('logout', 'LoginController@logout')->name('admin.logout.white');

    Route::middleware(['login', 'menu'])->group(function () {
        Route::get('index', 'AdminController@index')->name('admin.index.white');
        Route::get('modify_pwd', 'AdminController@modifyPwd')->name('admin.modify_pwd.white');
        Route::post('new_pwd', 'AdminController@newPwd')->name('admin.new_pwd.white');
        Route::get('forbidden', function () {
            return view('admin.403');
        })->name('admin.forbidden.white');

        Route::middleware('auth.can')->group(function () {
            Route::get('/user', 'UserController@index')->name('管理员列表展示');
            Route::get('/user/create', 'UserController@create')->name('管理员用户添加');
            Route::post('/user/store', 'UserController@store')->name('管理员执行添加');
            Route::post('/user/status', 'UserController@status')->name('是否管理员状态');
            Route::get('/user/edit', 'UserController@edit')->name('管理员修改');
            Route::post('/user/update', 'UserController@update')->name('管理员执行修改');
            Route::post('/user/reset', 'UserController@reset')->name('修改管理员密码');

            Route::get('/permission', 'PermissionController@index')->name('权限列表展示');
            Route::get('/permission/create', 'PermissionController@create')->name('添加权限');
            Route::post('/permission/store', 'PermissionController@store')->name('处理权限添加');
            Route::get('/permission/edit', 'PermissionController@edit')->name('修改权限');
            Route::post('/permission/update', 'PermissionController@update')->name('执行修改权限');
            Route::post('/permission/delete', 'PermissionController@delete')->name('权限删除');

            Route::get('/roles', 'RolesController@index')->name('角色列表展示');
            Route::get('/roles/create', 'RolesController@create')->name('角色添加');
            Route::post('/roles/store', 'RolesController@store')->name('角色处理添加');
            Route::get('/roles/edit', 'RolesController@edit')->name('角色修改');
            Route::post('/roles/update', 'RolesController@update')->name('执行角色修改');
            Route::post('/roles/delete', 'RolesController@delete')->name('角色删除');

            Route::get('/menu', 'MenuController@index')->name('菜单列表展示');
            Route::get('/menu/create', 'MenuController@create')->name('菜单添加');
            Route::post('/menu/store', 'MenuController@store')->name('菜单执行添加');
            Route::get('/menu/edit', 'MenuController@edit')->name('菜单修改');
            Route::post('/menu/update', 'MenuController@update')->name('菜单执行修改');
            Route::post('/menu/delete', 'MenuController@delete')->name('菜单删除');
            //讲师
            Route::get('lect/create','LectController@create')->name('讲师添加');//讲师添加
            Route::any('lect/index','LectController@store')->name('处理讲师添加');//处理讲师添加
            Route::get('lect/list','LectController@index')->name('讲师列表展示');//讲师列表
            Route::any('lect/edit','LectController@edit')->name('讲师修改');//讲师修改
            Route::any('lect/course','LectController@course')->name('讲师所有课程');//讲师修改
            Route::any('lect/update','LectController@update')->name('讲师处理修改');//讲师处理修改
            Route::get('lect/index_list','LectController@index_list')->name('讲师列表');//讲师列表
            Route::any('lect/destroy','LectController@destroy')->name('讲师删除');//讲师删除
            Route::any('lect/user_jiang','LectController@user_jiang')->name('用户提升讲师');//用户提升讲师

            Route::any('operationLog/index','OperationLogController@index')->name('日志列表');//日志列表


            Route::get('catelog/index','CatelogController@index')->name('文章添加');  //文章添加
            Route::get('catelog/list','CatelogController@cate_list')->name('文章列表展示');  //文章列表
            Route::any('catelog/catelog_add','CatelogController@catelog_add')->name('文章添加执行');  //添加执行
            Route::any('catelog/catalog_list','CatelogController@catalog_list')->name('列表数据');//列表数据

            Route::any('catelog/catelog_del','CatelogController@catelog_del')->name('文章删除');//文章删除
            Route::any('catelog/catelog_upd','CatelogController@catelog_upd')->name('文章修改');//文章修改
            Route::any('catelog/catelog_upd_do','CatelogController@catelog_upd_do')->name('文章修改执行');//文章修改执行


            Route::prefix('/')->middleware(['apiheader'])->group(function(){
                Route::get('course_add','CourseController@course_add')->name('课程添加');//课程添加
                Route::post('course_add_do','CourseController@add_do')->name('课程执行添加');//课程执行添加
                Route::get('course_list','CourseController@course_list')->name('课程列表展示');//课程列表
                Route::any('course_del','CourseController@course_del')->name('课程删除');//课程删除
                Route::get('course_update','CourseController@course_update')->name('课程修改');//课程修改
                Route::post('course_update_do','CourseController@course_update_do')->name('课程执行修改');//课程执行修改

                Route::post('give_or_take','CourseController@give_or_take')->name('课程点击上下架');//课程点击上下架
                Route::get('course_cate','CourseController@course_cate')->name('分类添加');//分类添加
                Route::post('course_cate_do','CourseController@course_cate_do')->name('分类执行添加');//分类执行添加
                Route::any('course_cate_list','CourseController@course_cate_list')->name('分类列表展示');//分类列表
                Route::post('course_cate_del','CourseController@course_cate_del')->name('分类禁用');//分类禁用
                Route::get('course_cate_update','CourseController@course_cate_update')->name('分类修改');//分类修改
                Route::post('course_cate_update_do','CourseController@course_cate_update_do')->name('分类执行修改');//分类执行修改
                 //问答模块
                Route::any('question_add','QuestionController@question_add')->name('问答添加');//问答添加
                Route::any('question_doadd','QuestionController@question_doadd')->name('处理问题添加');//处理问题添加
                Route::any('question_nameOnly','QuestionController@question_nameOnly')->name('检验问答问题');//处理问题添加
                Route::any('question_list','QuestionController@question_list')->name('问答列表展示');//问答展示列表
                Route::get('resposen_add','QuestionController@resposen_add')->name('提交回答入库');//提交回答入库
                Route::get('questions_del','QuestionController@questions_del')->name('删除问题');//删除问题
                //评论模块
                Route::get('exalute_add','ExaluateController@exalute_add')->name('评论添加');//评论添加视图展示
                Route::post('exaluate_doadd','ExaluateController@exaluate_doadd')->name('评论处理添加');//处理添加视图展示
                Route::any('exalute_index','ExaluateController@exalute_index')->name('评论列表展示');//评论添加视图展示
                Route::get('exalute_del','ExaluateController@exalute_del')->name('评论软删除');//评论软删除
               //收藏
                Route::get('collect_add','CollectController@collect_add')->name('收藏添加');//收藏添加
                Route::get('collect_list','CollectController@collect_list')->name('收藏列表展示');//收藏添加
                Route::any('collect_destroy','CollectController@destroy')->name('收藏删除');//收藏删除

                Route::any('user_desc','UserinfoController@user_desc')->name('用户详情');//用户详情
                Route::any('user_desc_add','UserinfoController@user_desc_add')->name('用户详情处理添加');//用户详情添加
                Route::any('user_desc_list','UserinfoController@user_desc_list')->name('用户详情列表展示');//用户详情列表
                Route::any('edit/{user_desc_id}','UserinfoController@edit')->name('用户详情修改');//用户详情删除
                Route::any('destroy','UserinfoController@destroy')->name('用户详情删除');//用户详情删除
                Route::any('jin','UserinfoController@jin')->name('会员禁用'); //会员禁用
                Route::any('qi','UserinfoController@qi')->name('会员恢复正常'); //恢复正常
                Route::any('geren','OrderController@geren')->name('个人订单');//个人订单
               // Route::any('geren_del','OrderController@geren_del')->name('admin.geren_del.index');//个人订单删除
                //资讯模块
                Route::get('/information/index', 'InformationController@index')->name('资讯列表展示');
                Route::get('/information/create', 'InformationController@create')->name('资讯添加');
                Route::any('/information/create_do', 'InformationController@create_do')->name('咨询处理添加');
                Route::post('/information/upload/picture', 'InformationController@editorUploadPicture');
                Route::any('/information/delete','InformationController@delete')->name('咨询删除');
                Route::get('/information/edit', 'InformationController@edit')->name('咨询修改');
                Route::post('/information/update', 'InformationController@update')->name('咨询执行修改');
                //作业
                Route::get('job_add','JobController@job_add')->name('作业添加');//作业添加
                Route::post('job_doadd','JobController@job_doadd')->name('作业处理添加');//处理作业添加
                Route::any('job_index','JobController@job_index')->name('作业列表展示');//作业添加
                Route::get('job_del','JobController@job_del')->name('作业软删除');//作业软删除
                //题库
                Route::any('ltem/index_add','LtemController@index_add')->name('添加题库');
                Route::any('ltem/bank_add','LtemController@bank_add')->name('处理题库添加');
                Route::any('ltem/warm_add','LtemController@warm_add')->name('处理题库添加2');
                Route::any('ltem/lt_radio','LtemController@lt_radio')->name('添加单选题');
                Route::any('ltem/lt_warm','LtemController@lt_warm')->name('添加判断题');
                Route::any('ltem/lt_danger','LtemController@lt_danger')->name('添加多选题');
                Route::any('ltem/danger_add','LtemController@danger_add')->name('处理题库添加3');
                Route::any('ltem/ltem_list','LtemController@ltem_list')->name('题库列表展示');
                Route::any('ltem/lt_del','LtemController@lt_del')->name('题库删除');
                Route::any('ltem/lt_upd','LtemController@lt_upd')->name('题库修改');
                Route::any('ltem/lt_upd_do','LtemController@lt_upd_do')->name('题库处理修改');
                Route::any('ltem/lt_upd_warm_do','LtemController@lt_upd_warm_do')->name('处理题库修改');
                Route::any('ltem/lt_upd_danger','LtemController@lt_upd_danger')->name('处理题库修改2');
                //后台导航栏
                Route::prefix('/navigation')->group(function(){
                    Route::any('add','NavigationController@navigationAdd')->name('导航添加');//后台导航添加视图
                    Route::any('data','NavigationController@navigationData')->name('导航添加执行');//后台导航添加执行
                    Route::any('list','NavigationController@navigationList')->name('导航列表展示');//后台导航列表
                    Route::any('exit','NavigationController@navigationExit')->name('导航修改');//后台导航修改视图
                    Route::any('exitdo','NavigationController@navigationExitdo')->name('导航修改执行');//后台导航修改执行
                    Route::any('del','NavigationController@navigationDel')->name('导航删除');//后台导航删除
                });




                //订单
                Route::prefix('/')->group(function(){
                    Route::any('blanket_order','OrderController@blanket_order')->name('总订单列表展示');//总订单列表
                    Route::any('blanket_del','OrderController@blanket_del')->name('总订单删除');//总订单删除
                    Route::any('lect_order','OrderController@lect_order')->name('讲师订单列表');//讲师订单列表
                    Route::any('lect_order_del','OrderController@lect_order_del')->name('讲师订单删除');//讲师订单删除
                    Route::any('lect_order_user_list','OrderController@lect_order_user_list')->name('讲师订单列表展示');//讲师订单列表展示
                });
                // 笔记模块
                Route::prefix('/')->group(function(){
                    Route::any('note/note_add',function(){
                        return view('admin.note.add');// 笔记添加
                    })->name('笔记添加');
                    Route::any('note/note_add_do','NoteController@note_add_do')->name('笔记处理添加');// 笔记添加
                    Route::any('note/note_list','NoteController@note_list')->name('笔记列表展示');// 笔记列表
                    Route::any('note/note_del','NoteController@note_del')->name('笔记删除');// 笔记删除
                    Route::any('note/note_update','NoteController@note_update')->name('笔记修改');// 笔记修改
                    Route::any('note/note_update_do','NoteController@note_update_do')->name('笔记处理修改');// 笔记处理修改
                });
                //试卷
                Route::any('paper/index_add','PaperController@index_add')->name('试卷添加');
                Route::any('paper/add_do','PaperController@add_do')->name('试卷处理添加');
                Route::any('paper/pa_list','PaperController@pa_list')->name('试卷列表展示');
                Route::any('paper/list_de','PaperController@list_de')->name('试卷详细');
                Route::any('paper/pa_del','PaperController@pa_del')->name('试卷删除');
                });

                Route::get('slide/create','SlideController@create')->name('轮播图添加');
                Route::any('slide/create_do','SlideController@create_do')->name('轮播图处理添加');
                Route::get('slide/index','SlideController@index')->name('轮播图列表展示');
                Route::get('slide/edit','SlideController@edit')->name('轮播图修改');
                Route::any('slide/update','SlideController@update')->name('轮播图处理修改');
                Route::any('slide/delete','SlideController@delete')->name('轮播图删除');
                Route::any('slide/sale','SlideController@sale')->name('轮播图即点击改');


                //活动
                Route::any('activity_addgoods','ActivityController@activity_addgoods')->name('添加活动商品');//添加活动商品
                Route::post('activity_doaddgoods','ActivityController@activity_doaddgoods')->name('活动处理添加商品');//处理添加活动商品
                Route::any('activity_courseList','ActivityController@activity_courseList')->name('活动列表展示');//活动课程详情页面
                Route::any('activity_delOnly','ActivityController@activity_delOnly')->name('活动课程修改');//活动课程详情页面
                Route::any('activity_delmax','ActivityController@activity_delmax')->name('活动课程修改2');//活动课程详情页面


        });
    });
});






