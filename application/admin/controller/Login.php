<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;

use app\admin\model\Admins as AdminsModel;
use app\admin\model\AdminsLogs as LogsModel;

class Login extends Controller
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        if ($this->request->isPost()) {
            $param      = $this->request->param();

            if (empty($param['name'])) {
                $this->error('请输入登录名');
            }
            if (empty($param['password'])) {
                $this->error('请输入登录密码');
            }
            $vo = AdminsModel::where([
                ['admin_name', '=', $param['name']]
            ])->find();
            if (empty($vo)) {
                $this->error('无此用户');
            }
            if ( salt_pwd($vo['salt'], $param['password']) != $vo['admin_pwd'] ) {
                $this->error('登录密码有误');
            }
            // 验证通过。进行数据更新并进行session处理
            $last_time      = time();
            $logins         = $vo['logins'] + 1;
            $data = [
                'last_ip'   => get_client_ip(),
                'last_time' => $last_time,
                'logins'    => $logins
            ];
            AdminsModel::where([
                ['id', '=', $vo['id']]
            ])->update($data);

            //$this->saveLogs($vo['id'], $param['name'], '管理员登录');

            $auth = array(
                'admin_id'          => $vo['id'],
                'admin_name'        => $vo['admin_name'],
                'admin_pwd'         => $vo['admin_pwd'],
            );
            $auth       = serialize($auth);
            $admin_auth = authcode($auth);
            $admin_session  = [
                'admin_id'      => $vo['id'],
                'admin_auth'    => $admin_auth
            ];
            session('admin', $admin_session);
            LogsModel::logs($vo['id'], $vo['admin_name'], '管理员登录');
            $this->success('登录成功', 'Index/index');
        } else {
            return $this->fetch();
        }
        //LogsModel::logs(1, '1', 'test');
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function create()
    {
        //
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save(Request $request)
    {
        //
    }

    /**
     * 显示指定的资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        //
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * 保存更新的资源
     *
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        //
    }
}
