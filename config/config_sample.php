<?php

!defined('APP_PATH') && define('APP_PATH', __DIR__ . '/../');

// 系统配置
include dirname(__FILE__) . DIRECTORY_SEPARATOR . 'sys_config.php';

// 数据库表
include dirname(__FILE__) . DIRECTORY_SEPARATOR . 'sys_tables.php';

// 数据库设置
include dirname(__FILE__) . DIRECTORY_SEPARATOR . 'config_database.php';

// 微信公众号AppId
define("APPID", "__APPID__");

// 微信公众号AppSecret
define("APPSECRET", "__APPSECRET__");

// 微信公众号通讯AESKey
define('EncodingAESKey', '');

// 微信公众号验证TOKEN
define("TOKEN", "__TOKEN__");

// <微信支付> 商户ID(partnerId)
define("PARTNER", "__PARTNER__");

// <微信支付> 商户通加密串(partnerKey)
define("PARTNERKEY", "__PARTNERKEY__");

// <微信支付> CA证书 .pem文件
define('CERT_PATH', dirname(__FILE__) . DIRECTORY_SEPARATOR . "apiclient_cert.pem");

// <微信支付> CA证书 .pem文件
define('CERT_KEY_PATH', dirname(__FILE__) . DIRECTORY_SEPARATOR . "apiclient_key.pem");

// <微信支付> CA证书 .pem文件
define('CERT_ROOTCA', dirname(__FILE__) . DIRECTORY_SEPARATOR . "rootca.pem");

// debug开关
$config->debug = false;

// 数据库host
$config->db['host'] = '__DBHOST__';

// 数据库名
$config->db['db'] = '__DBNAME__';

// 数据库用户
$config->db['user'] = '__DBUSER__';

// 数据库密码
$config->db['pass'] = '__DBPASS__';

// 是否已经通过微信认证
$config->wechatVerifyed = true;

// 废弃，不删除
$config->useWechatAddr = true;

//支持货到付款
$config->noPay = false;

// 系统根目录
$config->shoproot = '__DOCROOT__';

// 系统根域名 /结尾
$config->domain = '__DOMAIN__';

// 不需要微信支付直接下单 测试用
$config->order_nopayment = FALSE;

// 微信支付回调
$config->order_wxpay_notify = $config->domain . "wxpay_notify.php";

// 微信支付回调 代付
$config->order_wxpay_notify_req = $config->domain . "wxpay_notify_req.php";

// 订单收到提示模板消息
$config->messageTpl['new_order_notify'] = 'rmtx_Ld1b-0NMZmGGac64vBIklUZg9Jz_6k8dzj5MU4';

// 代理审核通过模板消息
$config->messageTpl['company_reg_notify'] = '0EeaE15LDIg-LJc0JKFDYgOVfFZgK4hPwGfN9S13-qM';

// 订单发货模板消息
$config->messageTpl['order_exp_notify'] = 'ds5sXHkdNYW7dDqjuDiL5b47wmWGmK6KopXPuyjEt3U';

$config->imagesSuffix50 = '_x50';

$config->imagesSuffix100 = '_x100';

$config->imagesSuffix500 = '_x500';

$config->cssversion = '1.5.1';

$config->shopName = '__SHOPNAME__';

// upyun 商品图片前缀
$config->imagesPrefix = 'http://iwshop.b0.upaiyun.com/' . $config->upyunDir;

// 商品图片目录
$config->productPicRoot = APP_PATH . "uploads/product_hpic/";

// 商品图片临时目录
$config->productPicRootTmp = APP_PATH . "uploads/product_hpic_tmp/";

// 商品外链目录
$config->productPicLink = $config->shoproot . "uploads/product_hpic/";

// 商品外链预览
$config->productPicLinkTmp = $config->shoproot . "uploads/product_hpic_tmp/";

// 图片云 商品图片目录
$config->cdnProductPicRoot = '/' . $config->upyunDir . '/product_hpic/';

// 是否启用upyun CDN
$config->usecdn = false;

// 外部订单号前缀
$config->out_trade_no_prefix = 'ord-';

// log目录设置
$config->logdir = APP_PATH . 'logs' . DIRECTORY_SEPARATOR;

// 微信消息 开启AES
$config->wechat_aes_open = true;