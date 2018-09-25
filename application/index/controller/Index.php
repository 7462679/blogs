<?php
namespace app\index\controller;

use think\Controller;

use app\common\model\Cate as CateModel;
use app\common\model\Article as ArticleModel;

class Index extends Common{
    public function index($cate_id = 0)
    {
        $arr    = [];
        for ($i=0; $i < 10; $i++) {
            $arr[]  = $i;
        }
        $this->assign('arr', $arr);
        $this->assign('cate_id', $cate_id);
        return $this->fetch();
    }

    public function read($id = 0){
        $vo = ArticleModel::where('id', $id)->find();
        if (empty($vo)) {
            $this->error('不存在此信息');
        }
        $this->assign('vo', $vo);
        $this->assign('cate_id', $vo['cate_id']);
        $arr    = [];
        for ($i=0; $i < 10; $i++) {
            $arr[]  = $i;
        }
        $this->assign('arr', $arr);
        return $this->fetch();
    }
}
