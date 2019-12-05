package it.hxl.po;

import java.util.Date;

public class User {
    private int id;
    private String username;
    private String password;
    private String email;
    private String gender;
    private String phone;
    private String question;
    private String result;
    private Date issueDate;
    private String name;

    public String getUsername() {
        return username;
    }

    public int getId() {
        return id;
    }

    public String getQuestion() {
        return question;
    }

    public User(int id, String username, String password, String email, String gender, String phone, String question, String result, Date issueDate, String name) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.gender = gender;
        this.phone = phone;
        this.question = question;
        this.result = result;
        this.issueDate = issueDate;
        this.name = name;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getIssueDate() {
        return issueDate;
    }

    public void setIssueDate(Date issueDate) {
        this.issueDate = issueDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", gender='" + gender + '\'' +
                ", phone='" + phone + '\'' +
                ", question='" + question + '\'' +
                ", result='" + result + '\'' +
                ", issueDate=" + issueDate +
                ", name='" + name + '\'' +
                '}';
    }

    public User() {
    }
}
