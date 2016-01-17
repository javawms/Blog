package org.blog.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.blog.entity.Sort;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@SuppressWarnings("serial")
@Controller("sortAction")
@Scope("session")
/**分类action*/
public class SortAction extends BaseAction {
	private Sort sort;//sort
	private List<Sort> sorts;
	public List<Sort> getSorts() {
		return sorts;
	}

	private boolean success;//操作是否成功
	private Map<String, Object> data=new HashMap<String,Object>();
	
	public Map<String, Object> getData() {
		return data;
	}

	public Sort getSort() {
		return sort;
	}

	public void setSort(Sort sort) {
		this.sort = sort;
	}
	
	public String addSort(){
		success=(sortService.addSort(sort)>0);
		System.out.println(success);
		return SUCCESS;
	}
	public String updateSort(){
		success=(sortService.updateSort(sort)>0);
		return SUCCESS;
	}
	
	public String findSorts(){
		sorts=sortService.findAll(Sort.class);
		data.clear();
		data.put("sorts", sorts);
		return SUCCESS;
	}

	public boolean isSuccess() {
		return success;
	}
}
