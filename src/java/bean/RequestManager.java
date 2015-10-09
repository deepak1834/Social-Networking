package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class RequestManager {

    public static int friendsGm(long source, long destination) {

        int status = -1;

        try {
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement("insert into connection values(?,?,?)");
            ps.setLong(1, source);
            ps.setLong(2, destination);
            ps.setInt(3, 0);

            status = ps.executeUpdate();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return status;

    }

    public static void getFriends(long userid, ArrayList friends) throws SQLException {
        try {
            Connection con = ConnectionProvider.getCon();

            PreparedStatement ps = con.prepareStatement("select EMAIL,S_ID,D_ID from users inner join connection on users.U_ID=connection.D_ID where STATUS=1 AND S_ID=?");
            ps.setLong(1, userid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User u = new User();
                u.setEmail(rs.getString("EMAIL"));
                u.getUserData();
                friends.add(u);
            }
       
            PreparedStatement ps1 = con.prepareStatement("select EMAIL,S_ID,D_ID from users inner join connection on users.U_ID=connection.D_ID where STATUS=1 AND D_ID=?");
            ps1.setLong(1, userid);
            ResultSet rs1 = ps1.executeQuery();

            while (rs1.next()) {
                User u = new User();
                u.setEmail(rs1.getString("EMAIL"));
                u.getUserData();
                friends.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static int aprooveRequest(long source, long destination) {

        int status = -1;
        try {

            Connection con = ConnectionProvider.getCon();

            PreparedStatement ps = con.prepareStatement("update connection set STATUS=1 where S_ID =? and status=0 AND D_ID=?");
            ps.setLong(1, source);
            ps.setLong(2, destination);
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    public static int getRequestStatus(long source, long destination) {
        int status;
        status = 0;
        try {
            Connection con = ConnectionProvider.getCon();

            PreparedStatement ps = con.prepareStatement("select status as st from connection where S_ID =? AND D_ID=?");
            ps.setLong(1, source);
            ps.setLong(2, destination);
            ResultSet rs = ps.executeQuery();
            rs.next();
            if (rs.getInt("st") == 1) {
                status = 1;
            } else {
                status = 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    public static int isPresent(long source, long destination) {
        int status;
        status = 0;
        try {
            Connection con = ConnectionProvider.getCon();

            PreparedStatement ps = con.prepareStatement("select count(*) as pr from connection where S_ID =? AND D_ID=?");
            ps.setLong(1, source);
            ps.setLong(2, destination);
            ResultSet rs = ps.executeQuery();
           

            rs.next();
            if (rs.getInt("pr") == 1) {
                status = 1;
            } else {
                status = 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    public static void showPendingRequest(long source, ArrayList pending) {
        try {
            Connection con = ConnectionProvider.getCon();
  
            PreparedStatement ps = con.prepareStatement("select EMAIL,S_ID,D_ID from users inner join connection on users.U_ID=connection.S_ID where STATUS=0 AND D_ID=?");
            ps.setLong(1, source);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User u = new User();
                u.setEmail(rs.getString("EMAIL"));
                u.getUserData();
                pending.add(u);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void pendingGroupRequest(long uid, ArrayList group, ArrayList sender) {
        try {
            Connection con = ConnectionProvider.getCon();

            PreparedStatement ps = con.prepareStatement("select email,G_ID from connection inner join users on connection.S_ID=users.U_ID inner join group on connection.D_ID=group.G_ID where status=0 and group.U_ID=?");
            ps.setLong(1, uid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User u = new User();
                Group g = new Group();
                u.setEmail(rs.getString("EMAIL"));
                u.getUserData();
                g.setG_id(rs.getLong("G_ID"));
                g.getGroupData();
                sender.add(u);
                group.add(g);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
