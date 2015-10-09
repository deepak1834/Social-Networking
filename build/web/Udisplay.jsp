<%@page import="javafx.geometry.Pos"%>
<%@page import="bean.RequestManager"%>
<%@page import="bean.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE HTML>
<%@page import="bean.User"%>
<%@page import="bean.RegisterDao"%>

<%
    
  User u =  new User();
  u.setEmail(request.getParameter("uemail"));
  u.getUserData();
  //to remove the time part from date  i.e. "wed april 2 2015 00:00:00"
  SimpleDateFormat ft = new SimpleDateFormat ("dd-MM-yyyy");
  String bdate =new String();
  bdate = ft.format(u.getBirthDate());
  
  
  
  //check the catagory
  String cat = new String();
  
  if(u.getCategory().equals("A") || u.getCategory().equals("B"))
      cat="Studies";
  else
      cat="Faculty";
  
  session.setAttribute("dispuserid", u.getU_id());
  session.setAttribute("dispusername", u.getName());

%>




<%
  
  // for post
session.setAttribute("postsource",session.getAttribute("UID"));
    
    session.setAttribute("postdestination",u.getU_id());

%>
<html>

<head>

    
    
    
    
        <!--for post  -->   
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/
        libs/jquery/1.3.0/jquery.min.js"></script>
        <script type="text/javascript" >
                       
            
            
            
            //send a friend request
            function add(source,dest) {
                var flag = 1; // just for the shake of notification in the handler whether there is a function call for sending re or aprooval
               var dataString = 'reqsource=' + source +'&reqdestination='+ dest + '&reqflag=' +flag  ;
                      // AJAX code to submit form.
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
            
            
            //to aproove friend request
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
            
            
            
            
            
            function myFunction() {
                
                var userpost = document.getElementById("userpost").value;
                
        // Returns successful data submission message when the entered information is stored in database.
                var dataString = 'userpost=' + userpost;
                
                if (userpost == '') {
                    alert("Please Fill All Fields ");
                } else {
        // AJAX code to submit form.
                    $.ajax({
                      
                        type: "POST",
                        url: "userpost.jsp",
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



    
    
    
    
    
    
    
	<meta charset="UTF-8">
        <title><% out.println(u.getName() +" "+ u.getLname()); %></title>
	<link rel='stylesheet' href='http://codepen.io/assets/libs/fullpage/jquery-ui.css'>
	<link rel="stylesheet" href="css/style.css">
	<link href="css/styles.css" rel="stylesheet">
        
        
        
         <!-- for modal     -->
        <link rel="shortcut icon" href="http://designshack.net/favicon.ico">
        <link rel="icon" href="http://designshack.net/favicon.ico">
        <link rel="stylesheet" type="text/css" media="all" href="style.css">
        <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" charset="utf-8" src="js/jquery.leanModal.min.js"></script>
        
        
        
        
        
 </head>
 

 <body style="background-color:#E9EAED">
<div class="nav">
		<li>
			<a href="user.jsp">Home</a>
		</li>
		<li>
                     <a href="ShowPendingRequest.jsp">Requests</a>
                </li>
		<li id="search">
			<form action="searchresult.jsp" method="get">
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


<div style="background-image:url(img/bg1.jpg);height:250px;width:1366px;margin-top:50px;">



	<div style="margin-left:30px;float:left;margin-top:0px"><br>
                            <br><a href="#post" id="modaltrigger"><input  type="button" name="Post" class="btn" value="post" style="height:30px;width:250px;"></a><br><br><br>
		<input type="submit" name="Message" class="btn" value="Message" style="height:30px;width:250px;"><br><br><br>
		<a href="ShowOthersFriends.jsp"><input type="submit" name="Friends" class="btn" value="Friends" style="height:30px;width:250px;"></a><br><br><br>
	</div>
    
    
    
    
    <div id="post" style="display:none;">
                <h1>User Post</h1>
                <form id="postform" name="postform" >

                    <textarea cols="20" rows="4" type="text" name="userpost" id="userpost" class="txtfield" style="height:100px"tabindex="2"> </textarea>  

                    <div class="center"><input  type="button" name="userpost" id="userpost1" class="flatbtn-blu hidemodal"  tabindex="3" value="post"  onclick="myFunction()"></div><br>
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

            
    
    
    

	<div style="margin-left:350px;float:center;margin-bottom:0px;color:blue">

		<div style="float:left;">	
				<div style="float:left;">	<img src="img/nikhil.jpg" style="height:200px;width:200px;margin-top:28px;border-radius:50% 50% 50% 50%;" ></div>
				<div style="height:220px;width:400px;float:right;margin-left:60px;margin-top:50px" >
                                    <h1 style="color:white"><% out.println(u.getName()); %></h1>
					<h2 style="color:white"><% out.println(cat); %> at THE LNMIIT</h2>

				</div></div>
				<div style="float:right;margin-top:15px;margin-right:30px;margin-left:0px" ><br>
									<br><h3 style="height:30px;width:250px;color:white;"><% out.println("DEPARTMENT "+u.getDepartment().toUpperCase()); %></h3>
									<h3 style="height:30px;width:250px;color:white;"><% out.println(bdate); %></h3>
                                                                        <a href="ShowOtherusergroup.jsp"><input type="submit" name="Message" class="btn" value="Groups" style="height:30px;width:250px;"></a><br><br><br>

                                        <%
                                        
                                        
                                        
                                            if(RequestManager.isPresent(Long.parseLong(session.getAttribute("UID").toString()),u.getU_id())==1){
                                                if(RequestManager.getRequestStatus(Long.parseLong(session.getAttribute("UID").toString()),u.getU_id())==1){
                                                    out.println("<input  name=\"Friends\" class=\"btn3\" value=\"You both are Friends\" id=\"myButton1\" style=\"height:30px;margin-top:25px;width:250px;\"><br><br><br></div>");
                                                }
                                                else{
                                                     out.println("<input  name=\"Friends\" class=\"btn3\" value=\"Request sent\" id=\"myButton1\" style=\"height:30px;margin-top:25px;width:250px;\"><br><br><br></div>");

                                                }
                                            }
                                        
                                        
                                        
                                           else if(RequestManager.isPresent(u.getU_id(),Long.parseLong(session.getAttribute("UID").toString()))==1){
                                                if(RequestManager.getRequestStatus(u.getU_id(),Long.parseLong(session.getAttribute("UID").toString()))==1){
                                                    out.println("<input  name=\"Friends\" class=\"btn3\" value=\"you both are Friends\" id=\"myButton1\" style=\"height:30px;margin-top:25px;width:250px;\"><br><br><br></div>");
                                                }
                                                else{
                                                     out.println("<input  onclick=\"aproove("+ u.getU_id() +","+session.getAttribute("UID")+")\"  type=\"button\" name=\"Friends\" class=\"btn3\" value=\"Confirm Request\" id=\"myButton1\" style=\"height:30px;margin-top:25px;width:250px;\"><br><br><br></div>");

                                                }
                                            }
                                           else if(Long.parseLong(session.getAttribute("UID").toString())!=u.getU_id()){
                                                  out.println("<input  onclick=\"add("+ session.getAttribute("UID") +","+u.getU_id()+")\" type=\"button\" name=\"Friends\" class=\"btn3\" value=\"Add Friend\" id=\"myButton1\" style=\"height:30px;margin-top:32px;width:250px;\"><br><br><br></div>");

                                           }
                                        
                                        
                                        
                                        %>
	</div>
</div>

<div style="background-color:#FFFFFF;height:200px;width:665px;color:#61b2ff;margin-left:325px;margin-right:250px;margin-top:15px">

    
    
    
    
</div>
<%
            int i;
            ArrayList<String> a =new ArrayList();
            ArrayList<String> snames =new ArrayList();

            //out.println(Long.parseLong(session.getAttribute("UID").toString()));
            Post.userPostDetails(u.getU_id(),a,snames);
            
            for(i=0;i<a.size();i++){
                
                out.println("<div style=\"background-color:#FFFFFF;height:200px;width:665px;color:#61b2ff;margin-left:325px;margin-right:250px;margin-top:15px\">"+"<P  style=\"margin-left:30px;color:black\"><br><br>"  +snames.get(i)+"  =>  "+u.getName()+"<br><br><br>"+a.get(i)+"</p></div>");

            }
                    
        
        %>


</body>
</html>
