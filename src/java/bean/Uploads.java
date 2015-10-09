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
public class Uploads {
    private long fileid;
    private long uid;
    private String filepath;
    private String filename;
    private String filetype;
    private long filedest;

    public void setFiledest(long filedest) {
        this.filedest = filedest;
    }

    public long getFiledest() {
        return filedest;
    }

    public void setFileid(long fileid) {
        this.fileid = fileid;
    }

    public void setUid(long uid) {
        this.uid = uid;
    }

    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public void setFiletype(String filetype) {
        this.filetype = filetype;
    }

    public long getFileid() {
        return fileid;
    }

    public long getUid() {
        return uid;
    }

    public String getFilepath() {
        return filepath;
    }

    public String getFilename() {
        return filename;
    }

    public String getFiletype() {
        return filetype;
    }
    
    
    
    public int uploadFile(Uploads f,long dest){
          int status = -1;
      
        try {
            
            Connection con = ConnectionProvider.getCon();
            
            String query ;
            
            query = "select count(*) as file_count from uploads";
            
            Statement stmt ;
            stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            rs.next();
           
            f.setFileid(500000 + rs.getInt("file_count"));
            

            PreparedStatement ps = con.prepareStatement("insert into group values(?,?,?,?,?)");
            ps.setLong(1, f.getUid());
            ps.setString(2, f.getFilepath());
            ps.setLong(3,f.getFileid());
            ps.setString(4, f.getFiletype());
            ps.setString(5, f.getFilename());
            ps.setLong(6, f.getFiledest());
            status = ps.executeUpdate();


        } catch (Exception e) {
            
            e.printStackTrace();
        }

        return status;  
    }

    
    public void getFileDetails(){
         try{
            Connection con = ConnectionProvider.getCon();
             String query = null;
             query = "select * from uploads where =FILE_ID" + this.getFileid();
             Statement stmt = null;
             stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(query);
             
           
             rs.next();   
             this.setUid(rs.getLong("U_ID"));
             this.setFilename(rs.getString("name"));
             this.setFilepath(rs.getString("file_path"));
             this.setFiletype(rs.getString("type"));
             this.setFiledest(rs.getLong("D_ID"));

            }
            catch(SQLException e){e.printStackTrace();}
    }
    
    
    
    public void getUploads(long Id,ArrayList ups){
        try{
            Connection con = ConnectionProvider.getCon();
            String query ;
            //whom user sent the friend requests
          
                query = "select file_id from uploads where D_ID="+Id;
                
            Statement stmt ;
            stmt = con.createStatement();  
            ResultSet rs = stmt.executeQuery(query);
        
            while(rs.next()){
             Uploads f = new Uploads();
             f.setFileid(rs.getLong("file_id"));
             f.getFileDetails();
             ups.add(f);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
   public  int  getUserUpCount(long Id){
       int count;
       count =-1;
       try{
            Connection con = ConnectionProvider.getCon();
            String query ;
            //whom user sent the friend requests 
            query = "select count(*) as upcount from uploads where D_ID="+Id;
            Statement stmt ;
            stmt = con.createStatement();  
            ResultSet rs = stmt.executeQuery(query);
            rs.next();
            count = rs.getInt("upcount");
            
        }catch(SQLException e){
            e.printStackTrace();
        }
       return count;
   }
}
