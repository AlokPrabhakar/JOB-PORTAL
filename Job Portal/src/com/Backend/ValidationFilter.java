package com.Backend;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;


public class ValidationFilter implements Filter
{
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException
    {
        String name2=request.getParameter("myname");
        String email2=request.getParameter("email");
        String pass2=request.getParameter("password");
        String gender2=request.getParameter("gender");
        String city2=request.getParameter("city");
        String dob=request.getParameter("dob");
        
        ServerValidatonSide validations=new  ServerValidatonSide();
        
        if(!validations.nameValidate(name2))
        {
        	System.out.println("name");
            RequestDispatcher rd1=request.getRequestDispatcher("register.jsp");
            rd1.include(request, response);
        }
        else if(!validations.emailValidate(email2))
        {
        	System.out.println("email");
            RequestDispatcher rd1=request.getRequestDispatcher("register.jsp");
            rd1.include(request, response);
        }
        else if(!validations.passwordValidate(pass2))
        {
        	System.out.println("password");
            RequestDispatcher rd1=request.getRequestDispatcher("register.jsp");
            rd1.include(request, response);
        }
       
        else if(gender2==null || gender2.equals(""))
        {
        	System.out.println("gender");
            RequestDispatcher rd1=request.getRequestDispatcher("register.jsp");
            rd1.include(request, response);
        }
        else if(city2==null || city2.equals(""))
        {
        	System.out.println("city");
            RequestDispatcher rd1=request.getRequestDispatcher("register.jsp");
            rd1.include(request, response);
        }
        else
        {
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
    }
}
