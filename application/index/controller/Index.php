<?php
namespace app\index\controller;

use think\Controller;

use app\common\model\Cate as CateModel;
use app\common\model\Article as ArticleModel;

class Index extends Common{
    public function index($cate_id = 0, $limit = 20)
    {
        $arr    = [];
        for ($i=0; $i < 10; $i++) {
            $arr[]  = $i;
        }
        $this->assign('arr', $arr);
        $map    = [];
        $cate_info  = [];
        if ( $cate_id > 0 ) {
            $map[]  = ['cate_id', '=', $cate_id];
            $cate_info = CateModel::where('id', $cate_id)->find();
        }
        $vo = ArticleModel::where($map)->order('id', 'desc')->paginate($limit);
        $vo = $vo->toArray();
        $list = $vo['data'];
        if (!empty($list)) {
            foreach ($list as $key => $vv) {
                if ( $cate_id > 0 ) {
                    $cate_name  = $cate_info['topic'];
                } else {
                    $cate_name  = CateModel::where('id', $vv['cate_id'])->value('topic');
                }
                $list[$key]['cate_name']    = $cate_name;
            }
        }
        $this->assign('list', $list);
        $rs     = [
            'total' => $vo['total'],
            'current_page'  => intval($vo['current_page']),
            'limit'     => $limit
        ];
        $this->assign('rs', $rs);
        $this->assign('cate_id', $cate_id);
        return $this->fetch();
    }

    public function read($id = 0){
        $vo = ArticleModel::where('id', $id)->find();
        if (empty($vo)) {
            $this->error('不存在此信息');
        }
        //print_r($vo);
        $this->assign('vo', $vo);
        $this->assign('cate_id', $vo['cate_id']);
        $cate_info  = CateModel::where('id', $vo['cate_id'])->find();
        $this->assign('cate_info', $cate_info);
        return $this->fetch();
    }
}
