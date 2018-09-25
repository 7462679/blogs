<?php

namespace app\admin\model;

use think\Model;

class AdminsLogs extends Model
{
    protected $name = 'admins_logs';

    static function logs($id = 0, $name = '', $info = ''){
        $request = request();
        $ip             = get_client_ip();
        $dateline       = time();
        $url            = $request->url(true);
        $url_method     = $request->method();
        $contents       = "参数：";
        foreach ($request->param() as $key => $vv) {
            $contents   .= $key.",";
        }
        //
        $data   = array(
            'admin_id'      => $id,
            'admin_name'    => $name,
            'info'          => $info,
            'ip'            => $ip,
            'dateline'      => $dateline,
            'url'           => $url,
            'url_method'    => $url_method,
            'contents'      => $contents,
        );
        $v = self::create($data);
        //db('admins_logs')->insert($data);
        return true;
    }
}
