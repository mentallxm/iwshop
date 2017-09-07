<?php

define('PARTNERKEY', '27f5c84489ca6e7f5e0cdaa6f6252e23');

/**
 * 格式化参数格式化成url参数
 */
function ToUrlParams($arr) {
    $buff = "";
    foreach ($arr as $k => $v) {
        if ($k != "sign" && $v != "" && !is_array($v)) {
            $buff .= $k . "=" . $v . "&";
        }
    }
    $buff = trim($buff, "&");
    return $buff;
}

/**
 * 生成签名
 * @param array $pack
 * @return string
 */
function paySign($pack) {
    ksort($pack);
    $string = ToUrlParams($pack);
    $string = $string . "&key=" . PARTNERKEY;
    $string = md5($string);
    $result = strtoupper($string);
    return $result;
}

$data = file_get_contents('./payment_notify.xml');

$postObj = simplexml_load_string($data, 'SimpleXMLElement', LIBXML_NOCDATA);

$postObj = (array)$postObj;

$JsSign = paySign($postObj);

var_dump($postObj);

echo PHP_EOL . $JsSign;