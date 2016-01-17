package org.blog.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.blog.entity.User;
import org.blog.util.Constant;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@SuppressWarnings("serial")
@Controller("LoginAction")
@Scope("session")
/**登录action*/
public class LoginAction extends BaseAction{
	private User user;//user

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@SuppressWarnings("deprecation")
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		HttpSession session=ServletActionContext.getRequest().getSession();
		if(Constant.username.equals(user.getUsername())&&(Constant.password.equals(user.getPassword()))){
			session.putValue("admin", Constant.username);
			return SUCCESS;
		}else{
			session.putValue("error", "用户名或密码错误");
 			return LOGIN;
		}
	}
	
	
}
