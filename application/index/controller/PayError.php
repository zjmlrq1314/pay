<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/6/16
 * Time: 17:37
 */

namespace app\index\controller;


use app\index\Controller;

class PayError extends Controller
{
    public function index()
    {
        $this->redirect(url('/index/index/index'));
    }
}