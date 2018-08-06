<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <style type="text/css">
        .x-form-unit
        {
            height: 22px;
            line-height: 22px;
            padding-left: 2px;
            display: inline-block;
            display: inline;
        }
    </style>
    <!--ExtJs框架开始-->
    
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/ext/ext-all.js"></script>
     <script type="text/javascript" src="<%=request.getContextPath()%>/js/ext/states.js"></script>
   
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ext/ext-all.css" />
    <!--ExtJs框架结束-->
    
</head>
<body>
<div id="form-ct"></div>

</body>
<script type="text/javascript">
Ext.onReady(function () {
    //初始化标签中的Ext:Qtip属性。
    Ext.QuickTips.init();
    Ext.form.Field.prototype.msgTarget = 'side';

    //------------第一列内容开始-------------//
    //姓名
    var txtusername = new Ext.form.TextField({
        width: 230,
        allowBlank: false,
        maxLength: 4,
        name: 'username',
        fieldLabel: '姓名',
        blankText: '请输入姓名',
        maxLengthText: '姓名不能超过4个字符'
    });
    //政治面貌数据源
    var combostore = new Ext.data.ArrayStore({
        fields: ['id', 'name'],
        data: [[1, '团员'], [2, '党员'], [3, '其他']]
    });
    //政治面貌下拉列表
    var cobpolitical = new Ext.form.ComboBox({
        width: 230,
        allowBlank: false,
        fieldLabel: '政治面貌',
        store: combostore,
        displayField: 'name',
        valueField: 'id',
        triggerAction: 'all',
        emptyText: '请选择...',
        blankText: '请选择政治面貌',
        editable: false,
        mode: 'local'
    });
    //毕业院校
    var txtgraduateschool = new Ext.form.TextField({
        width: 230,
        allowBlank: false,
        maxLength: 10,
        name: 'graduateschool',
        fieldLabel: '毕业院校',
        blankText: '请输入毕业院校',
        maxLengthText: '毕业院校不能超过10个字符'
    });
    //通信地址
    var txtaddress = new Ext.form.TextField({
        width: 230,
        allowBlank: false,
        maxLength: 30,
        name: 'address',
        fieldLabel: '通信地址',
        blankText: '请输入通信地址',
        maxLengthText: '通信地址不能超过30个字符'
    });
    //第一列包含4行
    var column1 = {
        columnWidth: .28,
        layout: 'form',
        items: [
            txtusername, cobpolitical, txtgraduateschool, txtaddress
        ]
    };
    //------------第一列内容结束-------------//
    //------------第二列内容开始-------------//
    //性别
    var rdosex = new Ext.form.RadioGroup({
        fieldLabel: '性别',
        width: 230,
        style: 'padding-top:3px;height:17px;',
        items: [{ name: 'sex', inputValue: '0', boxLabel: '男', checked: true }, { name: 'sex', inputValue: '1', boxLabel: '女'}]
    });
    //身高
    var numheight = new Ext.form.NumberField({
        fieldLabel: '身高',
        width: 217,
        decimalPrecision: 0,
        minValue: 1,
        maxValue: 400,
        name: 'height',
        unitText: ' cm',
        allowBlank: false,
        blankText: '请输入身高'
    });
    //毕业专业
    var txtprofessional = new Ext.form.TextField({
        width: 230,
        allowBlank: false,
        maxLength: 30,
        name: 'professional',
        fieldLabel: '毕业专业',
        blankText: '请输入毕业专业',
        maxLengthText: '毕业专业不能超过30个字符'
    });
    //联系电话
    var txtphone = new Ext.form.TextField({
        width: 230,
        allowBlank: false,
        maxLength: 20,
        name: 'phone',
        fieldLabel: '联系电话',
        blankText: '请输入联系电话',
        maxLengthText: '联系电话不能超过20个字符'
    });
    //第二列包含4行
    var column2 = {
        columnWidth: .28,
        layout: 'form',
        items: [rdosex, numheight, txtprofessional, txtphone]
    };
    //------------第二列内容结束-------------//
    //------------第三列内容开始-------------//
    //年龄
    var numage = new Ext.form.NumberField({
        fieldLabel: '年龄',
        width: 217,
        decimalPrecision: 0,
        minValue: 1,
        maxValue: 60,
        name: 'age',
        unitText: ' 岁',
        allowBlank: false,
        blankText: '请输入年龄'
    });
    //体重
    var numweight = new Ext.form.NumberField({
        fieldLabel: '体重',
        width: 217,
        decimalPrecision: 0,
        minValue: 1,
        maxValue: 300,
        name: 'age',
        unitText: ' kg',
        allowBlank: false,
        blankText: '请输入体重'
    });
    //毕业日期
    var dategraduation = new Ext.form.DateField({
        fieldLabel: '毕业日期',
        name: 'graduationdate',
        width: 217,
        format: 'Y-m-d',
        editable: false,
        allowBlank: false,
        blankText: '请选择毕业日期'
    });
    //第三列包含3行
    var column3 = {
        columnWidth: .25,
        layout: 'form',
        items: [numage, numweight, dategraduation]
    };
    //------------第三列内容结束-------------//
    //------------第四列内容开始-------------//
    //创建div组件
    
    //招聘来源
    var checksource = new Ext.form.CheckboxGroup({
        fieldLabel: '招聘来源',
        style: 'padding-top:3px;height:17px;',
        items: [{
            boxLabel: '报纸招聘',
            inputValue: '0'
        }, {
            boxLabel: '校园招聘',
            inputValue: '1'
        }, {
            boxLabel: '人才市场',
            inputValue: '2'
        }, {
            boxLabel: '招聘网站',
            inputValue: '3'
        }]
    });
    //创建文本上传域
    var exteditor = new Ext.form.HtmlEditor({
        fieldLabel: '其他信息',
        width: 745,
        height: 320
    });
    //表单
    var form = new Ext.form.FormPanel({
        frame: true,
        title: '员工信息表',
        style: 'margin:10px',
        labelWidth: 70,
        buttonAlign: 'center',
        items: [{
            layout: 'column',
            items: [
                column1,
                column2,
                column3
              
            ]
        }, checksource,
            exteditor
        ],
        buttons: [{
            text: '保存',
            handler: function () { alert('保存方法!') }
        }, {
            text: '重置',
            handler: function () { alert('重置方法!') }
        }]
    });
    //窗体
    var win = new Ext.Window({
        title: '窗口',
        width: 900,
        height: 580,
        resizable: true,
        modal: true,
        closable: true,
        maximizable: true,
        minimizable: true,
        buttonAlign: 'center',
        items: form
    });
    win.show();

});
</script>
</html>