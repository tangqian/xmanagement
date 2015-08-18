# 后台通用模板工程帮助文档
# 该文档供后台开发人员使用
项目说明如下：

1.采用maven构建工程

2.系统采用spring+springMVC+mybatis架构,权限用到shiro框架

3.基本包目录com.gvtv.manage
base下存放后台系统的基础java类，包括系统用户、角色、权限等功能实现相关Class。
projectname存放业务相关java类，在新建一个项目时，将projectname包更名为实际的业务包名。

4.后台页面采用AdminLTE框架，该框架基于bootstrap
该框架的示例页面在svn的http://10.0.1.100/svn/bi_dept/02.code/trunk/bootstrap_template目录下。

在AdminLTE框架下，还加入了以下插件
Datatables(jquery表格插件)
DataTimePicker(Bootstrap日期和时间选择组件)
BootstrapDialog(Bootstrap弹出框插件)
iCheck(单选和复选框定制化插件)
zTree(树插件)

附注各个插件网上学习地址
zTree -- jQuery 树插件(http://www.ztree.me/v3/main.php)
bootstrap-datetimepicker官网(http://www.bootcss.com/p/bootstrap-datetimepicker/index.htm)
bootstrap3-dialog的github托管页(http://nakupanda.github.io/bootstrap3-dialog/)
iCheck官网(http://www.bootcss.com/p/icheck/)
Datatables中文网(http://dt.thxopen.com/index.html)
bootstrap官网(http://getbootstrap.com/getting-started/)






