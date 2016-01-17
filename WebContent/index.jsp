
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link rel="stylesheet" href="http://cdn.amazeui.org/amazeui/2.4.2/css/amazeui.css" type="text/css"> -->
<link rel="stylesheet" href="style/blog.css" type="text/css">
<script src="http://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="script/blog.js"></script>
<title>再见只是离别前的自欺欺人的博客</title>
</head>
<body>
	<div class="header">
		<div class="title">再见只是离别前的自欺欺人的博客</div>
		<div class="menu">
			<ul>
				<li><a href="#">首页</a></li>
				<li><a href="index.jsp">博文</a></li>
				<li><a href="sort.jsp">分类</a></li>
				<li><a href="about.jsp">关于</a></li>
			</ul>
		</div>
	</div>
	<%-- <s:if test="#session.admin!=null">
		<div id="add-sort">
			<a href="/MyBlog/admin/edit/sort.jsp">添加分类</a>
		</div>
		<div id="add-blog">
			<a href="/MyBlog/admin/edit/blog.jsp">发表日志</a>
		</div>
	</s:if>
	<hr>
	</div>
	<div id="switch">
		<a href="javascript:void(0)">展开搜索 </a>
	</div>
	<div id="search">
		<s:submit value="搜索"></s:submit>
	</div>
	<hr> --%>
	<div class="mainbody">
		<div class="main">
			<div id="blogs"></div>
			<div id="blogfoot" class="blogfoot"></div>
		</div>
		<div class="aside"></div>
		<div class="footer">
			<div class="link">
				友情链接：<a href="http://blog.yubangweb.com/">年轻人</a>
			</div>
			<div class="source">
				该博客是基于java EE（SSH）+tomcat+mysql搭建 <a
					href="https://github.com/ricardo773462831/Blog">(源代码)</a>
			</div>
		</div>
	</div>
</body>
</html>

