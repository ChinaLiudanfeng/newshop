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
            Route::get('/user', 'UserController@index')->name('admin.user.index');
            Route::get('/user/create', 'UserController@create')->name('admin.user.create');
            Route::post('/user/store', 'UserController@store')->name('admin.user.store');
            Route::post('/user/status', 'UserController@status')->name('admin.user.status');
            Route::get('/user/edit', 'UserController@edit')->name('admin.user.edit');
            Route::post('/user/update', 'UserController@update')->name('admin.user.update');
            Route::post('/user/reset', 'UserController@reset')->name('admin.user.reset');

            Route::get('/permission', 'PermissionController@index')->name('admin.permission.index');
            Route::get('/permission/create', 'PermissionController@create')->name('admin.permission.create');
            Route::post('/permission/store', 'PermissionController@store')->name('admin.permission.store');
            Route::get('/permission/edit', 'PermissionController@edit')->name('admin.permission.edit');
            Route::post('/permission/update', 'PermissionController@update')->name('admin.permission.update');
            Route::post('/permission/delete', 'PermissionController@delete')->name('admin.permission.delete');

            Route::get('/roles', 'RolesController@index')->name('admin.roles.index');
            Route::get('/roles/create', 'RolesController@create')->name('admin.roles.create');
            Route::post('/roles/store', 'RolesController@store')->name('admin.roles.store');
            Route::get('/roles/edit', 'RolesController@edit')->name('admin.roles.edit');
            Route::post('/roles/update', 'RolesController@update')->name('admin.roles.update');
            Route::post('/roles/delete', 'RolesController@delete')->name('admin.roles.delete');

            Route::get('/menu', 'MenuController@index')->name('admin.menu.index');
            Route::get('/menu/create', 'MenuController@create')->name('admin.menu.create');
            Route::post('/menu/store', 'MenuController@store')->name('admin.menu.store');
            Route::get('/menu/edit', 'MenuController@edit')->name('admin.menu.edit');
            Route::post('/menu/update', 'MenuController@update')->name('admin.menu.update');
            Route::post('/menu/delete', 'MenuController@delete')->name('admin.menu.delete');

            Route::get('/test1', 'TestController@test1')->name('admin.test1.index');
            Route::get('/test2', 'TestController@test2')->name('admin.test2.index');
            Route::get('/test3', 'TestController@test3')->name('admin.test3.index');
            Route::get('/test4', 'TestController@test4')->name('admin.test4.index');
            Route::get('/test5', 'TestController@test5')->name('admin.test5.index');
            Route::get('/test6', 'TestController@test6')->name('admin.test6.index');

            Route::get('lect/create','LectController@create')->name('admin.lect.create.index');//讲师添加
            Route::any('lect/index','LectController@store')->name('admin.lect.index');//处理讲师添加
            Route::get('lect/list','LectController@index')->name('admin.lect.list.index');//讲师列表
            Route::any('lect/edit','LectController@edit')->name('admin.lect.edit.index');//讲师修改
            Route::any('lect/course','LectController@course')->name('admin.lect.course.index');//讲师修改
            Route::any('lect/update','LectController@update')->name('admin.lect.update.index');//讲师处理修改
            Route::get('lect/index_list','LectController@index_list')->name('admin.lect.index_list.index');//讲师列表
            Route::any('lect/destroy','LectController@destroy')->name('admin.lect.destroy.index');//讲师删除
            Route::any('lect/user_jiang','LectController@user_jiang')->name('admin.lect.user_jiang.index');//用户提升讲师

            Route::any('operationLog/index','OperationLogController@index')->name('admin.operationLog.index');//日志列表


            Route::get('catelog/index','CatelogController@index')->name('admin.catelog.index.index');  //文章添加
            Route::get('catelog/list','CatelogController@cate_list')->name('admin.catelog.list.index');  //文章列表
            Route::any('catelog/catelog_add','CatelogController@catelog_add')->name('admin.catelog.add.index');  //添加执行
            Route::any('catelog/catalog_list','CatelogController@catalog_list')->name('admin.catelog.catelog_list.index');//列表数据

            Route::any('catelog/catelog_del','CatelogController@catelog_del')->name('admin.catelog.del.index');//文章删除
            Route::any('catelog/catelog_upd','CatelogController@catelog_upd')->name('admin.catelog.catelog_upd.index');//文章修改
            Route::any('catelog/catelog_upd_do','CatelogController@catelog_upd_do')->name('admin.catelog.catelog_upd_do.index');//文章修改执行


            Route::prefix('/')->middleware(['apiheader'])->group(function(){
                Route::get('course_add','CourseController@course_add')->name('admin.course.course_add.index');//课程添加
                Route::post('course_add_do','CourseController@add_do')->name('admin.course.course_add_do.index');//课程执行添加
                Route::get('course_list','CourseController@course_list')->name('admin.course.list.index');//课程列表
                Route::any('course_del','CourseController@course_del')->name('admin.course.del.index');//课程删除
                Route::get('course_update','CourseController@course_update')->name('admin.course.update.index');//课程修改
                Route::post('course_update_do','CourseController@course_update_do')->name('admin.course.update_do.index');//课程执行修改

                Route::post('give_or_take','CourseController@give_or_take')->name('admin.course.give_or_take.index');//课程点击上下架
                Route::get('course_cate','CourseController@course_cate')->name('admin.course.cate.index');//分类添加
                Route::post('course_cate_do','CourseController@course_cate_do')->name('admin.course.cate_do.index');//分类执行添加
                Route::any('course_cate_list','CourseController@course_cate_list')->name('admin.course.cate_list.index');//分类列表
                Route::post('course_cate_del','CourseController@course_cate_del')->name('admin.course.cate_del.index');//分类禁用
                Route::get('course_cate_update','CourseController@course_cate_update')->name('admin.course.cate_update.index');//分类修改
                Route::post('course_cate_update_do','CourseController@course_cate_update_do')->name('admin.course.cate_update_do.index');//分类执行修改
                 //问答模块
                Route::any('question_add','QuestionController@question_add')->name('admin.question_add.index');//问答添加
                Route::any('question_doadd','QuestionController@question_doadd')->name('admin.question_doadd.index');//处理问题添加
                Route::any('question_nameOnly','QuestionController@question_nameOnly')->name('admin.question_nameOnly.index');//处理问题添加
                Route::any('question_list','QuestionController@question_list')->name('admin.question_list.index');//问答展示列表
                Route::get('resposen_add','QuestionController@resposen_add')->name('admin.resposen_add.index');//提交回答入库
                Route::get('questions_del','QuestionController@questions_del')->name('admin.questions_del.index');//删除问题
                //评论模块
                Route::get('exalute_add','ExaluateController@exalute_add')->name('admin.exalute_add.index');//评论添加视图展示
                Route::post('exaluate_doadd','ExaluateController@exaluate_doadd')->name('admin.exaluate_doadd.index');//处理添加视图展示
                Route::any('exalute_index','ExaluateController@exalute_index')->name('admin.exalute_index.index');//评论添加视图展示
                Route::get('exalute_del','ExaluateController@exalute_del')->name('admin.exalute_del.index');//评论软删除
               //收藏
                Route::get('collect_add','CollectController@collect_add')->name('admin.collect.collect_add.index');//收藏添加
                Route::get('collect_list','CollectController@collect_list')->name('admin.collect.collect_list.index');//收藏添加
                Route::any('collect_destroy','CollectController@destroy')->name('admin.collect.destroy.index');//收藏删除

                Route::any('user_desc','UserinfoController@user_desc')->name('admin.user_desc.index');//用户详情
                Route::any('user_desc_add','UserinfoController@user_desc_add')->name('admin.user_desc_add.index');//用户详情添加
                Route::any('user_desc_list','UserinfoController@user_desc_list')->name('admin.user_desc_list.index');//用户详情列表
                Route::any('edit/{user_desc_id}','UserinfoController@edit')->name('admin.edit.index');//用户详情删除
                Route::any('destroy','UserinfoController@destroy')->name('admmin.destroy.index');//用户详情删除
                Route::any('jin','UserinfoController@jin')->name('admin.jin.index'); //会员禁用
                Route::any('qi','UserinfoController@qi')->name('admin.qi.index'); //恢复正常
                Route::any('geren','OrderController@geren')->name('admin.geren.index');//个人订单
               // Route::any('geren_del','OrderController@geren_del')->name('admin.geren_del.index');//个人订单删除
                //资讯模块
                Route::get('/information/index', 'InformationController@index')->name('admin.Information_index.index');
                Route::get('/information/create', 'InformationController@create')->name('admin.Information_create.create');
                Route::any('/information/create_do', 'InformationController@create_do')->name('admin.Information_create_do');
                Route::post('/information/upload/picture', 'InformationController@editorUploadPicture');
                Route::any('/information/delete','InformationController@delete')->name('admin.Information_delete.delete');
                Route::get('/information/edit', 'InformationController@edit')->name('admin.Information_edit.edit');
                Route::post('/information/update', 'InformationController@update')->name('admin.Information_update');
                //作业
                Route::get('job_add','JobController@job_add')->name('admin.job_add.index');//作业添加
                Route::post('job_doadd','JobController@job_doadd')->name('admin.job_doadd.index');//处理作业添加
                Route::any('job_index','JobController@job_index')->name('admin.job_index.index');//作业添加
                Route::get('job_del','JobController@job_del')->name('admin.job_del.index');//作业软删除
                //题库
                Route::any('ltem/index_add','LtemController@index_add')->name('admin.ltem.index_add.index');
                Route::any('ltem/bank_add','LtemController@bank_add')->name('admin.ltem.bank_add.index');
                Route::any('ltem/warm_add','LtemController@warm_add')->name('admin.ltem.warm_add.index');
                Route::any('ltem/lt_radio','LtemController@lt_radio')->name('admin.ltem.lt_radio.index');
                Route::any('ltem/lt_warm','LtemController@lt_warm')->name('admin.ltem.lt_warm.index');
                Route::any('ltem/lt_danger','LtemController@lt_danger')->name('admin.ltem.lt_danger.index');
                Route::any('ltem/danger_add','LtemController@danger_add')->name('admin.ltem.danger_add.index');
                Route::any('ltem/ltem_list','LtemController@ltem_list')->name('admin.ltem.ltem_list.index');
                Route::any('ltem/lt_del','LtemController@lt_del')->name('admin.ltem.lt_del.index');
                Route::any('ltem/lt_upd','LtemController@lt_upd')->name('admin.ltem.lt_upd.index');
                Route::any('ltem/lt_upd_do','LtemController@lt_upd_do')->name('admin.ltem.lt_upd_do.index');
                Route::any('ltem/lt_upd_warm_do','LtemController@lt_upd_warm_do')->name('admin.ltem.lt_upd_warm_do.index');
                Route::any('ltem/lt_upd_danger','LtemController@lt_upd_danger')->name('admin.ltem.lt_upd_danger.index');
                //后台导航栏
                Route::prefix('/navigation')->group(function(){
                    Route::any('add','NavigationController@navigationAdd')->name('admin.navigation.add.index');//后台导航添加视图
                    Route::any('data','NavigationController@navigationData')->name('admin.navigation.data.index');//后台导航添加执行
                    Route::any('list','NavigationController@navigationList')->name('admin.navigation.list.index');//后台导航列表
                    Route::any('exit','NavigationController@navigationExit')->name('admin.navigation.exit.index');//后台导航修改视图
                    Route::any('exitdo','NavigationController@navigationExitdo')->name('admin.navigation.exitdo.index');//后台导航修改执行
                    Route::any('del','NavigationController@navigationDel')->name('admin.navigation.del.index');//后台导航删除
                });




                //订单
                Route::prefix('/')->group(function(){
                    Route::any('blanket_order','OrderController@blanket_order')->name('admin.order.blanket_order.index');//总订单列表
                    Route::any('blanket_del','OrderController@blanket_del')->name('admin.order.blanket_del.index');//总订单删除
                    Route::any('lect_order','OrderController@lect_order')->name('admin.order.lect_order.index');//讲师订单列表
                    Route::any('lect_order_del','OrderController@lect_order_del')->name('admin.order.lect_order_del.index');//讲师订单删除
                    Route::any('lect_order_user_list','OrderController@lect_order_user_list')->name('admin.order.lect_order_user_list.index');//讲师订单删除
                });
                // 笔记模块
                Route::prefix('/')->group(function(){
                    Route::any('note/note_add',function(){
                        return view('admin.note.add');// 笔记添加
                    })->name('admin.note.note_add.index');
                    Route::any('note/note_add_do','NoteController@note_add_do')->name('admin.note.note_add_do.index');// 笔记添加
                    Route::any('note/note_list','NoteController@note_list')->name('admin.note.note_list.index');// 笔记列表
                    Route::any('note/note_del','NoteController@note_del')->name('admin.vip.vipupd.index');// 笔记列表
                    Route::any('note/note_update','NoteController@note_update')->name('admin.note.note_update.index');// 笔记修改
                    Route::any('note/note_update_do','NoteController@note_update_do')->name('admin.note.note_update_do.index');// 笔记修改
                });
                //试卷
                Route::any('paper/index_add','PaperController@index_add')->name('admin.paper.index_add.index');
                Route::any('paper/add_do','PaperController@add_do')->name('admin.paper.add_do.index');
                Route::any('paper/pa_list','PaperController@pa_list')->name('admin.paper.pa_list.index');
                Route::any('paper/list_de','PaperController@list_de')->name('admin.paper.list_de.index');
                Route::any('paper/pa_del','PaperController@pa_del')->name('admin.paper.pa_del.index');













                Route::get('slide/create','SlideController@create')->name('admin.slide.create');
                Route::any('slide/create_do','SlideController@create_do')->name('admin.slide.create_do');
                Route::get('slide/index','SlideController@index')->name('admin.slide.index');
                Route::get('slide/edit','SlideController@edit')->name('admin.slide.edit');
                Route::any('slide/update','SlideController@update')->name('admin.slide.update');
                Route::any('slide/delete','SlideController@delete')->name('admin.slide.delete');
                Route::any('slide/sale','SlideController@sale')->name('admin.slide.sale');


                //活动
                Route::any('activity_addgoods','ActivityController@activity_addgoods')->name('admin.activity_addgoods.index');//添加活动商品
                Route::post('activity_doaddgoods','ActivityController@activity_doaddgoods')->name('admin.activity_doaddgoods.index');//处理添加活动商品
                Route::any('activity_courseList','ActivityController@activity_courseList')->name('admin.activity_courseList.index');//活动课程详情页面
                Route::any('activity_delOnly','ActivityController@activity_delOnly')->name('admin.activity_delOnly.index');//活动课程详情页面
                Route::any('activity_delmax','ActivityController@activity_delmax')->name('admin.activity_delmax.index');//活动课程详情页面
            });

        });
    });
});






