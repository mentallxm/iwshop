2017-09-23 更新说明
====
收藏功能官方源码没有数据表，本次更新添加了表的sql语句

2017-09-15 更新说明
====
		1.增加了商品分享二维码的功能，官方原来有HTML代码和JS代码，没有PHP代码，修复了这个功能；生成的二维码图片在uploads/product_qrcode/商品ID.png，如果二维码图片存在了，就不生成，没有就生成，另外要想实现微信中扫码就能登录跳转到商品页面的功能，需要对二维码的URL进行处理，加上微信的oauth，这里没有处理， 需要的话，自行处理。

#说明

1.修复了js找不到的问题，在github.com找到另一个开源iwshop，将里面的js copy过来，项目中有很多重复的js，等待以后清理下

2.修复了sell_price无法修改的问题

3.权限管理增加了商户相关的东西，数据库原来就有，只不过代码上没有。现在商户也可以登录后台了，修改权限商户权限，商品权限和订单权限，实现了商户查看自己商品和订单的功能

4.阿里云OSS请改成自己的，在config/config_oss.php配置

5.数据库、微信等请在config.php里面配置

6.安装请直接修改数据库，然后导入数据库文件，在根目录下面，官方的install有问题，还没有修复

7.后台用户名：admin 密码：admin

8.“店铺设置”增加了“清除缓存”的功能

#iWshop<微信开源商城>

iWshop是一个开源的微信商城。为了保证轻量级，使用了作者自主开发的mvc框架。 

LightMvc现已分离 <a href="https://git.oschina.net/koodo/LightMvc">https://git.oschina.net/koodo/LightMvc</a> 

>iWshop 交流群：`470442221`

>iWshop 交流社区：<a href="http://asw.iwshop.cn/" target="_blank">http://asw.iwshop.cn/</a> 

>iWshop 安装教程：<a href="http://git.oschina.net/koodo/iWshop/blob/dev/html/docs/install.md">http://git.oschina.net/koodo/iWshop/blob/dev/html/docs/install.md</a>


>安装教程图文教程及注意事项(JerryJee提供的教程)：<a target="_blank" href="http://www.jiloc.com/htmls/41.html">http://www.jiloc.com/htmls/41.html</a>

>微信公众平台三方接入技术问题总结,提问前必看(JerryJee提供的教程)：<a target="_blank" href="http://www.jiloc.com/htmls/43.html">http://www.jiloc.com/htmls/43.html</a>

>添加对wordpres的文章整合，可实现微信关键词对wordpress的内容匹配：<a target="_blank" href="http://www.jiloc.com/htmls/46.html">http://www.jiloc.com/htmls/46.html</a>


>`历史版本发布` <a target="_blank" href="http://git.oschina.net/koodo/iWshop/releases">http://git.oschina.net/koodo/iWshop/releases</a>

##配置说明 （请注意，iWshop当前稳定版正在开发中，请谨慎安装）

####一、根目录修改说明


如果是服务器根目录，必须修改为` /`


如果是服务器子目录，必须修改为`/subroot/` 等有左右斜杠的格式


修改文件：config/config.php 中的 $config->docroot选项

####二、手动部署说明

- 服务器配置过程略。

- 创建`/install/install.lock`

- 导入`/install/iWshop.sql`

- 后台地址（以域名www.iwshop.cn为例）为：http://www.iwshop.cn/?/Wdmin/login/

- 微信消息接口地址：http://www.iwshop.cn/wechat/ (切莫忘了最后的 / )

####三、目录权限说明

执行一下install里的shell文件

    ./install/dirmod.sh

请确保您的php配置中`magic_quotes_gpc为Off`，否则一些功能将失效

####四、配置文件config.php说明

初始配置文件为`config_sample.php`, 在/config/目录下

请编辑`config_sample.php`文件并且重命名为`config.php`

####五、运行环境要求
 
    * MySQL 5.5.3+ (utf8mb4编码用于保存带有emoji表情的微信用户昵称)**

    * PHP5.4+

    * PHP扩展：php_mysql php_curl php_pdo_mysql php_gd2


####六、演示项目

<img src="http://down.iwshop.cn/iwshop_release/images/qrcode3.jpg" height="140" width="140" style="border:1px solid #eee;margin-right:10px;" />
<img src="http://down.iwshop.cn/iwshop_release/images/qrcode2.jpg" height="140" width="140" style="border:1px solid #eee;margin-right:10px;" /> 
<img src="http://down.iwshop.cn/iwshop_release/images/qrcode1.jpg" height="140" width="140" style="border:1px solid #eee;margin-right:10px;" /> 
<img src="http://down.iwshop.cn/iwshop_release/images/qrcode4.jpg" height="140" width="140" style="border:1px solid #eee;margin-right:10px;" />
<img src="http://down.iwshop.cn/iwshop_release/images/qrcode5.jpg" height="140" width="140" style="border:1px solid #eee;margin-right:10px;" />
<img src="http://down.iwshop.cn/iwshop_release/images/qrcode7.jpg" height="140" width="140" style="border:1px solid #eee;margin-right:10px;" />

####六、后台预览

<img src="http://down.iwshop.cn/iwshop_release/images/previews1.png" width="100%" />
<img src="http://down.iwshop.cn/iwshop_release/images/previews2.png" width="100%" />
<img src="http://down.iwshop.cn/iwshop_release/images/previews3.png" width="100%" />

## 相关下载

><a href="http://down.iwshop.cn/iwshop_release/iwshop-beta-0.9.0.zip" target="_blank">iwshop-beta-0.9.0.zip</a> 

><a href="http://down.iwshop.cn/iwshop_release/iwshop-beta-0.9.1.zip" target="_blank">iwshop-beta-0.9.1.zip</a> 

><a href="http://down.iwshop.cn/iwshop_release/iwshop-beta-0.9.2.zip" target="_blank">iwshop-beta-0.9.2.zip</a> 

><a href="http://down.iwshop.cn/iwshop_release/iwshop-beta-0.9.3.zip" target="_blank">iwshop-beta-0.9.3.zip</a> 

><a href="http://down.iwshop.cn/iwshop_release/iwshop-beta-0.9.4.zip" target="_blank">iwshop-beta-0.9.4.zip</a>