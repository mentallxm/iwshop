<?php

include "./test_base.php";

$testUid = 3;

$filename = 'images.jpg';

$dir = __DIR__ . DIRECTORY_SEPARATOR . $filename;

$ret = Curl::post($baseURI . '/?/wImages/ImageUpload/', [
    'asd' => 1,
    'attach' => '@' . $dir,
], true);

var_dump($ret);
