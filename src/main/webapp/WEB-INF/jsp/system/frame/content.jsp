<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Content Header (Page header) -->
<section class="content-header">
	<ol class="breadcrumb">
		<li class="active"><i class="fa fa-dashboard"></i> 主页</li>
	</ol>
</section>

<!-- Main content -->
<section class="content">

	<!-- =========================================================== -->

	<!-- Direct Chat -->
	<div class="row">
		<div class="col-md-3">
			<!-- DIRECT CHAT PRIMARY -->
			<div class="box box-primary direct-chat direct-chat-primary">
				<div class="box-header with-border">
					<h3 class="box-title">消息框</h3>
					<div class="box-tools pull-right">
						<span data-toggle="tooltip" title="3 New Messages"
							class='badge bg-light-blue'>3</span>
						<button class="btn btn-box-tool" data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
						<button class="btn btn-box-tool" data-toggle="tooltip"
							title="Contacts" data-widget="chat-pane-toggle">
							<i class="fa fa-comments"></i>
						</button>
						<button class="btn btn-box-tool" data-widget="remove">
							<i class="fa fa-times"></i>
						</button>
					</div>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<!-- Conversations are loaded here -->
					<div class="direct-chat-messages">
						<!-- Message. Default to the left -->
						<div class="direct-chat-msg">
							<div class='direct-chat-info clearfix'>
								<span class='direct-chat-name pull-left'>Alexander Pierce</span>
								<span class='direct-chat-timestamp pull-right'>23 Jan
									2:00 pm</span>
							</div>
							<!-- /.direct-chat-info -->
							<img class="direct-chat-img"
								src="${pageContext.request.contextPath}/static/AdminLTE/dist/img/user1-128x128.jpg"
								alt="message user image" />
							<!-- /.direct-chat-img -->
							<div class="direct-chat-text">明天放假吗?</div>
							<!-- /.direct-chat-text -->
						</div>
						<!-- /.direct-chat-msg -->

						<!-- Message to the right -->
						<div class="direct-chat-msg right">
							<div class='direct-chat-info clearfix'>
								<span class='direct-chat-name pull-right'>Sarah Bullock</span> <span
									class='direct-chat-timestamp pull-left'>23 Jan 2:05 pm</span>
							</div>
							<!-- /.direct-chat-info -->
							<img class="direct-chat-img"
								src="${pageContext.request.contextPath}/static/AdminLTE/dist/img/user3-128x128.jpg"
								alt="message user image" />
							<!-- /.direct-chat-img -->
							<div class="direct-chat-text">放假,都出通知了!</div>
							<!-- /.direct-chat-text -->
						</div>
						<!-- /.direct-chat-msg -->
					</div>
					<!--/.direct-chat-messages-->

					<!-- Contacts are loaded here -->
					<div class="direct-chat-contacts">
						<ul class='contacts-list'>
							<li><a href='#'> <img class='contacts-list-img'
									src='${pageContext.request.contextPath}/static/AdminLTE/dist/img/user1-128x128.jpg' />
									<div class='contacts-list-info'>
										<span class='contacts-list-name'> Count Dracula <small
											class='contacts-list-date pull-right'>2/28/2015</small>
										</span> <span class='contacts-list-msg'>How have you been? I
											was...</span>
									</div> <!-- /.contacts-list-info -->
							</a></li>
							<!-- End Contact Item -->
						</ul>
						<!-- /.contatcts-list -->
					</div>
					<!-- /.direct-chat-pane -->
				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<form action="#" method="post">
						<div class="input-group">
							<input type="text" name="message" placeholder="Type Message ..."
								class="form-control" /> <span class="input-group-btn">
								<button type="button" class="btn btn-primary btn-flat">发送</button>
							</span>
						</div>
					</form>
				</div>
				<!-- /.box-footer-->
			</div>
			<!--/.direct-chat -->
		</div>
		<!-- /.col -->

	</div>
	<!-- /.row -->

</section>
<!-- /.content -->