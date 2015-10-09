/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author dksh
 */
    
public class Group {
	private long u_id;
	private long g_id;
	private int nom;
        private String gname;
        private String catagory;

    public void setGname(String gname) {
        this.gname = gname.toLowerCase();
    }

    public void setCatagory(String catagory) {
        this.catagory = catagory.toLowerCase();
    }

    public String getGname() {
        return gname;
    }

    public String getCatagory() {
        return catagory;
    }
	public long getU_id() {
		return u_id;
	}
	public void setU_id(long u_id) {
		this.u_id = u_id;
	}
	public long getG_id() {
		return g_id;
	}
	public void setG_id(long g_id) {
		this.g_id = g_id;
	}
	public int getNom() {
		return nom;
	}
	public void setNom(int nom) {
		this.nom = nom;
	}
        public  void getGroupData(){
            try{
            Connection con = ConnectionProvider.getCon();
             
             PreparedStatement ps = con.prepareStatement("select * from group where G_ID=?");
             ps.setLong(1,this.getG_id());
             ResultSet rs = ps.executeQuery();      
             rs.next();   
             this.setU_id(rs.getLong("U_ID"));
             this.setGname(rs.getString("g_name"));
             this.setNom(rs.getInt("nom"));
             this.setCatagory(rs.getString("gcatagory"));
            }
            catch(SQLException e){e.printStackTrace();}
        }
        public void searchGroup(String gname,ArrayList groups){
             try {
            Connection con = ConnectionProvider.getCon();

             PreparedStatement ps = con.prepareStatement("select G_ID as gid from group where G_NAME like ?");
            ps.setString(1,"%"+this.getGname().toLowerCase()+"%");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                Group a = new Group();
                a.setG_id(rs.getLong("gid"));
                a.getGroupData();
                groups.add(a);
            }
            

        } catch (Exception e) {
            e.printStackTrace();
        }
        }
}

