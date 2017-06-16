<?php
/**
 * 配置
 * User: 890
 * Date: 2017/6/16
 * Time: 9:32
 */
use \think\Request;

$basename = Request::instance()->root();
if (pathinfo($basename, PATHINFO_EXTENSION) == 'php') {
    $basename = dirname($basename);
}
return [
    // 默认的空控制器名
    'empty_controller'       => 'PayError',
    // 模板参数替换
    'view_replace_str' => [
        '__ROOT__'   => $basename,
        '__STATIC__' => $basename . '/static/admin',
        '__LIB__'    => $basename . '/static/admin/lib',
    ],
];