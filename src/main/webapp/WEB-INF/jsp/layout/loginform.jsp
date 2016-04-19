<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row" style="margin-top: 20px">
	<div class="col-sm-10 col-sm-offset-1">

		<div class="login-container">
			<div class="center">
				<h1>

					<span class="white" id="id-text2">XX平台</span>
				</h1>
				<h4 class="blue" id="id-company-text">&copy; Zhao Shiyu</h4>
			</div>

			<div class="space-6"></div>

			<div class="position-relative">
				<div id="login-box" class="login-box visible widget-box no-border">
					<div class="widget-body">
						<div class="widget-main">
							<h4 class="header blue lighter bigger">
								<i class="ace-icon fa fa-coffee green"></i> 请输入你的登录信息
							</h4>

							<div class="space-6"></div>

							<form action="/j_spring_security_check" method="post">
								<fieldset>
									<label class="block clearfix"> <span
										class="block input-icon input-icon-right"> <input
											type="text" class="form-control" name="j_username"
											placeholder="邮箱" /> <i class="ace-icon fa fa-envelope"></i>
									</span>
									</label> <label class="block clearfix"> <span
										class="block input-icon input-icon-right"> <input
											type="password" class="form-control" name="j_password"
											placeholder="密码" /> <i class="ace-icon fa fa-lock"></i>
									</span>
									</label>

									<div class="space"></div>

									<div class="clearfix">
										<label class="inline"> <input type="checkbox"
											class="ace" /> <span class="lbl"> 记住我</span>
										</label> 

										<button type="submit"
											class="width-35 pull-right btn btn-sm btn-primary">
											<i class="ace-icon fa fa-key"></i> <span class="bigger-110">登录</span>
										</button>
									</div>

									<div class="space-4"></div>
								</fieldset>
							</form>

							<c:if test="${param.error ne null}">
								<div class="social-or-login center">
									<span class="bigger-110">邮箱或密码错误，请重新输入！</span>
								</div>
							</c:if>

							<div class="space-6"></div>


						</div>
						<!-- /.widget-main -->

						<div class="toolbar clearfix">
							<div>
								<a href="#" data-target="#forgot-box"
									class="forgot-password-link"> <i
									class="ace-icon fa fa-arrow-left"></i> 忘记密码
								</a>
							</div>

							<div>
								<a href="#" data-target="#signup-box" class="user-signup-link">
									注册 <i class="ace-icon fa fa-arrow-right"></i>
								</a>
							</div>
						</div>
					</div>
					<!-- /.widget-body -->
				</div>
				<!-- /.login-box -->

				<div id="forgot-box" class="forgot-box widget-box no-border">
					<div class="widget-body">
						<div class="widget-main">
							<h4 class="header red lighter bigger">
								<i class="ace-icon fa fa-key"></i> 重置密码
							</h4>

							<div class="space-6"></div>
							<p>请输入邮箱</p>

							<form>
								<fieldset>
									<label class="block clearfix"> <span
										class="block input-icon input-icon-right"> <input
											type="email" class="form-control" placeholder="邮箱" /> <i
											class="ace-icon fa fa-envelope"></i>
									</span>
									</label>

									<div class="clearfix">
										<button type="button"
											class="width-35 pull-right btn btn-sm btn-danger">
											<i class="ace-icon fa fa-lightbulb-o"></i> <span
												class="bigger-110">发送</span>
										</button>
									</div>
								</fieldset>
							</form>
						</div>
						<!-- /.widget-main -->

						<div class="toolbar center">
							<a href="#" data-target="#login-box" class="back-to-login-link">
								返回登录 <i class="ace-icon fa fa-arrow-right"></i>
							</a>
						</div>
					</div>
					<!-- /.widget-body -->
				</div>
				<!-- /.forgot-box -->

				<div id="signup-box" class="signup-box widget-box no-border">
					<div class="widget-body">
						<div class="widget-main">
							<h4 class="header green lighter bigger">
								<i class="ace-icon fa fa-users blue"></i> 新用户注册
							</h4>

							<div class="space-6"></div>
							<p>请输入注册信息:</p>

							<form action="/register" method="POST">
								<fieldset>
									<label class="block clearfix">
										<span class="block input-icon input-icon-right"> 
										<input type="email" name="username" class="form-control" placeholder="输入邮箱" /> 
										<i class="ace-icon fa fa-envelope"></i>
									</span>
									</label> <label class="block clearfix"> 
									<span class="block input-icon input-icon-right">
										<input type="password" name="password" class="form-control" placeholder="输入密码" />
										 <i class="ace-icon fa fa-lock"></i>
									</span>
									</label> <label class="block clearfix"> <span
										class="block input-icon input-icon-right"> <input
											type="password" class="form-control" placeholder="再次输入密码" />
											<i class="ace-icon fa fa-retweet"></i>
									</span>
									</label> <label class="block"> <input type="checkbox"
										class="ace" /> <span class="lbl"> 我已阅读并同意 <a href="#">《用户协议》</a>
									</span>
									</label>

									<div class="space-24"></div>

									<div class="clearfix">
										<button type="reset" class="width-30 pull-left btn btn-sm">
											<i class="ace-icon fa fa-refresh"></i> <span
												class="bigger-110">重置</span>
										</button>

										<button type="submit"
											class="width-65 pull-right btn btn-sm btn-success">
											<span class="bigger-110">注册</span> <i
												class="ace-icon fa fa-arrow-right icon-on-right"></i>
										</button>
									</div>
								</fieldset>
							</form>
						</div>
						
						<c:if test="${not empty result}">
								<div class="social-or-login center">
									<span class="bigger-110">${result}</span>
								</div>
							</c:if>

							<div class="space-6"></div>

						<div class="toolbar center">
							<a href="#" data-target="#login-box" class="back-to-login-link">
								<!-- <i class="ace-icon fa fa-arrow-left"></i> --> 已有账户，请单击此处登录
								<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
							</a>
						</div>
					</div><!-- /.widget-body -->
				</div><!-- /.signup-box -->
			</div><!-- /.position-relative -->


		</div>

	</div><!-- /.col -->
</div><!-- /.row -->


<!-- inline scripts related to this page -->
<script type="text/javascript">
			jQuery(function($) {
			 $(document).on('click', '.toolbar a[data-target]', function(e) {
				e.preventDefault();
				var target = $(this).data('target');
				$('.widget-box.visible').removeClass('visible');//hide others
				$(target).addClass('visible');//show target
			 });
			});
			
			$('body').attr('class', 'login-layout light-login');
			$('#id-text2').attr('class', 'grey');
			$('#id-company-text').attr('class', 'blue');
			
</script>