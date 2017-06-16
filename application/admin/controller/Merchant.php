<?php
namespace app\admin\controller;

\think\Loader::import('controller/Controller', \think\Config::get('traits_path') , EXT);

use app\admin\Controller;
use think\Db;
use think\Request;

class Merchant extends Controller
{
    use \app\admin\traits\controller\Controller;
    // 方法黑名单
    protected static $blacklist = [];
/*
 * 模糊查询*/
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
    /**
     * 商户列表  修改信息
     * @param null $id
     * @return string|\think\Response|\think\response\Json|\think\response\Jsonp|\think\response\Redirect|\think\response\View|\think\response\Xml
     */
    public function edit($id = null)
    {
        if(Request::instance()->isPost()){
            $updateData = Request::instance()->post();
            if (!$updateData['id']) {
                return ajax_return_adv_error("缺少参数ID");
            }
            Db::startTrans();
            try{
                Db::name('merchant')->update($updateData);
                $data = array(
                    'pid'=>$updateData['id'],
                    'title'=>'修改商户状态',
                    'user_id'=>UID,
                    'create_time'=>time(),
                    'type'=>3
                );
                Db::name('user_record')->insert($data);
                Db::commit();
                return ajax_return_adv("编辑成功");
            } catch (\Exception $e) {
                Db::rollback();
                return ajax_return_adv_error($e->getMessage());
            }

        }else{
            $result = Db::name('merchant')->where(array('id'=>$id))->find();
            $this->view->assign('vo',$result);
            $this->get_agent();
            return $this->view->fetch();
        }

    }

    private function get_agent()
    {
        $agent= Db::name('agent')->where(array('status'=>array('eq',1)))->select();
        $this->view->assign('agent',$agent);
    }

}
