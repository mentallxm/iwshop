<?php

// 微信模板消息配置
// 相关文档：https://mp.weixin.qq.com/advanced/tmplmsg?action=faq&token=991825086&lang=zh_CN

return array(
    // 下单成功
    'pay_success' => array(
        // 模板ID
        'tpl_id' => 'na5UrfqHLehpWT_PX9gDE3-1FVMxMFBmahjzAsR0qpE',
        // 模板顶部文字key，默认first
        'first_key' => 'first',
        // 订单序列号key
        'serial_key' => 'keyword3',
        // 商品名称key
        'product_name_key' => 'keyword1',
        // 商品数量key
        'product_count_key' => 'keyword5',
        // 订单金额key
        'order_amount_key' => 'keyword2',
        // 模板底部文字key
        'remark_key' => 'remark'
    ),
    // 订单取消
    'cancel_order' => array(
        // 模板ID
        'tpl_id' => '',
        // 模板顶部文字key，默认first
        'first_key' => 'first',
        // 订单序列号key
        'serial_key' => '',
        // 商品名称key
        'product_name_key' => '',
        // 商品数量key
        'product_count_key' => '',
        // 订单金额key
        'order_amount_key' => '',
        // 模板底部文字key
        'remark_key' => 'remark'
    ),
    // 快递发货 [订单发货提醒 - T科技 - 互联网|电子商务 ] OPENTM200565259
    'exp_notify' => array(
        // 模板ID
        'tpl_id' => '0Ea98la4ufZ4bs8D-6oQx4CGO08MZzSIfFbZyl_H3aQ',
        // 模板顶部文字key，默认first
        'first_key' => 'first',
        // 订单序列号key
        'serial_key' => 'keyword1',
        // 快递公司名称key
        'expname' => 'keyword2',
        // 快递单号key
        'expcode' => 'keyword3',
        // 模板底部文字key
        'remark_key' => 'remark'
    ),
    // 快递发货提醒
    'exp_staff_notify' => array(
        // 模板ID
        'tpl_id' => '',
        // 模板顶部文字key，默认first
        'first_key' => 'first',
        // 订单序列号key
        'serial_key' => '',
        // 快递公司名称key
        'expname' => '',
        // 快递单号key
        'expcode' => '',
        // 模板底部文字key
        'remark_key' => 'remark'
    ),
    // 代理审核通过通知
    'company_reg_notify' => array(
        // 模板ID
        'tpl_id' => '',
        // 模板顶部文字key，默认first
        'first_key' => 'first',
        // 申请人名称
        'username' => 'keyword1',
        // 审核结果
        'result' => 'keyword2',
        // 模板底部文字key
        'remark_key' => 'remark'
    ),
    // 充值成功通知
    'deposit_notify' => array(
        // 模板ID
        'tpl_id' => '8vziZ7Q0lvFNJiVwR6WRgSXyNHxGQq6_erjRjTUSi_U',
        // 模板顶部文字key，默认first
        'first_key' => 'first',
        // 充值金额
        'deposit_amount' => 'keyword1',
        // 充值时间
        'deposit_time' => 'keyword2',
        // 账户余额
        'balance' => 'keyword3',
        // 模板底部文字key
        'remark_key' => 'remark'
    ),
    // 返佣到账通知
    'rebate_success' => array(
        // 模板ID
        'tpl_id' => 'NIYnqpfKPeyD7o455LhMwl4FySMlX2ojQVsZShO2RM4',
        // 模板顶部文字key，默认first
        'first_key' => 'first',
        // 返佣金额
        'rebate_amount' => 'keyword1',
        // 到帐时间
        'rebate_time' => 'keyword2',
        // 模板底部文字key
        'remark_key' => 'remark'
    )

);

