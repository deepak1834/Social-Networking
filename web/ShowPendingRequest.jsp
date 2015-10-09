<%@page import="bean.Group"%>
<%@page import="bean.RequestManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.User"%>
<%@page import="bean.RegisterDao"%>




<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" >
    <head>
        <title><% out.println("Friends"); %></title>
        <link href="css/styles.css" rel="stylesheet">
            <meta name="robots" content="noindex,follow" />
            
            
            
            
            
            
             <link rel="shortcut icon" href="http://designshack.net/favicon.ico">
        <link rel="icon" href="http://designshack.net/favicon.ico">
        <link rel="stylesheet" type="text/css" media="all" href="style.css">
        <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" charset="utf-8" src="js/jquery.leanModal.min.js"></script>
        
            
            
            
            
            <script type="text/javascript" src="http://ajax.googleapis.com/ajax/
        libs/jquery/1.3.0/jquery.min.js"></script>
        <script type="text/javascript" >
         
            //to aproove group request
            function aproove(source,dest) {
                
                var flag = 2;
               var dataString = 'reqsource=' + source +'&reqdestination='+ dest + '&reqflag=' +flag  ;

                    $.ajax({
                      
                        type: "POST",
                        url: "RequestHandler.jsp",
                        data: dataString,
                        cache: false,
                        success: function (html) {
                            alert(html);
                        }
                    });
                return false;
                
            }
            
            
            
            
        </script>
            
            
            
            
    </head>
    <body>
        <ul class="nav">
            <li>
                <a href="user.jsp">Home</a>
            </li>
            <li>
                 <a href="ShowPendingRequest.jsp">Requests</a>
            </li>
            <li id="search">
                <form action="searchresult.jsp" method="post">
                    <input type="text" name="fname" id="search_text" placeholder="Search"/>
                    <input type="button" name="search_button" id="search_button"></a>
                </form>
            </li>
            <li>
                <a href="">Edit</a>
            </li>
            <li>
                <a href="logout.jsp">Logout</a>
            </li>

            <br>
                <br>
                    <br>
                         <br>
                             <br>
                                 
                <%
                    ArrayList<User> u = new ArrayList();
                    int i;
                    RequestManager.showPendingRequest(Long.parseLong(session.getAttribute("UID").toString()),u);
                    session.setAttribute("UID", session.getAttribute("UID"));
                    
                %>
                
                 <% if(u.isEmpty())
                        out.println("NO Friends requests Pending");
                    else{
                            out.println("<h1   style=\"margin-left:300px;margin-bottom:50px;\"> You have Following Requests</h1>");
                        for(i=0;i<u.size();i++){
                            if(u.get(i).getU_id() != Long.parseLong(session.getAttribute("UID").toString()))
                            out.println("<br>"+"<form action=\"Udisplay.jsp\" method=\"post\">"+" <button type=\"submit\" class=\"btn2\" name=uemail value=\""+u.get(i).getEmail()+"\"  >"+u.get(i).getName() +"    "+ u.get(i).getLname()+"</button>"+ "</form>"+"<br><br><br><br>");
                            
                        }
                  } %>
                  
                  <br><br>
                   <%
                    ArrayList<User> uu = new ArrayList();
                    ArrayList<Group> grp = new ArrayList();

                    RequestManager.pendingGroupRequest(Long.parseLong(session.getAttribute("UID").toString()),grp,uu);
                    session.setAttribute("UID", session.getAttribute("UID"));
                    
                %>
                
                 <% if(uu.isEmpty())
                        out.println("NO Group requests Pending");
                    else{
                            out.println("<h1   style=\"margin-left:300px;margin-top:50px;\"> You have Following Group Requests</h1>");
                        for(i=0;i<uu.size();i++){
                            out.println("<br>"+"<form action=\"Udisplay.jsp\" method=\"post\">"+" <button type=\"submit\" class=\"btn2\" name=uemail value=\""+uu.get(i).getEmail()+"\"  >"+uu.get(i).getName() +"    "+ uu.get(i).getLname()+"</form>"+"        for Group   ");
                            out.println("<form action=\"GroupDisplay.jsp\" method=\"post\">"+" <button type=\"submit\" class=\"btn4\" name=groupid value=\""+grp.get(i).getG_id()+"\"  >"+grp.get(i).getGname()+"    "+ "</button>"+ "</form>"+"<br><br>");
                            out.println("<div><input  onclick=\"aproove("+ uu.get(i).getU_id() +","+grp.get(i).getG_id()+")\" type=\"button\" name=\"Friends\" class=\"btn2\" value=\"Accept\" id=\"myButton1\"><br><br><br></div>");
                              
                        }
                  } %> 
                <br>
                </body>
                </html>
