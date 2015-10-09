<%@page import="bean.User"%>
<%@page import="bean.RegisterDao"%>

<%
    
    
    
    
    int flag,status;
    status =1;
    
      //out.println(request.getParameter("info").toString());

    flag=Integer.parseInt(request.getParameter("flag").toString()) ;
    
    
    String attribute;
    attribute = request.getParameter("info").toString();
    if(flag==4){
       status= RegisterDao.matchPassword(Long.parseLong(session.getAttribute("UID").toString()),attribute);
        
    }
    if(status==1)
    status = User.changeInfo(attribute, flag, Long.parseLong(session.getAttribute("UID").toString()));
    else{
                        out.println("old password not Correct");

    }
        
    if(status >0){
        out.println("Update Successful");
    }
    else{
                out.println("There was Some problem");

    }
         


%>