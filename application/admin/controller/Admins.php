<?php

namespace app\admin\controller;

use think\Controller;
use think\Validate;

use app\admin\model\Admins as AdminsModel;
use app\admin\model\AdminsLogs as LogsModel;

class Admins extends Common
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        if ($this->request->isAjax()) {
            $list  = AdminsModel::order('id', 'asc')->select();
            if ($list) {
                foreach ($list as $key => $vo) {
                    $list[$key]['last_time']    = date('Y-m-d H:i', $vo['last_time']);
                }
            }
            $count = count($list);
            $res = [
                'code'  => 0,
                'msg'   => '获取成功',
                'count' => $count,
                'data'  => $list
            ];
            return json($res);
        } else {
            return $this->fetch();
        }
    }

    public function add(){
        if ($this->request->isPost()) {
            $param   = $this->request->param();

            $rule = [
                'admin_name'     => 'require|alphaDash|length:5,16',
                'password'       => 'require|alphaDash|length:6,16',
            ];

            $msg = [
                'admin_name.require'        => '请输入登录名',
                'admin_name.alphaDash'      => '登录名只能是数字、字母或下划线组合',
                'admin_name.length'         => '登录名的长度应在5-16位字符之间',
                'password.require'          => '请输入登录密码',
                'password.alphaDash'        => '登录密码只能是数字、字母或下划线组合',
                'password.length'           => '登录密码的长度应在6-16位字符之间'
            ];
            $validate   = Validate::make($rule,$msg);
            $result = $validate->check($param);
            if(!$result) {
                $err = $validate->getError();
                $this->error($err);
            }

            $salt   = salt();

            $password       = salt_pwd($salt, $param['password']);

            $data = [
                'admin_name'    => $param['admin_name'],
                'admin_pwd'     => $password,
                'salt'          => $salt
            ];
            AdminsModel::create($data);
            LogsModel::logs($this->admin_id, $this->admin_info['admin_name'], "添加了登录名为{{$data['admin_name']}}的管理员");
            $this->success('管理员添加成功', 'Admins/index');
        } else {
            return $this->fetch();
        }
    }

    public function edit($id){
        $vo = AdminsModel::where('id', $id)->find();
        if (empty($vo)) {
            $this->error('不存在此管理员信息');
        }
        if ($this->request->isPost()) {
            $param  = $this->request->param();
            $rule = [
                'password'      => 'require|alphaDash|length:6,16',
                'repassword'    => 'require|confirm:password'
            ];

            $msg = [
                'password.require'          => '请输入登录密码',
                'password.alphaDash'        => '登录密码只能是数字、字母或下划线组合',
                'password.length'           => '登录密码的长度应在6-16位字符之间',
                'repassword.require'        => '请输入确认密码',
                'repassword.password'       => '确认密码输入错误'
            ];
            $validate   = Validate::make($rule,$msg);
            $result = $validate->check($param);
            if(!$result) {
                $err = $validate->getError();
                $this->error($err);
            }

            $salt           = salt();
            $password       = salt_pwd($salt, $param['password']);

            $data = [
                'admin_pwd'     => $password,
                'salt'          => $salt
            ];
            AdminsModel::where('id', $id)->update($data);
            LogsModel::logs($this->admin_id, $this->admin_info['admin_name'], "修改了登录名为{{$vo['admin_name']}}管理员的登录密码");
            $this->success('管理员密码修改成功', 'Admins/index');
        } else {
            $this->assign('vo', $vo);
            return $this->fetch();
        }
    }
}
