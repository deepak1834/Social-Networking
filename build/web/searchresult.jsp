<%@page import="java.util.ArrayList"%>
<%@page import="bean.User"%>
<%@page import="bean.RegisterDao"%>




<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" >
    <head>
        <title><% out.println("search"); %><%=request.getParameter("fname")%></title>
        <link href="css/styles.css" rel="stylesheet">
            <link href="css/style.css" rel="stylesheet">
            <meta name="robots" content="noindex,follow" />
    </head>
    <body>
        <ul class="nav">
            <li>
                <a href="user.jsp">Home</a>
            </li>
            <li>
                <a href="#">Settings</a>
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
            
            <%
                    ArrayList<User> u = new ArrayList();
                    String s = request.getParameter("fname");
                    String s1 = new String();
                    int i;
                    i = 0;
                    s=s.trim();
                    while (  i< s.length()  &&  s.charAt(i) != ' ' ) {
                        
                        s1 = s1 + s.charAt(i);
                        i++;
                    }
                    RegisterDao.Usearch(s1, u);
                    session.setAttribute("UID", session.getAttribute("UID"));
                    
                %>
                
                  <% if(u.isEmpty())
                        out.println("<h1 style=\"margin-top:100px\">No results found   </h1>");
                    else{
                      
                      
                      
                        out.println("<h1 style=\"margin-left:800px;\">results for   " +s+"   </h1>");
                        for(i=0;i<u.size();i++){
                            if(u.get(i).getU_id() != Long.parseLong(session.getAttribute("UID").toString()))
                            out.println("<br>"+"<form action=\"Udisplay.jsp\" method=\"post\">"+" <button type=\"submit\" class=\"btn2\" name=uemail value=\""+u.get(i).getEmail()+"\"  >"+u.get(i).getName() +"    "+ u.get(i).getLname()+"</button>"+ "</form>"+"<br><br><br><br>");
                            
                        }
                    } %> 
            

            
                                 
                
                <br>
                </body>
                </html>
