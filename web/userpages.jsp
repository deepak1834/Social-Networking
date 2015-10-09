

<%@page import="bean.Page"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE HTML>


<html>

    <head>

        <meta charset="UTF-8">
        <title>Home page</title>
        <link rel='stylesheet' href='http://codepen.io/assets/libs/fullpage/jquery-ui.css'>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/styles.css">


        <!-- for modal     -->
        <link rel="shortcut icon" href="http://designshack.net/favicon.ico">
        <link rel="icon" href="http://designshack.net/favicon.ico">
        <link rel="stylesheet" type="text/css" media="all" href="style.css">
        <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" charset="utf-8" src="js/jquery.leanModal.min.js"></script>


        <!--for post  -->   
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/
        libs/jquery/1.3.0/jquery.min.js"></script>
        <script type="text/javascript" >
            
    
            function myFunction() {
                
                var gname = document.getElementById("pname").value;
                var cat = document.getElementById("cat").value;
                var des = document.getElementById("des").value;

        // Returns successful data submission message when the entered information is stored in database.
                var dataString = 'pname=' + gname +'&cat=' + cat+'&des=' + des;
                
                if (pname == '' || cat=='' || des=='') {
                    alert("Please Fill All Fields hiiiii");
                } else {
        // AJAX code to submit form.
                    $.ajax({
                      
                        type: "POST",
                        url: "CreatePage.jsp",
                        data: dataString,
                        cache: false,
                        success: function (html) {
                            alert(html);
                        }
                    });
                }
                return false;
            }
        </script>






    </head>


    <body >
        <div class="nav">
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
                <a href="EditInfo.jsp">Edit</a>
            </li>
            <li>
                <a href="logout.jsp">Logout</a>
            </li>
        </div>



        <div style="height:250px;margin-left:-10px;margin-top:50px;margin-right:-10px">



            <div style="margin-left:30px;float:left;margin-top:0px"><br>

                <br><a href="#post" id="modaltrigger"><input type="submit" name="login" class="login login-submit" value="Create Page" style="margin-left:1100px;float:left;margin-top:10px"   ></a><br><br><br>
                
            </div>
            <div id="post" style="display:none;">
                <h1>Create Page</h1><br>
                <form id="postform" name="postform" >
                        <label>Page Name</label><br>
                        <input type="text" name="name" id="pname" placeholder="Name"   class="txtfield" style="height:30px"tabindex="2">
                        <br><label>Page Catagory</label><br>
                        <input type="text" name="category" id="cat" placeholder="Category"    class="txtfield" style="height:30px"tabindex="2">
                        <br><label>Page Description</label><br>
                    <textarea cols="20" rows="4" type="text" name="userpost" id="des" class="txtfield" style="height:100px"tabindex="2"> </textarea>  

                    <div class="center"><input  type="button" name="userpost" id="userpost1" class="flatbtn-blu hidemodal"  tabindex="3" value="Create"  onclick="myFunction()"></div><br>
                    <div class="center"><input type="button" name="cancel" id="cancel" class="flatbtn-blu hidemodal" value="cancel" tabindex="4"></div>
                </form>
            </div>



            <script type="text/javascript">
                $(function () {
                    $('#postform').submit(function (e) {
                        return false;
                    });

                    $('#modaltrigger').leanModal({top: 110, overlay: 0.45, closeButton: ".hidemodal"});
                });
            </script>
            
            
            
          
            
 
</div>
        
    <%
                    int i;
                    ArrayList<Page> pagelist = new ArrayList();
                    

                    Page.getUserPages(Long.parseLong(session.getAttribute("UID").toString()), pagelist);
                   

                    session.setAttribute("UID", session.getAttribute("UID"));
                  

                    
    %>
                
                  <% if(pagelist.isEmpty())
                        out.println("<h1>NO Pages Created By You</h1>");
                    else{
                        out.println("<h1>Pages Created By You</h1>");
                        for(i=0;i<pagelist.size();i++){
                            out.println("<br>"+"<form action=\"PageDisplay.jsp\" method=\"post\">"+" <button type=\"submit\" class=\"btn2\" name=pageid value=\""+pagelist.get(i).getP_id()+"\"  >"+pagelist.get(i).getPname()+"    "+ "</button>"+ "</form>"+"<br><br><br><br>");
                            
                        }
                            
                        }
                        
                    
                 %>      
        
    </body>
</html>
