package board;

import java.sql.Timestamp;

public class BoardDTO {
    private int num,readcount;
    private String name, pass,subject,content,file;
    private Timestamp date;
    BoardDAO boardDAO = new BoardDAO();
    
// Getter----------------------------------------------------
    public int getNum() {
        return num;
    }
    public String getName() {
        return name;
    }
    public String getPass() {
        return pass;
    }
    public String getSubject() {
        return subject;
    }
    public String getContent() {
        return content;
    }
    public int getReadcount() {
        return readcount;
    }
    public String getFile() {
        return file;
    }
    public Timestamp getDate() {
        return date;
    }
    
// Setter-----------------------------------------------------
    public void setNum(int num) {
        this.num = num;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void setPass(String pass) {
        this.pass = pass;
    }
    public void setSubject(String subject) {
        this.subject = subject;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public void setReadcount(int readcount) {
        this.readcount = readcount;
    }
    public void setFile(String file) {
        this.file = file;
    }
    public void setDate(Timestamp date) {
        this.date = date;
    }
    
    
    
}
