<?php
namespace app\admin\controller;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);

use app\admin\Controller;
use think\Db;

class Customer extends Controller
{
    use \app\admin\traits\controller\Controller;
    // 方法黑名单
    protected static $blacklist = [];
    /**
     * 模糊查询
     * @param $map
     */
    protected function filter(&$map)
    {
        if ($this->request->param("user_name")) {
            $map['user_name'] = ["like", "%" . $this->request->param("user_name") . "%"];
        }
        if ($this->request->param("email")) {
            $map['email'] = ["like", "%" . $this->request->param("email") . "%"];
        }
        if ($this->request->param("phone")) {
            $map['phone'] = ["like", "%" . $this->request->param("phone") . "%"];
        }
        if ($this->request->param("merchant")) {
            $map['merchant'] = ["like", "%" . $this->request->param("merchant") . "%"];
        }
    }
    private function get_agent()
    {
        $agent= Db::name('agent')->where(array('status'=>array('eq',1)))->select();
        $this->view->assign('agent',$agent);
    }

    public function beforeIndex()
    {
        $this->get_agent();
    }

    public function beforeAdd()
    {
        $this->view->assign('vo',array('agent_id'=>-1));
        $this->get_agent();
    }
    public function beforeEdit()
    {
        $this->get_agent();
    }
}
