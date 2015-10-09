<%-- 
    Document   : RequestHandler
    Created on : 18 Apr, 2015, 3:39:20 PM
    Author     : dksh
--%>

<%@page import="bean.RequestManager"%>
<%
    
    
  //  out.println("hiiiii");

    
  

long source,dest,flag;
source =Long.parseLong(request.getParameter("reqsource"));
dest =Long.parseLong(request.getParameter("reqdestination"));
flag =Long.parseLong(request.getParameter("reqflag"));
int status;


if(flag==1){
   status= RequestManager.friendsGm(source, dest);
    out.println("Request sent");
}
else if(flag==2){
    status=RequestManager.aprooveRequest(source, dest);
        out.println("You are now friends");

}





%>