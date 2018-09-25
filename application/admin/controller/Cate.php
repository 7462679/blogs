<?php

namespace app\admin\controller;

use think\Controller;

use app\admin\model\AdminsLogs as LogsModel;
use app\common\model\Cate as CateModel;

class Cate extends Common
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        if ($this->request->isAjax()) {
            $list  = CateModel::order('id', 'asc')->select();
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
        if ( $this->request->isPost() ) {
            $param  = $this->request->param();
            if (empty($param['topic'])) {
                $this->error('请填写类别名称');
            }
            $param['sort_id']   = intval($param['sort_id']);

            CateModel::create($param);
            LogsModel::logs($this->admin_id, $this->admin_info['admin_name'], "添加了名称为{{$param['topic']}}的类别");
            $this->success('类别添加成功', 'Cate/index');
        } else {
            return $this->fetch();
        }
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id)
    {
        $vo = CateModel::where('id', $id)->find();
        if (empty($vo)) {
            $this->error('不存在此类别信息');
        }
        if ($this->request->isPost()) {
            $param  = $this->request->param();
            if (empty($param['topic'])) {
                $this->error('请填写类别名称');
            }
            $param['sort_id']   = intval($param['sort_id']);

            CateModel::where('id', $id)->update($param);
            LogsModel::logs($this->admin_id, $this->admin_info['admin_name'], "修改了名称为{{$param['topic']}}的类别");
            $this->success('类别修改成功', 'Cate/index');
        } else {
            $this->assign('vo', $vo);
            return $this->fetch();
        }
    }
}
