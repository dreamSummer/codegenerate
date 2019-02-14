<template>
    <div class="yto">
        <el-row>
            <el-col :span="24">
                <breadcrumb>统计报表</breadcrumb>
            </el-col>
        </el-row>
        <el-row>
            <el-col :span="21" :lg="22">
                <el-form :inline="true" :model="obj" class="demo-form-inline">

                    <el-form-item label="维度">
                        <el-select v-model="obj.queryType" style="width:100px;">
                            <el-option
                                    v-for="item in selectData"
                                    :key="item.value"
                                    :label="item.label"
                                    :value="item.value">
                            </el-option>
                        </el-select>
                    </el-form-item>

                    <el-form-item label="查询日期">
                        <div v-if="obj.queryType === 'total'">
                            <el-select v-model="obj.dateType" style="width:80px;">
                                <el-option label="日" value="date"></el-option>
                                <el-option label="周" value="week"></el-option>
                                <el-option label="月" value="month"></el-option>
                            </el-select>
                            <el-date-picker
                                    v-model="sumTime"
                                    :type="obj.dateType"
                                    :format="format"
                                    :clearable="false"
                                    :editable="false"
                                    placeholder="选择时间"
                                    :picker-options="pickerOptions_sum">
                            </el-date-picker>
                        </div>
                        <el-date-picker
                                v-model="DetTime"
                                type="daterange"
                                :clearable="false"
                                :editable="false"
                                :picker-options="pickerOptions_det"
                                placeholder="选择日期" v-else>
                        </el-date-picker>
                    </el-form-item>

                    <el-form-item label="查询网点">
                        <yto-search ref="ytoSearch" v-model="obj.orgName"
                                    @handleSelect="setOrgCode"></yto-search>
                    </el-form-item>

                    <el-form-item>
                        <el-button type="primary" :loading="loading" icon="el-icon-search" @click="queryData">查询
                        </el-button>
                        <el-button type="plain" :loading="loading" icon="el-icon-download" @click="exportData">导出
                        </el-button>
                    </el-form-item>
                </el-form>
            </el-col>
        </el-row>

        <div class="yto-box">
            <el-row>
                <el-col :span="24" v-loading="tableLoading">
                    <el-table
                            :data="tableTotal"
                            emptyText="暂无明细数据"
                            @cell-dblclick="cellClick"
                            @sort-change="sortChange" v-if="obj.queryType === 'total'">
                        <el-table-column
                                :key="index"
                                align="center"
                                :prop="item.prop"
                                :label="item.label"
                                v-for="(item, index) in tableTotalHead"
                                :sortable="item.sortable ? 'custom': false"
                                :click="item.click"
                                :class-name="item.className"
                                v-if="item.show">
                        </el-table-column>
                    </el-table>
                    <el-table
                            :data="tableDetail"
                            emptyText="暂无明细数据"
                            @sort-change="sortChange"
                            v-if="obj.queryType === 'detail'">
                        <el-table-column
                                :key="index"
                                align="center"
                                :prop="item.prop"
                                :label="item.label"
                                v-for="(item, index) in newTableDetailHead"
                                :sortable="item.sortable ? 'custom': false"
                                v-if="item.show">
                        </el-table-column>
                    </el-table>
                </el-col>
                <el-col>
                    <yto-page :data="pageMap" @current-change="currentChange">
                    </yto-page>
                </el-col>
            </el-row>
        </div>
    </div>
</template>

${r"<script>"}
    import Breadcrumb from '@/components/Breadcrumb/index';
    import {FormatDate, iframeAutoH, getLastDay} from '@/components/date';
    import { query${entity.sumBeanName}API, query${entity.detBeanName}API, ${r"export"}${entity.model}  } from '@/service';

    const endDate = FormatDate( new Date(), -1);
    let lastForm = {};
    export default {
        components: {
            Breadcrumb
        },
        data() {
            return {
                selectData: [{
                    label: '汇总',
                    value: 'total'
                }, {
                    label: '明细',
                    value: 'detail'
                }],
                pickerOptions_sum: {
                    disabledDate(time) {
                        const start = new Date();
                        start.setTime(new Date().getTime() - 3600 * 1000 * 24 * 1);
                        return time.getTime() > start;
                    },
                    firstDayOfWeek: 1
                },
                pickerOptions_det: {
                    disabledDate(time) {
                        const start = new Date();
                        start.setTime(new Date().getTime() - 3600 * 1000 * 24 * 1);
                        return time.getTime() > start;
                    },
                    firstDayOfWeek: 1,
                },
                loading: false,
                tableLoading: false,
                tableTotal: [],
                TableTotalHead: [],
                TableDetail: [],
                TableDetailHead: [],
                pageMap: {
                    total: 0,
                    pageNum: 1,
                    pageSize: 20
                },
                sumTime: endDate,
                detTime: [endDate, endDate],
                format: 'yyyy-MM-dd',
                obj: {
                    queryType: '',
                    dateType: '',
                    sumStartDate: '',
                    sumEndDate: '',
                    detStartDate: '',
                    detEndDate: '',
                    orgCode: '',
                    pageNum: 1,
                    pageSize: 20
                }
            };
        },
        watch: {
            'obj.queryType': {
                handler: function (val, oldVal) {
                    if (val === 'total' && oldVal === 'detail') {
                        if (this.sumTime === '') {
                            this.obj.sumStartDate = endDate;
                            this.obj.sumEndDate = endDate;
                         }
                        this.getTotalTableJson();
                    } else if (val === 'detail' && oldVal === 'total') {
                        if (this.detTime === '') {
                            this.obj.detStartDate = endDate;
                            this.obj.detEndDate = endDate;
                        }
                        this.detTime = [this.obj.detStartDate, this.obj.detEndDate];
                        this.getDetailTableJson();
                    }
                },
                deep: true
            },
        },
        created() {
        },
        mounted() {
        },
        methods: {
        }
    };

${r"</script>"}
