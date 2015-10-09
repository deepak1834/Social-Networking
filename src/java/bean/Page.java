/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author dksh
 */
    
public class Page {
	private long u_id;
        private long p_id;
	private String catagory;
	private String pname;
	private String description;
	
	
	public long getU_id() {
		return u_id;
	}
	public void setU_id(long u_id) {
		this.u_id = u_id;
	}
	public String getCatagory() {
		return catagory;
	}
	public void setCatagory(String category) {
		this.catagory = category;
	}
	public long getP_id() {
		return p_id;
	}
	public void setP_id(long p_id) {
		this.p_id = p_id;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname.toLowerCase();
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
        public  void getPageData(){
            try{
            Connection con = ConnectionProvider.getCon();
             String query = null;
             PreparedStatement ps = con.prepareStatement("select * from page where PAGE_ID=?");
             ps.setLong(1, this.getP_id());
             
             ResultSet rs = ps.executeQuery();
             
           
             rs.next();   
             this.setU_id(rs.getLong("U_ID"));
             this.setPname(rs.getString("NAME"));
             this.setCatagory(rs.getString("CATAGORY"));
             this.setDescription(rs.getString("DESCRIPTION"));
            }
            catch(SQLException e){e.printStackTrace();}
        }
        public void searchPage(String pname,ArrayList pages){
             try {
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement("select PAGE_ID as pid from group where NAME like ? ");
            ps.setString(1,"%"+pname+"%");
           
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {

                Page a = new Page();
                a.setP_id(rs.getLong("pid"));
                a.getPageData();
                pages.add(a);
            }
            //System.out.println(query);

        } catch (Exception e) {
            e.printStackTrace();
        }
        }
        public static int createPage(long userid,Page p){
        
         int status = -1;
      
        try {
            
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps1 = con.prepareStatement("select count(*) as page_count from page");
            ResultSet rs = ps1.executeQuery();
            rs.next();
            p.setP_id(rs.getLong("page_count") + 60000);
            PreparedStatement ps = con.prepareStatement("insert into page values(?,?,?,?,?,?)");
            ps.setLong(1,p.getU_id());
            ps.setLong(2, p.getP_id());
            ps.setInt(3,0);
            ps.setString(4,p.getCatagory());
            ps.setString(5,p.getDescription());
             ps.setString(6,p.getPname());
            
            status = ps.executeUpdate();


        } catch (Exception e) {
            
            e.printStackTrace();
        }

        return status;  
    }
        public static void getUserPages(long uid,ArrayList pagelist){
            try{
            Connection con = ConnectionProvider.getCon();
             
             PreparedStatement ps = con.prepareStatement("select * from page where U_ID=?");
             ps.setLong(1, uid);

             ResultSet rs = ps.executeQuery();
              while(rs.next()){
                  Page p = new Page();
                  p.setP_id(rs.getLong("PAGE_ID"));

                  p.getPageData();

                  pagelist.add(p);
              }
        
            }catch(SQLException e){
                e.printStackTrace();
            }
        }
        
}

