<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<title>404错误 - Ace管理后台</title>
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

<script type="text/javascript">
	var scripts = [null, null]
	$('.page-content-area').ace_ajax('loadScripts', scripts, function() {
	});
</script>