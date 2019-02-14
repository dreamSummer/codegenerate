$(function() {

    var start = getLastMonthYestdy(new Date);
    var end = getDayBefore(new Date(),1);
    $("#startTime").val(start);
    $("#endTime").val(end);
    var jqSum = $("#${entity.className?uncap_first}SumGrid");
    var jqDet = $("#${entity.className?uncap_first}DetailGrid");

    $("#search").click(function() {
        var start = $("#startTime").val();
        var end = $("#endTime").val();
        var tabIndex = $("#tabs").tabs('option', 'selected');
        var org = $("#orgName").val();

        if ("" == start || "" == end) {
            $.boxUtil.alert("时间查询不为空！");
            return;
        }else if((new Date(end).getTime() - new Date(start).getTime()) > 31 * 24 * 60 * 60 * 1000){
            $.boxUtil.alert("最大查询间隔为31天！");
            return;
        }

        var postData = {
            tabIndex : tabIndex,
            start : start,
            end : end,
        };

        if("" != org){
            postData.orgCode = $("#orgCode").val();
            postData.orgName = $("#orgName").val();
        }else{
            $("#orgCode").val("");
            $("#orgName").val("");
            postData.orgCode = "";
            postData.orgName = "";
        }

        if (0 == tabIndex) {
            jqSum.appendPostData(postData);
            jqSum.jqGrid('setGridParam', {
                url : "${entity.className?uncap_first}Search.action"
            }).trigger("reloadGrid");
        } else if (1 == tabIndex) {
            jqDet.appendPostData(postData);
            jqDet.jqGrid('setGridParam', {
                url : "${entity.className?uncap_first}Search.action"
            }).trigger("reloadGrid");
        }
    });


    $("#export").click(function() {
        var start = $("#startTime").val();
        var end = $("#endTime").val();
        var tabIndex = $("#tabs").tabs('option', 'selected');
        if ("" == start || "" == end) {
            $.boxUtil.alert("时间查询不为空！");
            return;
        }else if((new Date(end).getTime() - new Date(start).getTime()) > 31 * 24 * 60 * 60 * 1000){
            $.boxUtil.alert("最大查询间隔为31天！");
            return;
        }
        $("#tabIndex").val(tabIndex);
        if(0 == tabIndex){
            var records = jqSum.getGridParam("records");
            if (0 == records) {
                $.boxUtil.warn("结果集为空，不能导出！", {title : '提示'}, function() {});
            return;
        } else {
            $("#records").val(records);
            $.boxUtil.confirm("确定要导出吗?", {title : '确认'}, function() {
                jqSum.gridUtil().exportGridExcel($("#searchForm"), {
                url : "${entity.className?uncap_first}Export.action"});});
            }
        }else if(1 == tabIndex){
            var records = jqDet.getGridParam("records");
            if (0 == records) {
            $.boxUtil.warn("结果集为空，不能导出！", {title : '提示'}, function() {});
            return;
        } else {
            $("#records").val(records);
            $.boxUtil.confirm("确定要导出吗?", {title : '确认'}, function() {
                jqDet.gridUtil().exportGridExcel($("#searchForm"), {
                url : "${entity.className?uncap_first}Export.action"});});
            }
        }
    });

    $("#reset").click(function() {
            $("#startTime").val(start);
            $("#endTime").val(end);
            $("#orgCode").val("");
            $("#orgName").val("");
    });

    jqSum.gridUtil().simpleGrid({
            url : '',
            multiselect : false,
            autowidth : false,
            shrinkToFit: false,
            footerrow: true,
            userDataOnFooter: true,
            width : '920',
            colNames : [
                <#list entity.sumProperties as property>"${property.dbComments}"<#if property_has_next>, </#if></#list>
            ],
            colModel : [
                <#list entity.sumProperties as property>{
                    name : '${property.propertyName}',
                    index : '${property.propertyName}',
                    sortable : true,
                    align : 'center'
                }<#if property_has_next>, </#if></#list>
            ],
            pager : "#${entity.className?uncap_first}SumPager",
            ondblClickRow: function (id){
                var row = jqSum.jqGrid('getRowData',id);
                var start = $("#startTime").val();
                var end = $("#endTime").val();
                if (row != null){
                    $("#orgCode").val(row.${entity.sumQueryOrgCodeField});
                    jqDet.appendPostData({
                        tabIndex : 1,
                        start : start,
                        end : end,
                        orgCode : row.${entity.sumQueryOrgCodeField},
                    });
                    jqDet.clearGridData();  //清空
                    jqDet.jqGrid('setGridParam', {url : "${entity.className?uncap_first}Search.action" }).trigger("reloadGrid");
                    $("#tabs").tabs('select',1);
                }else {
                    return false;
                }
            }
        });
    jqSum.gridUtil().customizeColumn();

    jqDet.gridUtil().simpleGrid({
            url : '',
            multiselect : false,
            autowidth : false,
            shrinkToFit: false,
            footerrow: true,
            userDataOnFooter: true,
            width : '920',
            colNames : [
                <#list entity.properties as property>"${property.dbComments}"<#if property_has_next>, </#if></#list>
            ],
            colModel : [
                <#list entity.properties as property>{
                    name : '${property.propertyName}',
                    index : '${property.propertyName}',
                    sortable : true,
                    align : 'center'
                }<#if property_has_next>, </#if></#list>
            ],
            pager : "#${entity.className?uncap_first}DetailPager",
    });
    jqDet.gridUtil().customizeColumn();

    //查询区域显隐切换
    $(".legend_title a").toggle(function() {
        $(this).parent().next().hide();
        $(this).removeClass("container_show");
        $(this).addClass("container_hide");
    }, function() {
        $(this).parent().next().show();
        $(this).removeClass("container_hide");
        $(this).addClass("container_show");
    });

    //自动补全
    changeOrg("orgName", "orgCode", "", "");
});

    //自动补全有权限的网点查询
    function changeOrg(orgName, orgCode, topOrgCode, functions) {
        var inputOrgName = "#" + orgName;
        var getOrgCode = "#" + orgCode;
        $(inputOrgName).autocomplete({
            source: function (request, response) {
            $.ajax({
                    url: "../statement/orgStmtName.action",
                    type: "POST",
                    dataType: "json",
                    data: {
                        orgNames: $(inputOrgName).val(),
                        statusType:'NA' //查询所有转运中心,管区,分公司,分部数据
                    },
                    success: function (data) {
                        response($.map(data.orgNames, function (item) {
                            return {
                            label: item.orgCode + ' - ' + item.orgName,
                            value: item.orgCode + ' - ' + item.orgName,
                            orgName: item.orgName,
                            orgCode: item.orgCode
                        };
                    }));
                }
            });
        },
        select: function (event, ui) {
            $(getOrgCode).val(ui.item.orgCode);
            $(inputOrgName).val(ui.item.value);
        },
        change: function (event, ui) {
            try {
                if (ui.item == null || ui.item.value != $(inputOrgName).val()) {
                    $(getOrgCode).val("");
                    $(inputOrgName).val("");
                }
            } catch (err) {
                    $(getOrgCode).val("");
                    $(inputOrgName).val("");
            }
        },
        open: function () {
            $(this).removeClass("ui-corner-all").addClass("ui-corner-top");
        },
        close: function () {
            $(this).removeClass("ui-corner-top").addClass("ui-corner-all");
        }
    });
};