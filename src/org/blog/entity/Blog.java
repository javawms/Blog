package org.blog.entity;

/**blog实体类*/
public class Blog {
	private int id; // 主键
	private String title; // 标题
	private String blog; // 内容
	private String tag; // 标签
	private String sort; // 分类
	private String createTime; // 发表时间

	// 无参构造方法
	public Blog() {
	}

	// 全参构造方法
	public Blog(int id, String title, String blog, String tag, String sort,
			String createTime) {
		this.id = id;
		this.title = title;
		this.blog = blog;
		this.tag = tag;
		this.sort = sort;
		this.createTime = createTime;
	}

	// getter和setter方法
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBlog() {
		return blog;
	}

	public void setBlog(String blog) {
		this.blog = blog;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
}