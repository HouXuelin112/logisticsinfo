package it.hxl.po;

import java.util.Date;

public class EnterpriseInfo {
    private int id;
    private String enterpriseSort;
    private String enterpriseName;
    private String operation;
    private String workArea;
    private String address;
    private String phone;
    private String linkMan;
    private String handset;
    private String fax;
    private String email;

    @Override
    public String toString() {
        return "EnterpriseInfo{" +
                "id=" + id +
                ", enterpriseSort='" + enterpriseSort + '\'' +
                ", enterpriseName='" + enterpriseName + '\'' +
                ", operation='" + operation + '\'' +
                ", workArea='" + workArea + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", linkMan='" + linkMan + '\'' +
                ", handset='" + handset + '\'' +
                ", fax='" + fax + '\'' +
                ", email='" + email + '\'' +
                ", http='" + http + '\'' +
                ", intro='" + intro + '\'' +
                ", issueDate=" + issueDate +
                ", user=" + user +
                '}';
    }

    private String http;
    private String intro;
    private Date issueDate;
    private User user;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEnterpriseSort() {
        return enterpriseSort;
    }

    public void setEnterpriseSort(String enterpriseSort) {
        this.enterpriseSort = enterpriseSort;
    }

    public String getEnterpriseName() {
        return enterpriseName;
    }

    public void setEnterpriseName(String enterpriseName) {
        this.enterpriseName = enterpriseName;
    }

    public String getOperation() {
        return operation;
    }

    public void setOperation(String operation) {
        this.operation = operation;
    }

    public String getWorkArea() {
        return workArea;
    }

    public void setWorkArea(String workArea) {
        this.workArea = workArea;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getLinkMan() {
        return linkMan;
    }

    public void setLinkMan(String linkMan) {
        this.linkMan = linkMan;
    }

    public String getHandset() {
        return handset;
    }

    public void setHandset(String handset) {
        this.handset = handset;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getHttp() {
        return http;
    }

    public void setHttp(String http) {
        this.http = http;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public Date getIssueDate() {
        return issueDate;
    }

    public void setIssueDate(Date issueDate) {
        this.issueDate = issueDate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public EnterpriseInfo(int id, String enterpriseSort, String enterpriseName, String operation, String workArea, String address, String phone, String linkMan, String handset, String fax, String email, String http, String intro, Date issueDate, User user) {
        this.id = id;
        this.enterpriseSort = enterpriseSort;
        this.enterpriseName = enterpriseName;
        this.operation = operation;
        this.workArea = workArea;
        this.address = address;
        this.phone = phone;
        this.linkMan = linkMan;
        this.handset = handset;
        this.fax = fax;
        this.email = email;
        this.http = http;
        this.intro = intro;
        this.issueDate = issueDate;
        this.user = user;
    }

    public EnterpriseInfo() {
    }
}
