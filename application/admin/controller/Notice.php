<?php
namespace app\admin\controller;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);

use app\admin\Controller;

class Notice extends Controller
{
    use \app\admin\traits\controller\Controller;
    // 方法黑名单
    protected static $blacklist = [];

    /**
     * 模糊搜索
     * @param $map
     */
    protected function filter(&$map)
    {
        if ($this->request->param("title")) {
            $map['title'] = ["like", "%" . $this->request->param("title") . "%"];
        }
    }
    
}
