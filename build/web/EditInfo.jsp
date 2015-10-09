
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" >
    <head>
        <title>Edit INFO</title>
        <link href="css/styles.css" rel="stylesheet">
            <meta name="robots" content="noindex,follow" />
                <link rel="stylesheet" href="css/style.css">
                    
                <link rel="shortcut icon" href="http://designshack.net/favicon.ico">
        <link rel="icon" href="http://designshack.net/favicon.ico">
        <link rel="stylesheet" type="text/css" media="all" href="style.css">
        <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" charset="utf-8" src="js/jquery.leanModal.min.js"></script>
         <script type="text/javascript" src="http://ajax.googleapis.com/ajax/
        libs/jquery/1.3.0/jquery.min.js"></script>
        <script type="text/javascript" >
                       
            
            
            
            //send a friend request
            function editinfo(flag) {
                    
                    //var lname = document.getElementById('lname');
                    //var city  = document.getElementById('city');
                    //var pass  = document.getElementById('password');
                //
                // 
                //  
                //    just for the shake of notification in the handler whether there is a function call for sending re or aprooval
                     if(flag==1){
                            var fname = document.getElementById('fname');
                            var dataString = 'info=' + fname.value + '&flag=' +flag  ;
                            
                      }
                     else if(flag==2){
                           var lname  = document.getElementById('lname');
                           var dataString = 'info=' + lname.value + '&flag=' +flag  ;
                     }
                     else if(flag==3){
                        var city  = document.getElementById('city');
                        var dataString = 'info=' + city.value + '&flag=' +flag  ;
                    }
                     else if(flag==4){
                         var pass = document.getElementById('password');
                         var dataString = 'info=' + pass.value + '&flag=' +flag  ;
                    }


                      // AJAX code to submit form.
                    $.ajax({
                      
                        type: "POST",
                        url: "infoedit.jsp",
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
                <a href="#">Settings</a>
            </li>
            <li id="search">
                <form action="searchresult.jsp" method="post">
                    <input type="text" name="fname" id="search_text" placeholder="Search"   autocomplete="off"/>
                    <input type="button" name="search_button" id="search_button"></a>
                </form>
            </li>
            <li>
                <a href="">Edit</a>
            </li>
            <li>
                <a href="logout.jsp">Logout</a>
            </li>
</ul>
            <br>
                <br>
                    <br>
                         <br>
                             <br>
            
                                 
                                 
                                 
                                 
                                 
                                  <div class="login-card" style="margin-top:20px;width:600px;">

    <b><h1 style="margin-top:20px">Settings</h1></b>
    <hr>
 
        <h2>First Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<form><input type="text" id="fname" name="user" placeholder="First Name" style="width:170px;height:28px" autocomplete="off" required >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button"  onclick ="editinfo(1)" name="login" class="login login-submit" value="update" style="width:70px;height:30px;display:inline;"></form><hr>
   Last Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<form><input type="text"  id="lname"   name="user" placeholder="Last Name" style="width:170px;height:28px" autocomplete="off" required>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp<input type="button"     onclick ="editinfo(2)"          name="login" class="login login-submit" value="update" style="width:70px;height:30px;display:inline;"></form><hr>
                   City&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<form><input type="text" id ="city"  name="user" placeholder="City" style="width:170px;height:28px" autocomplete="off" required>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button"   onclick ="editinfo(3)"      name="login" class="login login-submit" value="update" style="width:70px;height:30px;display:inline;"></form><hr></h2>
   <h2>
       <form>
   Old password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password"  id="password" name="user" placeholder="Old Password" style="width:170px;height:28px" required><br>
   New password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="user" placeholder="New Password" style="width:170px;height:28px" autocomplete="off" required><br>
  Confirm password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="user" placeholder="New Password" style="width:170px;height:28px" autocomplete="off" required><br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button"  onclick="editinfo(4)"   name="login" class="login login-submit" value="update" style="width:70px;height:30px;display:inline;margin-left:320px" >
      </form>
      </h2>

   <hr>
                                 
                                 
                                 
                                 
            
                <br>
                </body>
                </html>
