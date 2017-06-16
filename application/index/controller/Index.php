<?php
namespace app\index\controller;

use app\index\Controller;
use think\Db;

class Index extends Controller
{
    public function index()
    {
        return $this->view->fetch();
    }

    /**
     * 代理商申请
     * @return string
     */
    public function agent()
    {
    	return $this->view->fetch();
    }

    /**
     * 商户申请
     * @return string
     */
    public function merchant()
    {
        return $this->view->fetch();
    }

    public function notice($id = null)
    {
        if(!is_numeric($id)){
            $id = Db::name('notice')->order('create_time','desc')->value('id');
        }

        $notice = Db::name('notice')->where(array('id'=>$id))->find();

        $sources = Db::name('source')->where(array('notice_id'=>$id))->select();
        $this->view->assign('notice',$notice);
        $this->view->assign('sources',$sources);
        return $this->view->fetch();
    }

    public function download($id = 0)
    {
        $path = Db::name('source')->where(array('id'=>$id))->value('path');
        $path = "../public/".str_replace('\\','/',$path);
        return \File::download($path);
    }
}
