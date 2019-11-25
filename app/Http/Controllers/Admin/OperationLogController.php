<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Models\OperationLog;
class OperationLogController extends Controller
{
    public function index()
    {
        $data = OperationLog::get()->toArray();
        return view('admin.operation.index',['data'=>$data]);
    }


}