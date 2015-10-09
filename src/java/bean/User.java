package bean;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


public class User {
	private long  u_id;
	private String email;
	private int u_picId;
	private String name;
        private String lname;
        private Date  birthdate;  
	private String address;
	private String password;
	private String que;
	private String ans;
	private String category;
	private String department;

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String dep) {
        if(dep.charAt(1)=='0' || dep.equals("cse"))
        this.department = "cse";
        else if(dep.charAt(1)=='1' || dep.equals("ece"))
            this.department = "ece";
        else if(dep.charAt(1)=='2' ||dep.equals("cce"))
            this.department = "cce";
        else if(dep.charAt(1)=='3' || dep.equals("mme"))
            this.department = "mme";

    }
	public long getU_id() {
		return u_id;
	}
	public void setU_id(long u_id) {
		this.u_id = u_id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
                            

		this.email = email.toLowerCase();
	}
	public int getU_picId() {
		return u_picId;
	}
	public void setU_picId(int u_picId) {
		this.u_picId = u_picId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name.toLowerCase();
	}
        public String getLname() {
		return lname;
	}
	public void setLname(String name) {
                
		this.lname = name.toLowerCase();
	}
        public Date getBirthDate() {
		return birthdate;
	}

   
    public void setBirthDate(String date) {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                Date d =new Date(4);
           
            try {
                 
                d = formatter.parse(date);
                //System.out.println(date);
            } catch (ParseException ex) {
                ex.printStackTrace();
                Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            }
		this.birthdate = d;
	}
        
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getQue() {
		return que;
	}
	public void setQue(String que) {
		this.que = que;
	}
	public String getAns() {
		return ans;
	}
	public void setAns(String ans) {
                        System.out.println("hiiii"+ans);

		this.ans = ans;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
        
        
        
        public void getUserData() throws SQLException{
             Connection con = ConnectionProvider.getCon();
             PreparedStatement ps = con.prepareStatement("select * from users where email= ?");
             ps.setString(1,this.getEmail());
             ResultSet rs = ps.executeQuery();
             rs.next();   
             this.setU_id(rs.getLong("U_ID"));
             this.setEmail(rs.getString("EMAIL"));
             this.setAddress(rs.getString("ADDRESS"));
             this.setName(rs.getString("FNAME"));
             this.setLname(rs.getString("LNAME")); 
             this.setBirthDate(rs.getString("DOB")); 
             this.setPassword(rs.getString("PASSWORD"));
             this.setQue(rs.getString("S_QUES"));
             this.setAns(rs.getString("S_ANS"));
             this.setU_picId(rs.getInt("U_PICID"));
             this.setCategory(rs.getString("CATAGORY"));
             this.setDepartment(rs.getString("DEPARTMENT")); 
        }    
        
       public static int changeInfo(String attribute, int flag,long uid){
           int status;
           status =0;
           try{
               Connection con = ConnectionProvider.getCon();
               PreparedStatement ps=con.prepareStatement("");
               String query=new String();
               if(flag==1){
                      ps = con.prepareStatement("update users set fname = ?  where U_ID=?");
                     ps.setString(1, attribute);
                     ps.setLong(2,uid);
               }
               else if(flag==2){
                  ps = con.prepareStatement("update users set lname = ?  where U_ID=?");
                 ps.setString(1, attribute);
                 ps.setLong(2,uid);

               }
               else if(flag==3){
                    ps = con.prepareStatement("update users set address = ?  where U_ID=?");
                  ps.setString(1, attribute);
                   ps.setLong(2,uid);

               }
               else if(flag==4){
                   ps = con.prepareStatement("update users set password = ?  where U_ID=?");
                   ps.setString(1, attribute);
                   ps.setLong(2,uid);

               }
               
               status = ps.executeUpdate(query);
               
           }catch(SQLException e){
               e.printStackTrace();
           }
           return status;
       } 
      
        
}