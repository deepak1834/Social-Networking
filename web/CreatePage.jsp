




<%@page import="bean.Page"%>
<%


    Page p =new Page();
    p.setPname(request.getParameter("pname").toString().toLowerCase());
    p.setDescription(request.getParameter("des").toString());
    p.setU_id(Long.parseLong(session.getAttribute("UID").toString()));
    p.setCatagory(request.getParameter("cat"));
    int status;
    /*out.println(p.getU_id());
    out.println(p.getDescription());
    out.println(p.getPname());
    out.println(p.getCatagory());
    */

    status = Page.createPage(p.getU_id(), p);
    if(status>0){
        out.println("Page Created");
    }
    else{
                out.println("there was some problem in creating the page");

    }






%>