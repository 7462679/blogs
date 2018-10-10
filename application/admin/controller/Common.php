<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;
use think\facade\Session;

use app\admin\model\Admins as AdminsModel;
use app\common\model\Setting as SettingModel;

class Common extends Controller
{
	private $admin_session;
	protected $admin_id;
	protected $admin_info;
	protected $admin_level;
	protected $site_info;

	public function __construct( Request $request = null ){
		parent::__construct();
		if (!Session::has('admin')) {
			$this->redirect('login/index');
		}
		$this->admin_session = Session::get('admin');
		if ( $this->checkAuth() == false ) {
			$this->redirect('login/index');
		}
		$this->assign('admin_info', $this->admin_info);
		$this->site_info 	= $this->getSiteInfo();
		$this->assign('site_info', $this->site_info);
	}

	private function checkAuth(){
		$this->admin_id     = $this->admin_session['admin_id'];
		$admin_auth         = authcode($this->admin_session['admin_auth'], false);
		$admin_auth         = unserialize($admin_auth);
		$this->admin_info   = AdminsModel::where('id', $this->admin_id)->find();
		if ($this->admin_info['admin_pwd'] != $admin_auth['admin_pwd']) {
			return false;
		}
		unset($this->admin_info['admin_pwd']);
		// 可更新session
		Session::set('admin',$this->admin_session);
		return true;
	}

	private function getSiteInfo(){
		$vo = SettingModel::find();
		return $vo;
	}
}
