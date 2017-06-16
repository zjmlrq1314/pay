<?php
/**
 * tpAdmin [a web admin based ThinkPHP5]
 *
 * @author yuan1994 <tianpian0805@gmail.com>
 * @link http://tpadmin.yuan1994.com/
 * @copyright 2016 yuan1994 all rights reserved.
 * @license http://www.apache.org/licenses/LICENSE-2.0
 */

//------------------------
// 管理后台首页
//-------------------------

namespace app\admin\controller;

use app\admin\Controller;
use think\Loader;
use think\Session;
use think\Db;

class Index extends Controller
{

    public function index()
    {
        // 读取数据库模块列表生成菜单项
        $nodes = Loader::model('AdminNode', 'logic')->getMenu();

        // 节点转为树
        $tree_node = list_to_tree($nodes);

        // 显示菜单项
        $menu = [];
        $groups_id = [];
        foreach ($tree_node as $module) {
            if ($module['pid'] == 0 && strtoupper($module['name']) == strtoupper($this->request->module())) {
                if (isset($module['_child'])) {
                    foreach ($module['_child'] as $controller) {
                        $group_id = $controller['group_id'];
                        array_push($groups_id, $group_id);
                        $menu[$group_id][] = $controller;
                    }
                }
            }
        }

        // 获取授权节点分组信息
        $groups_id = array_unique($groups_id);
        if (!$groups_id) {
            exception("没有权限");
        }
        $groups = Db::name("AdminGroup")->where(['id' => ['in', $groups_id], 'status' => "1"])->order("sort asc,id asc")->field('id,name,icon')->select();

        $this->view->assign('groups', $groups);
        $this->view->assign('menu', $menu);

        return $this->view->fetch();
    }

    /**
     * 欢迎页
     * @return mixed
     */
    public function welcome()
    {
        if(ADMIN){
            return $this->default_welcome();
        }else{
            $role_id = Db::name('AdminRoleUser')->where(array('user_id'=>UID))->value('role_id');
            switch ($role_id){
                case 1:
                    return $this->merchant_welcome();
                    break;
                case 2:
                    return $this->agent_welcome();
                    break;
                default:
                    return $this->default_welcome();
            }
        }


    }

    /**
     * 默认欢迎页面
     * @return string
     */
    public function default_welcome()
    {
        // 查询 ip 地址和登录地点
        if (Session::get('last_login_time')) {
            $last_login_ip = Session::get('last_login_ip');
            $last_login_loc = \Ip::find($last_login_ip);

            $this->view->assign("last_login_ip", $last_login_ip);
            $this->view->assign("last_login_loc", implode(" ", $last_login_loc));

        }
        $current_login_ip = $this->request->ip();
        $current_login_loc = \Ip::find($current_login_ip);

        $this->view->assign("current_login_ip", $current_login_ip);
        $this->view->assign("current_login_loc", implode(" ", $current_login_loc));

        // 查询个人信息
        $info = Db::name("AdminUser")->where("id", UID)->find();
        $this->view->assign("info", $info);

        //代理商图
        $agentLegendData = array('代理总数','新增代理');
        $agentId = Db::name('AdminRoleUser')->where(array('role_id'=>2))->column('user_id');
        $agentNewTotal = 0;
        if(count($agentId)){
            $agentNewTotal = Db::name('AdminUser')->where(array('id'=>array('in',$agentId)))->whereTime('create_time', 'yesterday')->count();
        }
        $agentData = array(
            array('value'=>count($agentId),'name'=>'代理总数'),
            array('value'=>$agentNewTotal,'name'=>'新增代理')
        );
        $agentLegendData = json_encode($agentLegendData);
        $agentData = json_encode($agentData);
        $this->view->assign('agentData',$agentData);
        $this->view->assign('agentLegendData',$agentLegendData);
        //商户图
        $userLegendData = array('商户总数','新增商户');
        $userId = Db::name('AdminRoleUser')->where(array('role_id'=>1))->column('user_id');
        $userNewTotal = 0;
        if(count($userId)){
            $userNewTotal = Db::name('AdminUser')->where(array('id'=>array('in',$agentId)))->whereTime('create_time', 'yesterday')->count();
        }
        $userData = array(
            array('value'=>count($userId),'name'=>'商户总数'),
            array('value'=>$userNewTotal,'name'=>'新增商户')
        );
        $userLegendData = json_encode($userLegendData);
        $userData = json_encode($userData);
        $this->view->assign('userData',$userData);
        $this->view->assign('userLegendData',$userLegendData);
        return $this->view->fetch('welcome');
    }

    /**
     * 商户欢迎页面
     */
    public function merchant_welcome()
    {
        // 查询 ip 地址和登录地点
        if (Session::get('last_login_time')) {
            $last_login_ip = Session::get('last_login_ip');
            $last_login_loc = \Ip::find($last_login_ip);

            $this->view->assign("last_login_ip", $last_login_ip);
            $this->view->assign("last_login_loc", implode(" ", $last_login_loc));

        }
        $current_login_ip = $this->request->ip();
        $current_login_loc = \Ip::find($current_login_ip);

        $this->view->assign("current_login_ip", $current_login_ip);
        $this->view->assign("current_login_loc", implode(" ", $current_login_loc));

        // 查询个人信息
        $info = Db::name("AdminUser")->where("id", UID)->find();
        //var_export($info);die();
        $this->view->assign("info", $info);
        return $this->view->fetch('merchant_welcome');
    }

    /**
     * 代理商欢迎页面
     */
    public function agent_welcome()
    {
        // 查询 ip 地址和登录地点
        if (Session::get('last_login_time')) {
            $last_login_ip = Session::get('last_login_ip');
            $last_login_loc = \Ip::find($last_login_ip);

            $this->view->assign("last_login_ip", $last_login_ip);
            $this->view->assign("last_login_loc", implode(" ", $last_login_loc));

        }
        $current_login_ip = $this->request->ip();
        $current_login_loc = \Ip::find($current_login_ip);

        $this->view->assign("current_login_ip", $current_login_ip);
        $this->view->assign("current_login_loc", implode(" ", $current_login_loc));

        // 查询个人信息
        $info = Db::name("AdminUser")->where("id", UID)->find();
       $this->view->assign("info", $info);
       //var_export($info);die();
        //商户统计图(商户的总数，最新增加的商户)
        $userLegendData = array('商户总数','新增商户');
        $userId = Db::name('AdminRoleUser')->where(array('role_id'=>1))->column('user_id');
        $userNewTotal = 0;
        if(count($userId)){
            $userNewTotal = Db::name('AdminUser')->where(array('id'=>array('in',$userId)))->whereTime('create_time', 'yesterday')->count();
        }
        $userData = array(
            array('value'=>count($userId),'name'=>'商户总数'),
            array('value'=>$userNewTotal,'name'=>'新增商户')
        );
        $userLegendData = json_encode($userLegendData);
        $userData = json_encode($userData);
        $this->view->assign('userData',$userData);
        $this->view->assign('userLegendData',$userLegendData);

        return $this->view->fetch('agent_welcome');
    }
}