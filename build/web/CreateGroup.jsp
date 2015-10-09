



<%@page import="bean.GroupManager"%>
<%@page import="bean.Group"%>
<%


    Group g =new Group();
    g.setGname(request.getParameter("gname"));
    g.setU_id(Long.parseLong(session.getAttribute("UID").toString()));
    g.setCatagory(request.getParameter("cat"));
    int status;
    status = GroupManager.createGroup(g.getU_id(), g);
    if(status>0){
        out.println("Group Created");
    }
    else{
                out.println("there was some problem in creating the group");

    }






%>