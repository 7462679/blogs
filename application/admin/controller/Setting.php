<?php

namespace app\admin\controller;

use think\Controller;

use app\admin\model\AdminsLogs as LogsModel;
use app\common\model\Cate as CateModel;
use app\common\model\Setting  as SettingModel;

class Setting extends Common
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        if ($this->request->isPost()) {
            $data   = $this->request->param();

            SettingModel::where('id', 1)->update($data);
            $this->success('更新成功', 'Setting/index');
        } else {
            $vo = SettingModel::find();
            $this->assign('vo', $vo);
            return $this->fetch();
        }
    }
}
