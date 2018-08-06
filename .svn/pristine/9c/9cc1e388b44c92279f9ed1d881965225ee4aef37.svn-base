$(function () {

    //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();

    //2.初始化Button的点击事件
    var oButtonInit = new ButtonInit();
    oButtonInit.Init();

});


var TableInit = function () {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#tb_departments').bootstrapTable({
        	
        	method:'POST',
            dataType:'json',
            contentType: "application/x-www-form-urlencoded",
            cache: false,
            striped: true,                              //是否显示行间隔色
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
            url:'showindf.do',
            height: $(window).height() - 110,
            width:$(window).width(),
            showColumns:true,
            pagination:true,
            
            minimumCountColumns:2,
            pageNumber:1,        //初始化加载第一页，默认第一页
            pageSize: 20,            //每页的记录行数（*）
            pageList: [10, 25, 50, 100],       //可供选择的每页的行数（*）
            uniqueId: "id",      //每一行的唯一标识，一般为主键列
            showExport: true,                    
            exportDataType: 'all',
            
            columns: [
            {
                field: '',
                        title: 'Sort No.',
                        formatter: function (value, row, index) {
                        return index+1;
                 }
            },
            {
                field : 'id',
                title : 'User ID',
                align : 'center',
                valign : 'middle',
                sortable : true
            }]
        });
    };

    //得到查询的参数
    oTableInit.queryParams = function (params) {
        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            limit: params.limit,   //页面大小
            offset: params.offset,  //页码
            departmentname: $("#txt_search_departmentname").val(),
            statu: $("#txt_search_statu").val()
        };
        return temp;
    };
    return oTableInit;
};


var ButtonInit = function () {
    var oInit = new Object();
    var postdata = {};

    oInit.Init = function () {
        //初始化页面上面的按钮事件
    };

    return oInit;
};