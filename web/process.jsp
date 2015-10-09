<%@page import="bean.RegisterDao"%>
<jsp:useBean id="obj" class="bean.User"/>
<%  obj.setBirthDate(request.getParameter("birthdate")); %>
<jsp:setProperty property="*" name="obj"/>

<%
 int status;   
if(request.getParameter("password").toString().equals(request.getParameter("rpassword")))
 status=RegisterDao.register(obj);
else
    status=-2;
if(status>0){
out.print("You are successfully registered");
String site = new String("index.html");

        response.setStatus(response.SC_MOVED_TEMPORARILY);

        response.setHeader("Refresh", "1;" + site);
}
else if(status==-1){
    out.print("email is already registered  !!!!");
    
    String site = new String("register.html");
   response.setStatus(response.SC_MOVED_TEMPORARILY);
   
   response.setHeader("Refresh", "3;"+site);
   
}
else if(status ==-2){
    out.print("Please enter the same  password in both the fields");
    
    String site = new String("register.html");
   response.setStatus(response.SC_MOVED_TEMPORARILY);
   
   response.setHeader("Refresh", "3;"+site);
   
}
/**
       out.println(obj.getName());
    out.println(obj.getLname());
     out.println(obj.getCategory());
    out.println(obj.getBirthDate());
    out.println(obj.getAns());
    out.println(obj.getQue());
*/


%>