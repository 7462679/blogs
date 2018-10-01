<?php

namespace app\admin\controller;

use think\Controller;
use think\Validate;

use app\admin\model\AdminsLogs as LogsModel;
use app\common\model\Cate as CateModel;
use app\common\model\Article as ArticleModel;

class Article extends Common
{
	/**
	 * 显示资源列表
	 *
	 * @return \think\Response
	 */
	public function index($limit = 10)
	{
		if ($this->request->isAjax()) {
			$vo = ArticleModel::order('id', 'desc')->paginate($limit);
			$vo = $vo->toArray();
			foreach ($vo['data'] as $key => $vv) {
				$vv['cate_name']    = CateModel::where('id', $vv['cate_id'])->value('topic');
				$vv['create_time']  = date("Y-m-d H:i", $vv['dateline']);
				/*$company_name   = '<span class="c2">未关联企业</span>';
				if ($vv['cid'] > 0) {
					$company_name    = CompanyModel::where('id', $vv['cid'])->value('company_name');
				}
				$vv['company_name'] = $company_name;
				// 部门
				$department_name    = '<span class="c2">未关联部门</span>';
				if ($vv['did'] > 0) {
					$department_name    = DepartmentModel::where('id', $vv['did'])->value('topic');
				}
				$vv['department_name']  = $department_name;
				$vv['create_time_txt']  = date("Y-m-d H:i", $vv['create_time']);
				$vv['last_time_txt']    = date("Y-m-d H:i", $vv['last_time']);*/
				$vo['data'][$key]   = $vv;
			}
			$res = [
				'code'  => 0,
				'msg'   => '获取成功',
				'count' => $vo['total'],
				'data'  => $vo['data'],
			];
			return json($res);
		} else{
			$url    = url('Article/index');
			$this->assign('url', $url);
			return $this->fetch();
		}
	}

	public function add(){
		if ($this->request->isPost()) {
			$param   = $this->request->param();

            $rule = [
            	'topic'			=> 'require',
            	'cate_id'		=> '>:0',
                'contents'      => 'require'
            ];

            $msg = [
                'topic.require'        => '请输入文章标题',
                'cate_id'      			=> '请选择文章类别',
                'contents.require'      => '请输入文章内容'
            ];
            $validate   = Validate::make($rule,$msg);
            $result = $validate->check($param);
            if(!$result) {
                $err = $validate->getError();
                $this->error($err);
            }
            $data 	= $param;
            $data['dateline']	= time();
            $data['is_post']	= 1;
            //print_r($param);exit;
            ArticleModel::create($data);
            LogsModel::logs($this->admin_id, $this->admin_info['admin_name'], "新增了文章");
            $this->success('文章添加成功', 'Article/index');
		} else {
			$cate_list  = CateModel::order('id', 'asc')->select();
			$this->assign('cate_list', $cate_list);
			return $this->fetch();
		}
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
		$vo = ArticleModel::where('id', $id)->find();
		if (empty($vo)) {
			$this->error('不存在此信息');
		}
		if ($this->request->isPost()) {
			$param   = $this->request->param();

            $rule = [
            	'topic'			=> 'require',
            	'cate_id'		=> '>:0',
                'contents'      => 'require',
            ];

            $msg = [
                'topic.require'        	=> '请输入文章标题',
                'cate_id'      			=> '请选择文章类别',
                'contents.require'      => '请填写文章内容'
            ];
            $validate   = Validate::make($rule,$msg);
            $result = $validate->check($param);
            if(!$result) {
                $err = $validate->getError();
                $this->error($err);
            }
            $data 	= $param;
            ArticleModel::where('id', $id)->update($data);
            LogsModel::logs($this->admin_id, $this->admin_info['admin_name'], "修改了文章");
            $this->success('文章修改成功', 'Article/index');
		} else {
			$this->assign('vo', $vo);
			$cate_list  = CateModel::order('id', 'asc')->select();
			$this->assign('cate_list', $cate_list);
			return $this->fetch();
		}
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
