<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="style/blog.css" type="text/css">
<script src="http://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		$.post("/MyBlog/findSorts.action", function(data) {
			var sorts = data.sorts;
			html = "";
			for ( var i = 0; i < sorts.length; i++) {
				html = html + "<option>" + sorts[i]['sort'] + "</option>";
			}
			$("#sort").html(html);
		});
	});
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
	<div class="select-sort">
		分类<select name="blog.sort" id="sort"></select>
	</div>
</body>
</html>