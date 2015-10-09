<%@page import="bean.Post"%>
<%@page import="bean.RegisterDao"%>

<%  

    int status ;
   //out.println(request.getParameter("userpost").toString());
   String content;
   long sourceid,destid;
          sourceid = Long.parseLong(session.getAttribute("postsource").toString());
          destid = Long.parseLong(session.getAttribute("postdestination").toString());
          content=request.getParameter("userpost").toString();
          if(content.length()<=300)
          status=Post.Userpost(sourceid, destid, content);
          else{
              status =-1;
              out.println("Word limit  exceeded Please  REDUCE the post content size");
          }
          if(status !=-1){
            out.println("Posted");
          }
          else{
              out.println("Somthing went wrong");
          }




%>