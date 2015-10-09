
package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class GroupManager {
    
  
    
    
    
    public static int createGroup(long userid,Group g){
        
         int status = -1;
      
        try {
            
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps1 = con.prepareStatement("select count(*) as group_count from group");
            ResultSet rs = ps1.executeQuery();
            rs.next();
            g.setG_id(rs.getLong("group_count") + 50000);
            PreparedStatement ps = con.prepareStatement("insert into group values(?,?,?,?,?)");
            ps.setLong(1,g.getU_id());
            ps.setLong(2, g.getG_id());
            ps.setInt(3,1);
            ps.setString(4,g.getGname());
            ps.setString(5,g.getCatagory()); 
            status = ps.executeUpdate();
        } catch (Exception e) {
            
            e.printStackTrace();
        }

        return status;  
    }
    
     public static void getMembers(long grpid,ArrayList members) {
       try{
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement("select email from users inner join connection on users.U_ID=connection.S_ID where status=1 and D_ID=?");
            ps.setLong(1,grpid);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
             User u = new User();
             u.setEmail(rs.getString("EMAIL"));
             u.getUserData();
             members.add(u);
            }
        
       }
       catch(SQLException e){
           e.printStackTrace();
       }
     }
     public static void getUserGroups(long uid,ArrayList grplist){
            try{
            Connection con = ConnectionProvider.getCon();
             PreparedStatement ps = con.prepareStatement("select * from group where U_ID=?");
             ps.setLong(1,uid);
             ResultSet rs = ps.executeQuery();
              while(rs.next()){
                  Group g = new Group();
                  g.setG_id(rs.getLong("G_ID"));
                  g.getGroupData();
                  grplist.add(g);
              }
        
            }catch(SQLException e){
                e.printStackTrace();
            }
        }
     public static void getUserJoinedGroups(long uid,ArrayList grplist ){
            try{
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement("select * from connection where status=1 and D_ID in(select G_ID from group) and S_ID=?");
            ps.setLong(1,uid);
             ResultSet rs = ps.executeQuery();
              while(rs.next()){
                  Group g = new Group();
                  g.setG_id(rs.getLong("D_ID"));
                  g.getGroupData();
                  grplist.add(g);

              }

            }catch(SQLException e){
                e.printStackTrace();
            }
        }
     
     
     
     
              
}
     
     
    
