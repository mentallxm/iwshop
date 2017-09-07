{include file='../__header_v2.tpl'}

<div class="pd15" ng-controller="userBalanceRecordController" ng-app="ngApp">

    {literal}
        <div class="pheader clearfix">
            <div class="pull-left">
                <div id="SummaryBoard" style="width:300px">
                    <div class="row">
                        <div class="col-xs-9">
                            <div class="input-group">
                                <div class="input-group-btn">
                                    <ul class="dropdown-menu small" id="search-type">
                                        <li><a href="#" data-type="0">订单号</a></li>
                                    </ul>
                                </div>
                                <input type="text" style="height: 32px;" class="form-control search-field"
                                       placeholder="请输入搜索内容"
                                       aria-describedby="sizing-addon3" id="search-key"/>

                                <div class="input-group-btn">
                                    <button type="button" id="search-button" class="btn btn-default"><span
                                                class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="pull-right">
                <div class="button-set">
                    <button type="button" class="btn btn-default" id="list-reload" ng-click="fnGetList()">
                        <span class="glyphicon glyphicon-repeat" aria-hidden="true"></span>刷新
                    </button>
                </div>
            </div>
        </div>
        <div class="panel panel-default" style="margin-bottom: 60px;">
            <table class="table table-hover table-bordered table-fixed">
                <thead>
                <tr>
                    <th width="50px"></th>
                    <th width="130px">订单编号</th>
                    <th>姓名</th>
                    <th>电话</th>
                    <th>地区</th>
                    <th>订单金额</th>
                    <th>运费</th>
                    <th>商品数量</th>
                    <th>下单时间</th>
                    <th width="50px">状态</th>
                    <th width="92px">操作</th>
                </tr>
                </thead>
                <tbody>
                <tr ng-repeat="order in orderList" ng-if="listcount > 0">
                    <td class="text-center">
                        <img class="img-rounded" width="35px" height="35px"
                             ng-src="{{order.data.catimg}}@1e_1c_0o_0l_35h_35w_90q.src"/>
                    </td>
                    <td class="breakTd" ng-bind="order.serial_number"></td>
                    <td ng-bind="order.address.user_name"></td>
                    <td ng-bind="order.address.tel_number"></td>
                    <td class="breakTd" ng-bind="::order.address.province + order.address.city"></td>
                    <td class="text-danger" ng-bind="::'&yen;'+order.order_amount"></td>
                    <td class="text-danger" ng-bind="::'&yen;'+order.order_expfee"></td>
                    <td ng-bind="::order.product_count + '件'"></td>
                    <td ng-bind="::order.order_time"></td>
                    <td class="orderstatus {{order.status}}" ng-bind="::order.statusX"></td>
                    <td>
                        <a class="text-success" data-toggle="modal" data-target="#modal_order_view"
                           data-id="{{order.order_id}}" href="#">查看</a>
                        <a class="text-muted" data-toggle="modal" data-target="#modal_order_viewexpress"
                           data-com="{{order.express_com}}" data-code="{{order.express_code}}"
                           data-id="{{order.order_id}}" href="#">物流</a>
                        <a class="text-danger" data-toggle="modal" data-target="#modal_order_delete"
                           data-order_id="{{order.order_id}}" href="#">删除</a>
                    </td>
                </tr>
                <tr ng-if="listcount == 0">
                    <td colspan="11" class="EmptyTd">暂无数据</td>
                </tr>
                </tbody>
            </table>
        </div>
    {/literal}

</div>

<div class="navbar-fixed-bottom bottombar">
    <div id="pager-bottom">
        <ul class="pagination-sm pagination"></ul>
    </div>
</div>

<script type="text/javascript" src="static/script/Wdmin/user/user_balance_record_controller.js"></script>

{include file='../__footer_v2.tpl'}