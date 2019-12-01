package it.hxl.po;

import java.util.Date;

/**
 * 对应cars_info
 */
public class Car {
    private int id;
    private String tradeMark;
    private String brand;
    private String style;
    private float carLoad;
    private String driverName;
    private String driverTime;
    private String licenceNumber;
    private String licenceStyle;
    private String linkMan;
    private String linkPhone;
    private String remark;
    private Date issueDate;
    private User user;

    public Car() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTradeMark() {
        return tradeMark;
    }

    public void setTradeMark(String tradeMark) {
        this.tradeMark = tradeMark;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public float getCarLoad() {
        return carLoad;
    }

    public void setCarLoad(float carLoad) {
        this.carLoad = carLoad;
    }

    public String getDriverName() {
        return driverName;
    }

    public void setDriverName(String driverName) {
        this.driverName = driverName;
    }

    public String getDriverTime() {
        return driverTime;
    }

    public void setDriverTime(String driverTime) {
        this.driverTime = driverTime;
    }

    public String getLicenceNumber() {
        return licenceNumber;
    }

    public void setLicenceNumber(String licenceNumber) {
        this.licenceNumber = licenceNumber;
    }

    public String getLicenceStyle() {
        return licenceStyle;
    }

    public void setLicenceStyle(String licenceStyle) {
        this.licenceStyle = licenceStyle;
    }

    public String getLinkMan() {
        return linkMan;
    }

    public void setLinkMan(String linkMan) {
        this.linkMan = linkMan;
    }

    public String getLinkPhone() {
        return linkPhone;
    }

    public void setLinkPhone(String linkPhone) {
        this.linkPhone = linkPhone;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
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

    public Car(int id, String tradeMark, String brand, String style, float carLoad, String driverName, String driverTime, String licenceNumber, String licenceStyle, String linkMan, String linkPhone, String remark, Date issueDate, User user) {
        this.id = id;
        this.tradeMark = tradeMark;
        this.brand = brand;
        this.style = style;
        this.carLoad = carLoad;
        this.driverName = driverName;
        this.driverTime = driverTime;
        this.licenceNumber = licenceNumber;
        this.licenceStyle = licenceStyle;
        this.linkMan = linkMan;
        this.linkPhone = linkPhone;
        this.remark = remark;
        this.issueDate = issueDate;
        this.user = user;
    }
}
