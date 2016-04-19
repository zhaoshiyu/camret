<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>招聘信息</title>
<c:import url="/WEB-INF/jsp/layout/bootstrap.jsp" />
</head>
<body>
<c:import url="/WEB-INF/jsp/layout/header.jsp" />
<div  align="center">
	<h1>
		Hello <b><c:out value="${pageContext.request.remoteUser}" /></b>
	</h1>
	<form action="/logout" method="post">
		<input type="submit" value="退出登录" /> 
	</form>
</div>

	<table align="center">
		<tr>
			<td width="50px">序号</td>
			<td width="100px">ID</td>
			<td width="200px">姓名</td>
			<td width="250px">邮箱</td>
			<td width="100px">操作</td>
		</tr>
		<c:if test="${not empty users}">
			<c:set var="index" value="${0}"></c:set>
			<c:forEach var="it" items="${users}">
				<c:set var="index" value="${index + 1}"></c:set>
				<tr>
					<td width="50px">${index}</td>
					<td width="100px">${it.id}</td>
					<td width="200px">${it.name}</td>
					<td width="250px">${it.username}</td>
					<td width="100px"><a href="./user?id=${it.id }">修改</a>&nbsp;&nbsp;&nbsp;<a
						href="./delete?id=${it.id }">删除</a></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<br>
	<div align="center">
		<c:set var="addFlag" value="${0}"></c:set>
		<a href="./user?addFlag=${addFlag }">添加</a>
	</div>
	<br>
	<c:if test="${not empty user }">
		<table align="center">
			<form action="./user" method="POST">
				<tr>
					<td width="200px">姓名</td>
					<td width="250px">邮箱</td>
					<td width="200px">密码</td>
					<td width="100px">角色</td>
					<td>修改</td>
				</tr>
				<tr>
					<input type="hidden" name="id" value="${user.id }" />
					<td width="200px"><input type="text" name="name"
						value="${user.name }" /></td>
					<td width="250px"><input type="text" name="username"
						value="${user.username }" /></td>
					<td width="200px"><input type="text" name="password"
						value="${user.password }" /></td>
					<td width="100px">
						<select name="roles">
							<option value="USER">用户</option>
							<option value="ADMIN">管理员</option>
					</select></td>
					<td><input type="submit" value="修改" /></td>
				</tr>
			</form>
		</table>
	</c:if>

	<c:if test="${not empty returnFlag}">
		<table align="center">
			<form action="./user" method="POST">
				<tr>
					<td width="200px">姓名</td>
					<td width="250px">邮箱</td>
					<td width="200px">密码</td>
					<td width="100px">角色</td>
					<td>操作</td>
				</tr>
				<tr>
					<td width="200px"><input type="text" name="name" /></td>
					<td width="250px"><input type="text" name="username" /></td>
					<td width="200px"><input type="text" name="password" /></td>
					<td width="100px">
					<select name="roles" >
							<option value="USER">用户</option>
							<option value="ADMIN">管理员</option>
					</select></td>
					<td><input type="submit" value="添加" /></td>
				</tr>
			</form>
		</table>
	</c:if>


<%-- 引入页脚 --%>
	<c:import url="/WEB-INF/jsp/layout/footer.jsp" />
</body>
</html>