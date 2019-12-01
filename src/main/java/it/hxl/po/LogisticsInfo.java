package it.hxl.po;

import java.util.Date;

public class LogisticsInfo {
    private int id;
    private String title;
    private String content;
    private Date issueDate;
    private Admin admin;

    public LogisticsInfo() {
    }

    public LogisticsInfo(int id, String title, String content, Date issueDate, Admin admin) {
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

    public Date getIssueDate() {
        return issueDate;
    }

    public void setIssueDate(Date issueDate) {
        this.issueDate = issueDate;
    }

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }
}
