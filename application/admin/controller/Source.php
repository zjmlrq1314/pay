<?php
namespace app\admin\controller;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);

use app\admin\Controller;
use think\Db;

class Source extends Controller
{
    use \app\admin\traits\controller\Controller;
    // 方法黑名单
    protected static $blacklist = [];

    public function beforeAdd()
    {
        $this->get_notice();
    }

    public function beforeEdit()
    {
        $this->get_notice();
    }

    private function get_notice()
    {
        $result = Db::name('notice')->select();
        $this->view->assign('notice',$result);
    }

    
}
