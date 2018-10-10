<?php

namespace app\index\controller;

use think\Controller;
use think\Request;

use app\common\model\Cate as CateModel;
use app\common\model\Article as ArticleModel;

class Common extends Controller
{
    protected $cate_list;
    public function __construct( Request $request = null ){
        parent::__construct();
        $this->_getCateList(); // 分类
        $this->_getArchive(); // 归档
        $this->_getHotArticle(10); // 取出热门文章
    }

    public function _getCateList(){
        $this->cate_list  = CateModel::order('sort_id', 'asc')->select();
        $this->assign('cate_list', $this->cate_list);
    }

    private function _getArchive(){
        //SELECT YEAR(FROM_UNIXTIME(dateline, '%Y-%c-%d %h:%i:%s')) AS year, MONTH(FROM_UNIXTIME(dateline, '%Y-%c-%d %h:%i:%s')) as month, COUNT(*) AS count FROM wp_article  GROUP BY year, month ORDER BY year DESC, month DESC
        $list = ArticleModel::order(['year', 'month'=>'desc'])->group('year, month')->field("YEAR(FROM_UNIXTIME(dateline, '%Y-%c-%d %h:%i:%s')) AS year, MONTH(FROM_UNIXTIME(dateline, '%Y-%c-%d %h:%i:%s')) as month, COUNT(id) AS count")->select();
        $this->assign('archive_list', $list);
    }

    private function _getHotArticle($limit){
        $list = ArticleModel::order('views', 'desc')->limit($limit)->select();
        $this->assign('hot_article', $list);
    }
}
