<?php
/**
 * 支付前端
 * User: 890
 * Date: 2017/6/16
 * Time: 9:28
 */

namespace app\index;


use think\Config;
use think\Request;
use think\View;

class Controller
{
    /**
     * @var View 视图类实例
     */
    protected $view;
    /**
     * @var Request Request实例
     */
    protected $request;

    public function __construct()
    {
        if (null === $this->view) {
            $this->view = View::instance(Config::get('template'), Config::get('view_replace_str'));
        }
        if (null === $this->request) {
            $this->request = Request::instance();
        }
    }
}