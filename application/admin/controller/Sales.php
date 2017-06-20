<?php
namespace app\admin\controller;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);

use app\admin\Controller;
use think\Db;
use think\Request;

class Sales extends Controller
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

    /**
     * 获取代理商信息
     */
    private function get_agent()
    {
        $agent= Db::name('agent')->where(array('status'=>array('eq',1)))->select();
        $this->view->assign('agent',$agent);
    }

    public function beforeIndex()
    {
        $merchant = Db::name('merchant')->select();
        $this->view->assign('merchant',$merchant);
        $this->get_agent();
    }

    public function beforeAdd()
    {
        $merchant = Db::name('merchant')->select();
        $this->view->assign('merchant',$merchant);
        $this->view->assign('vo',array('merchant_id'=>0,'agent_id'=>0));
        $this->get_agent();
    }
    public function beforeEdit()
    {
        $merchant = Db::name('merchant')->select();
        $this->view->assign('merchant',$merchant);
        $this->get_agent();
    }

    public function ajax_agent()
    {
      $agentId=Request::instance()->post('id');
      $agent_id = Db::name('merchant')->where(array('id'=>$agentId))->value('agent_id');
        $data = Db::name('agent')->where(array('id'=>$agent_id))->value('user_name');
//        header("Content-type: application/json");
//        exit(json_encode($data));
//        echo $data;
        $this ->ajaxReturn(array('data' => $data));
    }
}
