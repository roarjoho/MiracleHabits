package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
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
    
    public List<BoardDTO> getImageList(int startRow, int pageSize){
        List<BoardDTO> imageList = new ArrayList<BoardDTO>();
        try {
            con=getConnection();
            
            
            
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            objectClose();
        }         
        return imageList;
    }
    
    public List<BoardDTO> getBoardList(int startRow, int pageSize){
        List<BoardDTO> boardList = new ArrayList<BoardDTO>();
        try {
            con=getConnection();
            // select * from board order by num desc limit 시작행-1, 가져올개수
            sql="select * from mira_board order by num desc limit ?, ?";
            pstmt=con.prepareStatement(sql);
            pstmt.setInt(1, startRow-1);
            pstmt.setInt(2, pageSize);
            rs=pstmt.executeQuery();
            
            // 5 결과 => 글하나 BoardDTO 에 저장 => boardList한칸에 글하나 저장 
            while(rs.next()){
                // 행 게시판글 하나를 BoardDTO에 저장
                BoardDTO boardDTO=new BoardDTO();
                // 디비에서 열 => 멤버변수에 저장
                boardDTO.setNum(rs.getInt("num"));
                boardDTO.setName(rs.getString("name"));
                boardDTO.setPass(rs.getString("pass"));
                boardDTO.setSubject(rs.getString("subject"));
                boardDTO.setContent(rs.getString("content"));
                boardDTO.setReadcount(rs.getInt("readcount"));
                boardDTO.setDate(rs.getTimestamp("date"));
                // 글하나를 배열 한칸에 저장 
                boardList.add(boardDTO);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            objectClose();
        }
        return boardList;
    }//getBoardList()
    
    public List<BoardDTO> getBoardList(int startRow, int pageSize, String search){
        List<BoardDTO> boardList = new ArrayList<BoardDTO>();
        try {
            con=getConnection();
            // select * from board order by num desc limit 시작행-1, 가져올개수
            sql="select * from mira_board where subject like ? order by num desc limit ?, ?";
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1, "%"+search+"%");
            pstmt.setInt(2, startRow-1);
            pstmt.setInt(3, pageSize);
            rs=pstmt.executeQuery();
            
            // 5 결과 => 글하나 BoardDTO 에 저장 => boardList한칸에 글하나 저장 
            while(rs.next()){
                // 행 게시판글 하나를 BoardDTO에 저장
                BoardDTO boardDTO=new BoardDTO();
                // 디비에서 열 => 멤버변수에 저장
                boardDTO.setNum(rs.getInt("num"));
                boardDTO.setName(rs.getString("name"));
                boardDTO.setPass(rs.getString("pass"));
                boardDTO.setSubject(rs.getString("subject"));
                boardDTO.setContent(rs.getString("content"));
                boardDTO.setReadcount(rs.getInt("readcount"));
                boardDTO.setDate(rs.getTimestamp("date"));
                // 글하나를 배열 한칸에 저장 
                boardList.add(boardDTO);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            objectClose();
        }
        return boardList;
    }//getBoardList()
    
    public int getBoardCount() {
        int count=0;
        try {
            //1,2 단계 디비연결 메서드 호출
            con=getConnection();
            // 3단계 sql select count(*) from board;
            sql="select count(*) from mira_board";
            pstmt=con.prepareStatement(sql);
            // 4단계 실행 => 결과저장 
            rs=pstmt.executeQuery();
            // 5단계 결과 if 출력 
            if(rs.next()) {
                count=rs.getInt("count(*)");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            objectClose();
        }
        return count;
    }
    
    public int getBoardCount(String search) {
        int count=0;
        try {
            //1,2 단계 디비연결 메서드 호출
            con=getConnection();
            // 3단계 sql select count(*) from board;
            sql="select count(*) from mira_board where subject like ?";
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1, "%"+search+"%");
            // 4단계 실행 => 결과저장 
            rs=pstmt.executeQuery();
            // 5단계 결과 if 출력 
            if(rs.next()) {
                count=rs.getInt("count(*)");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            objectClose();
        }
        return count;
    }
    
    public void updateReadcount(int num) {
        try {
            con=getConnection();
            sql="update mira_board set readcount=readcount+1 where num=?";
            pstmt=con.prepareStatement(sql);
            pstmt.setInt(1, num);
            //4단계 실행
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            objectClose();
        }
    }//updateReadcount(num);
    
    public BoardDTO getBoard(int num) {
        BoardDTO boardDTO=new BoardDTO();
        try {
            con=getConnection();
            sql="select * from mira_board where num=?";
            pstmt=con.prepareStatement(sql);
            pstmt.setInt(1, num);
            rs=pstmt.executeQuery();
            if(rs.next()) {// 첫번째 행 =>true => 열접근 => boardDTO 멤버변수에 저장
                boardDTO.setNum(rs.getInt("num"));
                boardDTO.setName(rs.getString("name"));
                boardDTO.setPass(rs.getString("pass"));
                boardDTO.setSubject(rs.getString("subject"));
                boardDTO.setContent(rs.getString("content"));
                boardDTO.setReadcount(rs.getInt("readcount"));
                boardDTO.setDate(rs.getTimestamp("date"));
                boardDTO.setFile(rs.getString("file"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            objectClose();
        }
        return boardDTO;
    }//getBoard()
    
    public void insertBoard(BoardDTO boardDTO) {
        try {
            con=getConnection();
            int num=0;
            sql="select max(num) from mira_board";
            pstmt=con.prepareStatement(sql);
            // 4단계 실행 => 결과 저장 
            rs=pstmt.executeQuery();
            // 5단계 결과에 다음행으로 접근 max(num) +1 
            if(rs.next()){
                num=rs.getInt("max(num)")+1;
            }
            // 3단계 sql insert
            sql="insert into mira_board(num,name,pass,subject,content,readcount,date,file) values(?,?,?,?,?,?,?,?)";
            pstmt=con.prepareStatement(sql);
            pstmt.setInt(1, num);
            pstmt.setString(2, boardDTO.getName());
            pstmt.setString(3, boardDTO.getPass());
            pstmt.setString(4, boardDTO.getSubject());
            pstmt.setString(5, boardDTO.getContent());
            pstmt.setInt(6, boardDTO.getReadcount());
            pstmt.setTimestamp(7, boardDTO.getDate());
            pstmt.setString(8, boardDTO.getFile());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            objectClose();
        }
    }//insertBoard()
    
    public BoardDTO numCheck(int num, String pass) {
        BoardDTO boardDTO=null;
        try {
            con=getConnection();
            // 3단계 sql select * from board where num=? and pass=?;
            sql="select * from mira_board where num=? and pass=?";
            pstmt=con.prepareStatement(sql);
            pstmt.setInt(1, num);
            pstmt.setString(2, pass);
            rs=pstmt.executeQuery();
            // 5단계 결과 if 출력 결과가 있으면 rs.next() true 
            if(rs.next()) {
                //첫행 => true => 일치 => BoardDTO 객체생성 주소값 저장
                boardDTO=new BoardDTO();
                boardDTO.setNum(rs.getInt("num"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            objectClose();
        }
        return boardDTO;
    }//numCheck()
    
    public void updateBoard(BoardDTO boardDTO) {
        try {
            con=getConnection();
            sql="update mira_board set name=?, subject=?, content=? where num=?";
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1,boardDTO.getName());
            pstmt.setString(2,boardDTO.getSubject());
            pstmt.setString(3,boardDTO.getContent());
            pstmt.setInt(4, boardDTO.getNum());
            //4단계 실행
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            objectClose();
        }
    }//updateBoard(boardDTO)
    
    public void fileUpdateBoard(BoardDTO boardDTO) {
        try {
            con=getConnection();
            sql="update mira_board set name=?, subject=?, content=?, file=? where num=?";
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1,boardDTO.getName());
            pstmt.setString(2,boardDTO.getSubject());
            pstmt.setString(3,boardDTO.getContent());
            pstmt.setString(4,boardDTO.getFile());
            pstmt.setInt(5, boardDTO.getNum());
            //4단계 실행
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            objectClose();
        }
    }//fileUpdateBoard(boardDTO)
    
    public void deleteBoard(int num) {
        try {
            con=getConnection();
            sql="delete from mira_board where num=?";
            pstmt=con.prepareStatement(sql);
            pstmt.setInt(1, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            objectClose();
        }
    }// deleteBoard(num)

    
    
    
}
