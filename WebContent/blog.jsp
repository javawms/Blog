
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="style/blog.css" type="text/css">
<script src="http://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$.post("findBlog.action?blog.id="
						+ getQueryParameter('blog.id'), function(data) {
					fillBlog(data);
				});
			});

	function getQueryParameter(qs) {
		var s = location.href;
		s = s.replace("?", "?&").split("&");//这样可以保证第一个参数也能分出来  
		var re = "";
		for (i = 1; i < s.length; i++)
			if (s[i].indexOf(qs + "=") == 0)
				re = s[i].replace(qs + "=", "");//取代前面的参数名，只剩下参数值  

		return re;
	}
	function getUrlVars() {
		var vars = [], hash;
		var hashes = window.location.href.slice(
				window.location.href.indexOf('?') + 1).split('&');
		for ( var i = 0; i < hashes.length; i++) {
			hash = hashes[i].split('=');
			vars.push(hash[0]);
			vars[hash[0]] = hash[1];
		}
		return vars;
	}

	function fillBlog(data) {
		var blog = data.blog;
		html = "";
		html += "<div class='info-blog-title'>" + blog.title + "</div>";
		html += "<div class='info-blog-blog'>" + blog.blog + "</div>";

		html += "<div class='info-other'><ul>";
		html += "<li class='blog-createTime'>&nbsp&nbsp&nbsp&nbsp"
				+ blog.createTime + "</li>";
		if (blog.tag != null) {
			html += "<li class='blog-tag'>&nbsp&nbsp&nbsp&nbsp" + blog.tag
					+ "</li>";
		}

		html += "</ul></div></div>";
		$(".info-blog").html(html);
	}
</script>
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
	<div class="info-blog"></div>
	<div class="footer">
		<div class="link">
			友情链接：<a href="http://blog.yubangweb.com/">年轻人</a>
		</div>
		<div class="source">
			该博客是基于java EE（SSH）+tomcat+mysql搭建 <a
				href="https://github.com/ricardo773462831/Blog">(源代码)</a>
		</div>
	</div>
</body>

</html>

