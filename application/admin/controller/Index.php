<?php
namespace app\admin\controller;

use think\Controller;
use think\facade\Session;

use app\admin\model\Admins as AdminModel;

class Index extends Common
{
    public function index()
    {
        return $this->fetch();
    }

    public function main(){
        return $this->fetch();
    }

    public function add(){
        return $this->fetch();
    }
}
