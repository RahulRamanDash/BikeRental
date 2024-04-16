package com.java.app;

import java.util.Map;

import javax.faces.context.FacesContext;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

public class UsersDaoImpl {
	
	SessionFactory sf;
	Session session;
	
	public String userLoginDao(Users user) {
		
		Map<String,Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		
		sf = SessionHelper.getConnection();
		Session session = sf.openSession();
		Criteria cr = session.createCriteria(Users.class);
		cr.add(Restrictions.eq("username",user.getUsername()));
		cr.add(Restrictions.eq("password",EncryptPassword.getCode(user.getPassword())));
		cr.setProjection(Projections.rowCount());
		if(cr.uniqueResult()!=null) {
			long count = (long) cr.uniqueResult();
			if(count == 1) {
				return"games.jsp?faces-redirect=true";
			}		
		else {
			sessionMap.put("passWordErr", "Enter a valid username and password.");
			return "login.jsp?faces-redirect=true";
			}
		}
		return "login.jsp?faces-redirect=true";
	}
}
