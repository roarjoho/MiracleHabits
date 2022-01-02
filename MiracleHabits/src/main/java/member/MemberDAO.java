package member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
    Connection con = null;
    PreparedStatement pstmt = null;
    String sql = null;
    ResultSet rs = null;
    
    private Connection getConnection() throws Exception {//xml파일 활용하여 db연결정보 가져오기
            //1. context.xml 사용하기 위해 객체 생성
            Context init = new InitialContext();
            //2. context.xml 자원의 이름을 불러오기(찾기) look("자원저장위치/자원이름")
            DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
            //3. 불러온 자원 javax.sql.DataSource를 Connection으로 변경하기
            con = ds.getConnection();           
        return con;          
    }//get Connection---------------------------------------------------
    
    public void objectClose() {
        if(pstmt!=null) {
            try{pstmt.close();}
            catch (Exception e) {}
        }
        if(con!=null) {
            try {con.close();}
            catch (Exception e2) {}
        }
    }//object Close---------------------------------------------------
    
    public void insertMember(MemberDTO datas) {
        System.out.println("MemberDAO - insertMember() 실행");
        try {
            con=getConnection();
             
            sql = "insert into mira_member(id,pass,name,date,email,address,address_detail,postalNum,phone,mobile) values(?,?,?,?,?,?,?,?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, datas.getId());
            pstmt.setString(2,datas.getPass());
            pstmt.setString(3,datas.getName());
            pstmt.setTimestamp(4,datas.getDate());
            pstmt.setString(5,datas.getEmail());
            pstmt.setString(6,datas.getAddress());
            pstmt.setString(7,datas.getAddress_detail());
            pstmt.setInt(8,datas.getPostalNum());
            pstmt.setString(9,datas.getPhone());
            pstmt.setString(10,datas.getMobile());
            
            pstmt.executeUpdate();
            
        } catch (Exception e) {
            System.out.println("insertMember()에서 예외가 발생했습니다.");
            e.printStackTrace();
        } finally {
            System.out.println("insertMember() final code");
            objectClose(); // 기억장소를 삭제
        }        
    }//insert Member---------------------------------------------------
   
    public MemberDTO checkMember(String id, String pass) {
        MemberDTO memberDTO = null;
        try {
            con=getConnection(); con=getConnection();
            sql = "select * from mira_member where id=? and pass=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, pass);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                memberDTO = new MemberDTO();// 일치하는 경우에 MemberDTO객체를 생성한다.
                memberDTO.setId(rs.getString("id"));
                /*memberDTO.setPass(rs.getString("pass"));
                memberDTO.setName(rs.getString("name"));
                memberDTO.setDate(rs.getTimestamp("date"));
                memberDTO.setEmail(rs.getString("email"));
                memberDTO.setAddress(rs.getString("address"));
                memberDTO.setPhone(rs.getString("phone"));
                memberDTO.setMobile(rs.getString("mobile"));
                */
            } else {
                memberDTO=null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            System.out.println("checkMember() final code");
            objectClose();
        }
        return memberDTO;
    }//check Member---------------------------------------------------
    
    public MemberDTO getMember(String id) {
        MemberDTO memberDTO = null;
        try {
            con = getConnection();
            sql = "select * from mira_member where id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,id);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                memberDTO = new MemberDTO();// 일치하는 경우에 MemberDTO객체를 생성한다.
                memberDTO.setId(rs.getString("id"));
                memberDTO.setPass(rs.getString("pass"));
                memberDTO.setName(rs.getString("name"));
                memberDTO.setDate(rs.getTimestamp("date"));
                memberDTO.setEmail(rs.getString("email"));
                memberDTO.setAddress(rs.getString("address"));
                memberDTO.setAddress_detail(rs.getString("address_detail"));
                memberDTO.setPhone(rs.getString("phone"));
                memberDTO.setMobile(rs.getString("mobile"));
                memberDTO.setPostalNum(rs.getInt("postalNum"));
            } else {
                memberDTO=null;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            System.out.println("getMember() final code");
            objectClose();
        }
        
        return memberDTO;
        
    }//get Member---------------------------------------------------
    
    public void updateMember(MemberDTO datas) {        
        try {
            con = getConnection();
            sql = "update mira_member set name=?,email=?,address=?,address_detail=?,postalNum=?, phone=?,mobile=? where id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,datas.getName());
            pstmt.setString(2,datas.getEmail());
            pstmt.setString(3,datas.getAddress());
            pstmt.setString(4,datas.getAddress_detail());
            pstmt.setInt(5,datas.getPostalNum());
            pstmt.setString(6,datas.getPhone());
            pstmt.setString(7,datas.getMobile());
            pstmt.setString(8,datas.getId());
            pstmt.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            System.out.println("updateMember() final code");
            objectClose();
        }
        return;
    }//update Member---------------------------------------------------
    
    public void deleteMember(MemberDTO memberDTO) {
        try {
            con = getConnection();
            sql = "delete from mira_member where id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, memberDTO.getId());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            System.out.println("deleteMember() final code");
            objectClose();
        }
    }
    
}
