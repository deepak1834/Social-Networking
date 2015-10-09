


<%@page import="bean.GroupManager"%>
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
                    int i;
                    ArrayList<Group> grplist = new ArrayList();
                     ArrayList<Group> grplist1 = new ArrayList();

                    GroupManager.getUserGroups(Long.parseLong(session.getAttribute("dispuserid").toString()), grplist);
                    
                     GroupManager.getUserJoinedGroups(Long.parseLong(session.getAttribute("dispuserid").toString()), grplist1);

                    session.setAttribute("UID", session.getAttribute("UID"));
                    
    %>
                
                  <% if(grplist.isEmpty())
                        out.println("NO Groups Created By  " + session.getAttribute("dispusername"));
                    else{
                                                out.println("<br><br><h1>Groups created By   " +session.getAttribute("dispusername")+"</h1>");

                        for(i=0;i<grplist.size();i++){
                            out.println("<br>"+"<form action=\"GroupDisplay.jsp\" method=\"post\">"+" <button type=\"submit\" class=\"btn2\" name=groupid value=\""+grplist.get(i).getG_id()+"\"  >"+grplist.get(i).getGname()+"    "+ "</button>"+ "</form>"+"<br><br><br><br>");
                            
                        }
                        
                        
                        
                         if(!grplist1.isEmpty()){
                                out.println("<br><h1>Groups Joined By  "+session.getAttribute("dispusername") +"</h1>");
                            for(i=0;i<grplist1.size();i++){
  
                                out.println("<br>"+"<form action=\"GroupDisplay.jsp\" method=\"post\">"+" <button type=\"submit\" class=\"btn2\" name=groupid value=\""+grplist1.get(i).getG_id()+"\"  >"+grplist1.get(i).getGname()+"    "+ "</button>"+ "</form>"+"<br><br><br><br>");
                            
                            }
                        
                        
                         }
                        
                    }
                 %>      
                <br>
                </body>
                </html>
