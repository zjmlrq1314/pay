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

    /**
     * 添加
     */
    public function beforeAdd()
    {
        $this->get_notice();
    }
    /**
     * 编辑
     */
    public function beforeEdit()
    {
        $this->get_notice();
    }
    /**
     * 搜索
     */
    public function beforeIndex()
    {
       $this->get_notice();
    }
    /**
     * 模糊搜索
     * @param $map
     */
    protected function filter(&$map)
    {
        if ($this->request->param("number")) {
            $map['number'] = ["like", "%" . $this->request->param("number") . "%"];
        }
    }
    /**
     * 公告详情
     */
    private function get_notice()
    {
        $result = Db::name('notice')->select();
        $this->view->assign('notice',$result);
    }

    
}
