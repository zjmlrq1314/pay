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

    /**
     * 公告在首页显示
     * @param null $id
     * @return string
     */
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

    /**
     * 资源列表的文件和图片下载
     * @param int $id
     * @return string
     */
    public function download($id = 0)
    {
        $path = Db::name('source')->where(array('id'=>$id))->value('path');
        $path = "../public/".str_replace('\\','/',$path);
        return \File::download($path);
    }
}
