$(document).ready(function() {
	listBlog(1, 5);
	$("#switch").click(function() {
		$("#switch").hide();
		$("#search").show();
	});
	$("#search").click(function() {
		$("#switch").show();
		$("#search").hide();
	});
});

function listBlog(page, size) {
	if (isNaN(page) || page == null)
		page = 1;
	if (isNaN(size) || size == null)
		size = 5;
	$.post("list.action?pageBean.page=" + page + "&pageBean.size=" + size,
			function(data) {
				fillBlogs(data);
			});
}

function fillBlogs(data) {

	var blogs = data.blogs;
	var pageBean = data.pageBean;
	if (blogs == null) {
		$(".main").html("<div class='none'>没有记录</div>");
	} else {
		$("#blogs").empty();
		var html = "";

		if (pageBean.count == 0) {
			$("#blogs").html("<div class='blog'>没有记录</div>");
		} else {
			for ( var i = 0; i < blogs.length; i++) {
				html += "<div class='blog'>" + "<div class='blog-title'>"
						+ "<a href='/MyBlog/blog.jsp?blog.id="+blogs[i].id+"'>"
						+ blogs[i].title + "</a></div>";

				html += "<div class='blog-blog'>" + blogs[i].blog + "</div>";
				/*
				 * if (blogs[i].sort != null) { html += "<div
				 * class='blog-sort'>" +"<a href=''>"+ blogs[i].sort + "</a></div>"; }
				 */
				html += "<div class='other'><ul>";
				html += "<li class='blog-createTime'>&nbsp&nbsp&nbsp&nbsp"
						+ blogs[i].createTime + "</li>";
				if (blogs[i].tag != null) {
					html += "<li class='blog-tag'>&nbsp&nbsp&nbsp&nbsp"
							+ blogs[i].tag + "</li>";
				}

				html += "</ul></div></div>";
				$("#blogs").html(html);
			}
		}
		html = "";
		html += "<div class='blog-foot'><td colspan='6' align='center'>";

		if (pageBean.page != 1) {
			html += "<a href='javascript:void(0)' id='firstPage'>&nbsp&nbsp首页</a>";
			html += "<a href='javascript:void(0)' id='previousPage'>&nbsp&nbsp上页</a>";
		}

		if (pageBean.page != pageBean.total) {
			html += "<a href='javascript:void(0)' id='nextPage'>&nbsp&nbsp下页</a>";
			html += "<a href='javascript:void(0)' id='lastPage'>&nbsp&nbsp末页</a>";
		}

		html += "&nbsp&nbsp<input text size='1' maxlength='3' id='page' value="
				+ pageBean.page
				+ ">&nbsp&nbsp/&nbsp&nbsp<span id='total'></span></td></div>";
		$("#blogfoot").html(html);

		// $("#page").html(pageBean.page);
		$("#total").html(pageBean.total);

		$("#firstPage").click(function() {
			listBlog(1, 5);
		});

		$("#previousPage").click(function() {
			listBlog(parseInt($("#page").val()) - 1, 5);
		});

		$("#nextPage").click(function() {
			listBlog(parseInt($("#page").val()) + 1, 5);
		});
		$("#lastPage").click(function() {
			listBlog(parseInt($("#total").html()), 5);
		});
		$("#page").change(function() {
			listBlog(parseInt($("#page").val()), 5);
		});
	}
}
