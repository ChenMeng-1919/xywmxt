package util;

import util.threadlocal.LocalRequestContextHolder;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map;

public class SetChar extends HttpServlet implements Filter {
    private FilterConfig filterConfig = null;
    private Integer tomcatVersion = null;

    // 是否使用 tomcat 7 编码处理
    private boolean isUseChart = true;

    // Handle the passed-in FilterConfig
    public void init(FilterConfig filterConfig) throws ServletException {

        this.filterConfig = filterConfig;
        String s = filterConfig.getServletContext().getServerInfo().split("/" , 2)[1];

        tomcatVersion = Integer.valueOf(s.split("\\.")[0]);
    }

    /**
     * 过滤器执行
     * @param request
     * @param response
     * @param filterChain
     */
    // Process the request/response pair
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain filterChain) {
        try {
            HttpServletRequest req;
            if(tomcatVersion == 7 && isUseChart){
                req = new HttpServletRequestImpl((HttpServletRequest) request) ;
            }else{
                req = (HttpServletRequest) request;
            }

            response.setCharacterEncoding("utf-8");
            req.setCharacterEncoding("utf-8");

            LocalRequestContextHolder.setLocalRequestContext(filterConfig.getServletContext(),req,(HttpServletResponse) response );

            filterChain.doFilter(req, response);
        } catch (ServletException sx) {

            //filterConfig.getServletContext().log(sx.getMessage(),sx);
            filterConfig.getServletContext().log(sx.getMessage());
            /* try {
                ((HttpServletResponse) response).sendError(500 , sx.getMessage());
            } catch (IOException e) {
                e.printStackTrace();
            } */
        } catch (IOException iox) {

            filterConfig.getServletContext().log(iox.getMessage(),iox);
            //filterConfig.getServletContext().log(iox.getMessage());
        }
    }

    public class HttpServletRequestImpl extends HttpServletRequestWrapper {
        private HttpServletRequest request;
        private Map<String,String[]> map = null;

        public HttpServletRequestImpl(HttpServletRequest request)
        {
            super(request);
            this.request = request;
        }

        @Override
        public String getParameter(String name) {
            String[] strings = getParameterMap().get(name);
            if(strings!= null && strings.length > 0){ // 防止超出下标
                return strings[0];
            }
            return null;
        }

        @Override
        public Map<String, String[]> getParameterMap() {
            if(map != null){
                return map;
            }
            map = request.getParameterMap();
            //遍历value， 改成utf-8编码
            for(Map.Entry<String,String[]> entry : map.entrySet())
            {
                //取数组值
                String[] values = entry.getValue();

                for (int i = 0; i < values.length; i++) {
                    try {
                        values[i] = new String(values[i].getBytes("ISO-8859-1"),"utf-8");
                    } catch (UnsupportedEncodingException e) {
                        e.printStackTrace();
                    }
                }
            }

            return map;
        }
    }


    // Clean up resources
    public void destroy() {
    }
}
