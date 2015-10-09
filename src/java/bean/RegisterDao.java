package bean;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;

public class RegisterDao {

	 public static void getDataForLoginValidation(HashMap users,Connection conn){
         try{
             PreparedStatement ps = conn.prepareStatement("select * from users");
             ResultSet rs =ps.executeQuery();
             while(rs.next()){
                 users.put(rs.getString("email"), rs.getString("password"));
             }
         }catch(SQLException e){
             e.printStackTrace();
         }
     }

    public static int register(User u) {
        int status = 0;

        //System.out.println(u.getName());
        //System.out.println(u.getEmail());
        try {

            //casting of date into sql date format;
            java.util.Date d = u.getBirthDate();
            java.sql.Date s = new java.sql.Date(d.getTime());

            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?,?,?,?)");

            //setting the uid
            String query ;
            query = "select count(*) as users_count from users";
            Statement stmt ;
            HashSet<String> uemail =new HashSet();  
            stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            rs.next();

            u.setU_id(rs.getLong("users_count") + 10000);
            // to check whether a email id exist or not
            query = "select *  from users ";
            rs = stmt.executeQuery(query);
            
            
            while(rs.next()){
                uemail.add(rs.getString("email"));
            }
            if(uemail.contains(u.getEmail())){
                status=-1;
                return status;
            }
            
             else {

                ps.setLong(1, u.getU_id());
                ps.setString(2, u.getEmail());
                ps.setString(3, u.getAddress());
                ps.setString(4, u.getName());
                ps.setString(5, u.getLname());
                ps.setDate(6, s);
                ps.setString(7, u.getPassword());
                ps.setString(8, u.getQue());
                ps.setString(9, u.getAns());
                ps.setLong(10, 100003);
                ps.setString(11, u.getCategory());
                ps.setString(12, u.getDepartment());

                //System.out.println("insert into users values(" + "10000," + "'" + u.getEmail() + "'" + "'" + u.getAddress() + "'" + "," + "'" + u.getName() + "'" + "," + "'" + "fsdf" + "'" + "," + "'" + "1993-01-01" + "'" + "," + "'" + u.getPassword() + "'" + "," + "'" + "MAth" + "'" + "," + "'" + "rs" + "'" + "," + "100003" + "," + "'" + u.getCategory() + "'" + ")");
                status = ps.executeUpdate();
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;

    }

    
    
    public static int matchPassword(long userid,String pass){
       int status;
       status =-1;
        try{
            HashMap up = new HashMap();
            Connection con = ConnectionProvider.getCon();


            PreparedStatement ps = con.prepareStatement("select * from users");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                up.put(rs.getLong("U_ID"),rs.getString("password"));
                
            }
            if(up.get(userid).equals(pass)){
             status=1;   
            }
            else
                status =-1;
            
        }catch(SQLException e){
            e.printStackTrace();
        }
        return status;
    }
    
    

    public static void Usearch(String s, ArrayList Userlist) {
        

        try {
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement("select email as uemail from users where fname like ? ");
            s="%"+s.toLowerCase()+"%";
            ps.setString(1, s);
            ResultSet rs = ps.executeQuery();
            
                           //System.out.println(rs.getString("uemail"));

            while (rs.next()) {

                User a = new User();
                a.setEmail(rs.getString("uemail"));
                a.getUserData();

                Userlist.add(a);
                
            }
            //System.out.println(query);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

   
    public static void catagorizedSearch(String name,int lowerage,int upperage,String city,String dep,String catagory,ArrayList Userlist){
         

        try {
            Connection con = ConnectionProvider.getCon();

            String query =null ;
            Statement stmt ;
            if(lowerage!=-1 && upperage!=-1 && !name.equals("empty") && !city.equals("empty") && !catagory.equals("empty") &&!dep.equals("empty"))
            query = "select email as uemail from users where fname like" + "(%'" + name.toLowerCase() + "%')" +" and ADDRESS='" +city+"' AND ((current date)- dob)>="+lowerage +" AND ((current date)- dob)<=" + upperage + " AND department= '" + dep +"' AND catagory='"+ catagory+"'" ;
           
            else if(lowerage!=-1 && upperage!=-1 && !name.equals("empty") && !city.equals("empty") && catagory.equals("empty") && !dep.equals("empty"))
            query = "select email as uemail from users where fname like" + "(%'" + name.toLowerCase() + "%')" +" and ADDRESS='" +city+"' AND ((current date)- dob)>="+lowerage +" AND ((current date)- dob)<=" + upperage + " AND department= '" + dep  ;
            
            else if(lowerage!=-1 && upperage!=-1 && !name.equals("empty") && !city.equals("empty") && !catagory.equals("empty") && dep.equals("empty"))
            query = "select email as uemail from users where fname like" + "(%'" + name.toLowerCase() + "%')" +" and ADDRESS='" +city+"' AND ((current date)- dob)>="+lowerage +" AND ((current date)- dob)<=" + upperage + " AND catagory='"+ catagory+"'" ;
            
            else if((lowerage==-1 && upperage==-1) && !name.equals("empty") && !city.equals("empty") && !catagory.equals("empty") &&!dep.equals("empty"))
            query = "select email as uemail from users where fname like" + "(%'" + name.toLowerCase() + "%')" +" and ADDRESS='" +city+"' AND  department= '" + dep +"' AND catagory='"+ catagory+"'" ;
            
            else if(lowerage!=-1 && upperage!=-1 && !name.equals("empty") && city.equals("empty") && !catagory.equals("empty") &&!dep.equals("empty"))
            query = "select email as uemail from users where fname like" + "(%'" + name.toLowerCase() + "%')" +" AND ((current date)- dob)>="+lowerage +" AND ((current date)- dob)<=" + upperage + " AND department= '" + dep +"' AND catagory='"+ catagory+"'" ;

            else if(lowerage!=-1 && upperage!=-1 && !name.equals("empty") && !city.equals("empty") && catagory.equals("empty") && dep.equals("empty"))
            query = "select email as uemail from users where fname like" + "(%'" + name.toLowerCase() + "%')" +" and ADDRESS='" +city+"' AND ((current date)- dob)>="+lowerage +" AND ((current date)- dob)<=" + upperage  ;
            
            else if(lowerage!=-1 && upperage!=-1 && !name.equals("empty") && city.equals("empty") && catagory.equals("empty") &&!dep.equals("empty"))
            query = "select email as uemail from users where fname like" + "(%'" + name.toLowerCase() + "%')" +"  AND ((current date)- dob)>="+lowerage +" AND ((current date)- dob)<=" + upperage + " AND department= '" + dep +"'";
            
            else if(lowerage!=-1 && upperage!=-1 && !name.equals("empty") && city.equals("empty") && !catagory.equals("empty") && dep.equals("empty"))
            query = "select email as uemail from users where fname like" + "(%'" + name.toLowerCase() + "%')  AND ((current date)- dob)>="+lowerage +" AND ((current date)- dob)<=" + upperage + "  AND catagory='"+ catagory+"'" ;
            
            else if(lowerage==-1 && upperage==-1 && !name.equals("empty") && !city.equals("empty") && catagory.equals("empty") &&!dep.equals("empty"))
            query = "select email as uemail from users where fname like" + "(%'" + name.toLowerCase() + "%')" +" and ADDRESS='" +city+"'  AND department= '" + dep +"'" ;
            
            else if(lowerage==-1 && upperage==-1 && !name.equals("empty") && !city.equals("empty") && !catagory.equals("empty") && dep.equals("empty"))
            query = "select email as uemail from users where fname like" + "(%'" + name.toLowerCase() + "%')" +" and ADDRESS='" +city+"'  AND catagory='"+ catagory+"'" ;
            
            else if(lowerage==-1 && upperage==-1 && !name.equals("empty") && city.equals("empty") && !catagory.equals("empty") &&!dep.equals("empty"))
            query = "select email as uemail from users where fname like" + "(%'" + name.toLowerCase() + "%')" +"  AND department= '" + dep +"' AND catagory='"+ catagory+"'" ;
            
            else if(lowerage!=-1 && upperage!=-1 && !name.equals("empty") && city.equals("empty") && catagory.equals("empty") &&dep.equals("empty"))
            query = "select email as uemail from users where fname like" + "(%'" + name.toLowerCase() + "%')" +"  AND ((current date)- dob)>="+lowerage +" AND ((current date)- dob)<=" + upperage  ;
            
            else if(lowerage==-1 && upperage==-1 && !name.equals("empty") && !city.equals("empty") && catagory.equals("empty") && dep.equals("empty"))
            query = "select email as uemail from users where fname like" + "(%'" + name.toLowerCase() + "%')" +" and ADDRESS='" +city+"'";
            
            else if(lowerage==-1 && upperage==-1 && !name.equals("empty") && city.equals("empty") && !catagory.equals("empty") && dep.equals("empty"))
            query = "select email as uemail from users where fname like" + "(%'" + name.toLowerCase() + "%') AND catagory='"+ catagory+"'" ;
            
            else if(lowerage==-1 && upperage==-1 && !name.equals("empty") && city.equals("empty") && catagory.equals("empty") &&!dep.equals("empty"))
            query = "select email as uemail from users where fname like" + "(%'" + name.toLowerCase() + "%')" +"  AND ((current date)- dob)<=" + upperage + " AND department= '" + dep +"'" ;
            
            else if(lowerage ==-1 && upperage ==-1 && !name.equals("empty") && city.equals("empty") && catagory.equals("empty") && dep.equals("empty"))
            query = "select email as uemail from users where fname like" + "(%'" + name.toLowerCase() + "%')";
            
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery(query);
            System.out.println(query);
            while (rs.next()) {

                User a = new User();
                a.setEmail(rs.getString("uemail"));
                a.getUserData();
                Userlist.add(a);
            }
            //System.out.println(query);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    

}
