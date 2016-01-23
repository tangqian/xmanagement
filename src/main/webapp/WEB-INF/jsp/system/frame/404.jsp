<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="breadcrumbs" id="breadcrumbs">
	<script type="text/javascript">
		try {
			ace.settings.check('breadcrumbs', 'fixed')
		} catch (e) {
		}
	</script>

	<ul class="breadcrumb">
		<li><i class="ace-icon fa fa-home home-icon"></i> <a href="./">主页</a>
		</li>
		<li class="active">404错误</li>
	</ul>
	<!-- /.breadcrumb -->
</div>

<div class="page-content">

	<div class="error-page">
		<h2 class="headline text-yellow">404</h2>
		<div class="error-content" style="padding-top: 30px;">
			<h3>
				<i class="fa fa-warning text-yellow"></i> 对不起! 页面未找到。
			</h3>
			<p>
				找不到你请求的页面 . 你可以<a href='./'>返回主页</a>
			</p>
		</div>
		<!-- /.error-content -->
	</div>
</div>