<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div class="layout">
    <div class="block m-b">
        <div class="block_title">
            <h3>统计及明细报表</h3>
        </div>
        <div class="block_container">
            <div class="fieldset_border fieldset_bg m-b">
                <div class="legend_title">
                    <a href="#" class="container_show">查询条件</a>
                </div>
                <div class="fieldset_container">
                    <form method="post" action="" id="searchForm" name="searchForm">
                        <table class="table_form">
                            <tr>
                                <th><span style="margin-left:50px"></span><em>*</em>查询开始日期：</th>
                                <td><input name="startTime" id="startTime" value=""
                                           class="Wdate width_time2"
                                           onclick="WdatePicker({doubleCalendar:false,dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-{%d-1}'})"></td>

                                <th><span style="margin-left:100px"></span>查询网点:</th>
                                <td>
                                    <input type="hidden" name="tabIndex" id="tabIndex" />
                                    <input type="hidden" name="records" id="records" />
                                    <input type="hidden" name="orgCode" id="orgCode" />
                                    <input class="width_c" type="text" name="orgName" id="orgName" /></td>
                            </tr>
                            <tr>
                                <th><span style="margin-left:50px"></span><em>*</em>查询结束日期：</th>
                                <td><input name="endTime" id="endTime" value=""
                                           class="Wdate width_time2"
                                           onclick="WdatePicker({doubleCalendar:false,dateFmt:'yyyy-MM-dd',minDate:$('#startTime').val(),maxDate:'%y-%M-{%d-1}'})"></td>
                            </tr>
                        </table>
                    </form>
                    <div class="btn_layout">
                        <a id="search" class="easyui-linkbutton l-btn" href="#"><span
                                class="l-btn-left"><span class="l-btn-text icon-find">${r'${app:i18n("global.jsp.search")}'}</span></span></a>
                        <a id="export" class="easyui-linkbutton l-btn" href="#"><span
                                class="l-btn-left"><span class="l-btn-text icon-find">${r'${app:i18n("global.jsp.export")}'}</span></span></a>
                        <a id="reset" class="easyui-linkbutton l-btn" href="#"><span
                                class="l-btn-left"><span class="l-btn-text icon-reset">${r'${app:i18n("global.jsp.reset")}'}</span></span></a>
                    </div>
                </div>
            </div>
            <div id="tabs" class="tabs">
                <ul>
                    <li><a id="tab-0" href="#tabD0">统计汇总</a></li>
                    <li><a id="tab-1" href="#tabD1">统计明细</a></li>
                </ul>
                <div id="tabD0">
                    <table id="${entity.className?uncap_first}SumGrid"></table>
                    <div id="${entity.className?uncap_first}SumPager"></div>
                </div>
                <div id="tabD1">
                    <table id="${entity.className?uncap_first}DetailGrid"></table>
                    <div id="${entity.className?uncap_first}DetailPager"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<c:url value='/js/exp/expCommon.js' />"></script>
<script src="<c:url value='/js/exp/rptCommon.js'/>"></script>
<script type="text/javascript"
        src="<c:url context='/common' value='/js/common/jquery.gridUtil.js'/>"></script>
<script type="text/javascript"
        src="<c:url context='/common' value='/js/common/jquery.YTOUtil.js'/>"></script>
<script src="<c:url value='/js/stmt/${entity.className?uncap_first}.js'/>"></script>
