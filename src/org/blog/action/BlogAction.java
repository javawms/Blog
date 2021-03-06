package org.blog.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.blog.bean.BlogCondition;
import org.blog.bean.PageBean;
import org.blog.entity.Blog;
import org.blog.util.Constant;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@SuppressWarnings("serial")
@Controller("blogAction")
/**使用Spring记性托管，使用session作用域，在同一个会话中使用同一个Action实例，主要为了让分页数据PageBean和查询条件数据BlogCondition能保持上一次的状态*/
@Scope("session")
public class BlogAction extends BaseAction {
	private Blog blog;// blog
	private List<Blog> blogs;// blog列表
	private PageBean pageBean;// 分页的Bean
	private BlogCondition blogCondition;// 封装查询条件的Bean，用于封装blogs和pageBean，返回给客户端

	private Map<String, Object> data = new HashMap<String, Object>();
	HttpServletResponse response = null;
	HttpServletRequest request = null;
	private boolean success;// 操作是否成功

	public Blog getBlog() {
		return blog;
	}

	public void setBlog(Blog blog) {
		this.blog = blog;
	}

	public List<Blog> getBlogs() {
		return blogs;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public BlogCondition getBlogCondition() {
		return blogCondition;
	}

	public void setBlogCondition(BlogCondition blogCondition) {
		this.blogCondition = blogCondition;
	}

	public Map<String, Object> getData() {
		return data;
	}

	public boolean isSuccess() {
		return success;
	}

	/** 查询一页的数据 */
	public String list() {
		if (pageBean == null) {
			pageBean = new PageBean();
		}
		// 如果页面大小为0，则设置默认大小
		if (pageBean.getSize() == 0) {
			pageBean.setSize(Constant.PAGE_SIZE);
		}
		// 总记录数
		pageBean.setCount(blogService.findCount(blogCondition));

		// 页数
		long total = ((pageBean.getCount() % pageBean.getSize() == 0) ? pageBean
				.getCount() / pageBean.getSize()
				: pageBean.getCount() / pageBean.getSize() + 1);
		pageBean.setTotal(total);
		// 设置当前页面
		if (pageBean.getPage() < 1) {
			pageBean.setPage(1);
		} else if (pageBean.getPage() > total) {
			pageBean.setPage((int) total);
		}
		// 查询当前页的数据
		blogs = blogService.findPageBlogs(pageBean, blogCondition);
		data.clear();
		data.put("blogs", blogs);
		data.put("pageBean", pageBean);
		return SUCCESS;
	}

	/** 添加blog */
	public String addBlog() {
		Date date = new Date();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		blog.setCreateTime(format.format(date));
		System.out.printf(blog.getTitle() + "===" + blog.getBlog());
		success = (blogService.addBlog(blog) > 0);
		return SUCCESS;
	}

	/** 更新blog */
	public String updateBlog() {
		success = (blogService.updateBlog(blog) > 0);
		return SUCCESS;
	}

	/** 删除blog */
	public String deleteBlog() {
		success = (blogService.deleteBlog(blog.getId()) > 0);
		return SUCCESS;
	}

	/** 查询blog */
	public String findBlog() {
		blog = blogService.findBlog(blog.getId());
		data.put("blog", blog);
		return SUCCESS;
	}

}
