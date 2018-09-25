<?php

namespace app\index\controller;

use think\Controller;
use think\Request;

use app\common\model\Cate as CateModel;

class Common extends Controller
{
    protected $cate_list;
    public function __construct( Request $request = null ){
        parent::__construct();
        $this->_getCateList();
    }

    public function _getCateList(){
        $this->cate_list  = CateModel::order('sort_id', 'asc')->select();
        $this->assign('cate_list', $this->cate_list);
    }
}
