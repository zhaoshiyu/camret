<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.dropdown-menu {
	min-width: 120px;
}

.pull-center.btn.btn-sm.btn-primary {
	width: 140px;
}
</style>

<div id="navbar" class="navbar navbar-default">
	<script type="text/javascript">
		try {
			ace.settings.check('navbar', 'fixed')
		} catch (e) {
		}
	</script>

	<div class="navbar-container" id="navbar-container">
		<button type="button" class="navbar-toggle menu-toggler pull-left"
			id="menu-toggler" data-target="#sidebar">
			<span class="sr-only">Toggle sidebar</span> <span class="icon-bar"></span>

			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>

		<div class="navbar-header pull-left">
			<a href="/index" class="navbar-brand"> <small> <i
					class="fa fa-leaf"></i> 首页
			</small>
			</a>
		</div>
		
		<div class="navbar-buttons navbar-header pull-right" role="navigation">
		<c:if test="${not empty pageContext.request.remoteUser}">
			<ul class="nav ace-nav">
				<li class="grey"><a data-toggle="dropdown"
					class="dropdown-toggle" href="#"> <i
						class="ace-icon fa fa-tasks"></i> <span class="badge badge-grey">4</span>
				</a>

					<ul
						class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
						<li class="dropdown-header"><i class="ace-icon fa fa-check"></i>
							4 Tasks to complete</li>

						<li class="dropdown-content">
							<ul class="dropdown-menu dropdown-navbar">
								<li><a href="#">
										<div class="clearfix">
											<span class="pull-left">Software Update</span> <span
												class="pull-right">65%</span>
										</div>

										<div class="progress progress-mini">
											<div style="width: 65%" class="progress-bar"></div>
										</div>
								</a></li>

								<li><a href="#">
										<div class="clearfix">
											<span class="pull-left">Hardware Upgrade</span> <span
												class="pull-right">35%</span>
										</div>

										<div class="progress progress-mini">
											<div style="width: 35%"
												class="progress-bar progress-bar-danger"></div>
										</div>
								</a></li>

								<li><a href="#">
										<div class="clearfix">
											<span class="pull-left">Unit Testing</span> <span
												class="pull-right">15%</span>
										</div>

										<div class="progress progress-mini">
											<div style="width: 15%"
												class="progress-bar progress-bar-warning"></div>
										</div>
								</a></li>

								<li><a href="#">
										<div class="clearfix">
											<span class="pull-left">Bug Fixes</span> <span
												class="pull-right">90%</span>
										</div>

										<div class="progress progress-mini progress-striped active">
											<div style="width: 90%"
												class="progress-bar progress-bar-success"></div>
										</div>
								</a></li>
							</ul>
						</li>

						<li class="dropdown-footer"><a href="#"> See tasks with
								details <i class="ace-icon fa fa-arrow-right"></i>
						</a></li>
					</ul></li>

				<li class="purple"><a data-toggle="dropdown"
					class="dropdown-toggle" href="#"> <i
						class="ace-icon fa fa-bell icon-animated-bell"></i> <span
						class="badge badge-important">8</span>
				</a>

					<ul
						class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
						<li class="dropdown-header"><i
							class="ace-icon fa fa-exclamation-triangle"></i> 8 Notifications
						</li>

						<li class="dropdown-content">
							<ul class="dropdown-menu dropdown-navbar navbar-pink">
								<li><a href="#">
										<div class="clearfix">
											<span class="pull-left"> <i
												class="btn btn-xs no-hover btn-pink fa fa-comment"></i> New
												Comments
											</span> <span class="pull-right badge badge-info">+12</span>
										</div>
								</a></li>

								<li><a href="#"> <i
										class="btn btn-xs btn-primary fa fa-user"></i> Bob just signed
										up as an editor ...
								</a></li>

								<li><a href="#">
										<div class="clearfix">
											<span class="pull-left"> <i
												class="btn btn-xs no-hover btn-success fa fa-shopping-cart"></i>
												New Orders
											</span> <span class="pull-right badge badge-success">+8</span>
										</div>
								</a></li>

								<li><a href="#">
										<div class="clearfix">
											<span class="pull-left"> <i
												class="btn btn-xs no-hover btn-info fa fa-twitter"></i>
												Followers
											</span> <span class="pull-right badge badge-info">+11</span>
										</div>
								</a></li>
							</ul>
						</li>

						<li class="dropdown-footer"><a href="#"> See all
								notifications <i class="ace-icon fa fa-arrow-right"></i>
						</a></li>
					</ul></li>

				<li class="green"><a data-toggle="dropdown"
					class="dropdown-toggle" href="#"> <i
						class="ace-icon fa fa-envelope icon-animated-vertical"></i> <span
						class="badge badge-success">5</span>
				</a>

					<ul
						class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
						<li class="dropdown-header"><i
							class="ace-icon fa fa-envelope-o"></i> 5 Messages</li>

						<li class="dropdown-content">
							<ul class="dropdown-menu dropdown-navbar">
								<li><a href="#" class="clearfix"> <img
										src="/bootstrap/assets/avatars/avatar.png"
										class="msg-photo" alt="Alex's Avatar" /> <span
										class="msg-body"> <span class="msg-title"> <span
												class="blue">Alex:</span> Ciao sociis natoque penatibus et
												auctor ...
										</span> <span class="msg-time"> <i
												class="ace-icon fa fa-clock-o"></i> <span>a moment
													ago</span>
										</span>
									</span>
								</a></li>

								<li><a href="#" class="clearfix"> <img
										src="/bootstrap/assets/avatars/avatar3.png"
										class="msg-photo" alt="Susan's Avatar" /> <span
										class="msg-body"> <span class="msg-title"> <span
												class="blue">Susan:</span> Vestibulum id ligula porta felis
												euismod ...
										</span> <span class="msg-time"> <i
												class="ace-icon fa fa-clock-o"></i> <span>20 minutes
													ago</span>
										</span>
									</span>
								</a></li>

								<li><a href="#" class="clearfix"> <img
										src="/bootstrap/assets/avatars/avatar4.png"
										class="msg-photo" alt="Bob's Avatar" /> <span
										class="msg-body"> <span class="msg-title"> <span
												class="blue">Bob:</span> Nullam quis risus eget urna mollis
												ornare ...
										</span> <span class="msg-time"> <i
												class="ace-icon fa fa-clock-o"></i> <span>3:15 pm</span>
										</span>
									</span>
								</a></li>

								<li><a href="#" class="clearfix"> <img
										src="/bootstrap/assets/avatars/avatar2.png"
										class="msg-photo" alt="Kate's Avatar" /> <span
										class="msg-body"> <span class="msg-title"> <span
												class="blue">Kate:</span> Ciao sociis natoque eget urna
												mollis ornare ...
										</span> <span class="msg-time"> <i
												class="ace-icon fa fa-clock-o"></i> <span>1:33 pm</span>
										</span>
									</span>
								</a></li>

								<li><a href="#" class="clearfix"> <img
										src="/bootstrap/assets/avatars/avatar5.png"
										class="msg-photo" alt="Fred's Avatar" /> <span
										class="msg-body"> <span class="msg-title"> <span
												class="blue">Fred:</span> Vestibulum id penatibus et auctor
												...
										</span> <span class="msg-time"> <i
												class="ace-icon fa fa-clock-o"></i> <span>10:09 am</span>
										</span>
									</span>
								</a></li>
							</ul>
						</li>

						<li class="dropdown-footer"><a href="inbox.html"> See all
								messages <i class="ace-icon fa fa-arrow-right"></i>
						</a></li>
					</ul></li>

				<li class="light-blue"><a data-toggle="dropdown" href="#"
					class="dropdown-toggle"> 
					<!-- <i class="btn btn-xs btn-primary fa fa-user"></i>  -->
						<img class="nav-user-photo" src="/bootstrap/assets/avatars/user.jpg" alt="Jason's Photo" />
						<span class="user-info"> <small>Welcome,</small> 
						<c:out value="${pageContext.request.remoteUser}" />
					</span> <i class="ace-icon fa fa-caret-down"></i>
				</a>

					<ul
						class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
						<li><a href="/camret/setting"> <i class="ace-icon fa fa-cog"></i>
								设置
						</a></li>

						<li><a href="/camret/profile"> <i
								class="ace-icon fa fa-user"></i> 个人中心
						</a></li>

						<li class="divider"></li>

						<!-- <li>
						<a href="/logout" class="a_post"> <i class="ace-icon fa fa-power-off"></i>
								Logout
						</a>
						</li> -->
						<li>
						<a>
							<form action="/logout" method="post">
								<button type="submit" class="width-160 pull-center btn btn-sm btn-primary" >
									<i class="ace-icon fa fa-power-off pull-left bigger-150"></i>
									<span class="bigger-110" >退出</span>
								</button>
							</form>
							</a>
						</li>
					</ul>
					</li>
			</ul>
			</c:if>
			
			
			
			<c:if test="${empty pageContext.request.remoteUser}">
			<div class="toolbar-login-register clearfix"> 
				<ul class="nav ace-nav">
				<li class="green">
						<a href="/login">  <!--  data-target="login#login-box" class="back-to-login-link" -->
							<i class="ace-icon fa fa-key"></i> 
							<span class="badge">登录</span>
							<%-- <c:param name="active" value="login" /> --%>
						</a>
					</li>
					<li class="grey">
						<a href="/register"> <!-- data-target="login#signup-box" class="user-signup-link" --> 
							<i class="ace-icon fa fa-users"></i> 
							<span class="badge">注册</span>
							<%-- <c:param name="active" value="register" /> --%>
						</a>
					</li>
				</ul>
				</div>
			</c:if>
		</div>
	
	</div>
	<!-- /.navbar-container -->
</div>

<script type="text/javascript">
jQuery(function($) {
	 $(document).on('click', '.toolbar-login-register a[data-target]', function(e) {
		e.preventDefault();
		var target = $(this).data('target');
		$('.widget-box.visible').removeClass('visible');//hide others
		$(target).addClass('visible');//show target
	 });
	});
	
/* $(".a_post").on("click",function(event){
    event.preventDefault();//使a自带的方法失效，即无法调整到href中的URL(http://www.baidu.com)
    $.ajax({
           type: "POST",
           url: "/logout",
           contentType:"application/json",
           data: JSON.stringify({param1:param1,param2:param2}),//参数列表
           dataType:"json",
           success: function(result){
              //请求正确之后的操作
           },
           error: function(result){
              //请求失败之后的操作
           }
    });
}); */
</script>

