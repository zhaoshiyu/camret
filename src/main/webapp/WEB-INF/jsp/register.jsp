<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>注册</title>
<style type="text/css">
.login-layout {
    background-color: #2e8965;
}
</style>

<c:import url="/WEB-INF/jsp/layout/bootstrap.jsp" />
</head>
<body class="login-layout">
<%-- 引入页面导航栏 --%>
	<c:import url="/WEB-INF/jsp/layout/header.jsp" />

<%-- 登录或注册表单 --%>				
	<c:import url="/WEB-INF/jsp/layout/loginform.jsp" />
	
<%-- 引入页脚 --%>
<c:import url="/WEB-INF/jsp/layout/footer.jsp" />
	
<script type="text/javascript">
	$(function(){
		$('.widget-box.visible').removeClass('visible');
		$("#signup-box").addClass('visible');
	}); 
</script>

</body>
</html>