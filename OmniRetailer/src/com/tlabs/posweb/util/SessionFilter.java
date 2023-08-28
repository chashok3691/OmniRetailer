package com.tlabs.posweb.util;
import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionFilter implements Filter{
	private ArrayList<String> urlList;
    @Override
    public void destroy() {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletResponse response=(HttpServletResponse)res;
        HttpServletRequest request = (HttpServletRequest)req;
        String url = request.getServletPath();
        // long currTime = System.currentTimeMillis();
        //System.out.println("Filter Called");
        boolean allowedRequest = false;
        if (urlList.contains(url)) {
            allowedRequest = true;
        }
        if (!allowedRequest) {
            HttpSession session = request.getSession(false);
            if (null == session) {
            	//response.sendRedirect("/index.jsp");
               String src = "<script>window.location=\""+request.getContextPath()+"\"</script>";
            	response.getWriter().write(src);
            } else {
                chain.doFilter(request, response);
            }
        } else {
            chain.doFilter(request, response);
        }
    }

    public void init(FilterConfig config) throws ServletException {
        String urls = config.getInitParameter("avoid-urls");
        StringTokenizer token = new StringTokenizer(urls, ",");
        urlList = new ArrayList<String>();
        while (token.hasMoreTokens()) {
            urlList.add(token.nextToken());

        }
    }

}