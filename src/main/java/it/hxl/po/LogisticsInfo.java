package it.hxl.po;

public class LogisticsInfo {
    private int id;
    private String title;
    private String content;
    private String issueDate;
    private Admin admin;

    public LogisticsInfo() {
    }

    @Override
    public String toString() {
        return "LogisticsInfo{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", issueDate='" + issueDate + '\'' +
                ", admin=" + admin +
                '}';
    }

    public LogisticsInfo(int id, String title, String content, String issueDate, Admin admin) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.issueDate = issueDate;
        this.admin = admin;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getIssueDate() {
        return issueDate;
    }

    public void setIssueDate(String issueDate) {
        this.issueDate = issueDate;
    }

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }
}
