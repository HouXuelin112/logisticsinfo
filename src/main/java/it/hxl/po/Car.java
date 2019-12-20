package it.hxl.po;

/**
 * 对应cars_info
 */
public class Car {
    private int id;
    private String tradeMark; //车牌号
    private String brand;   //车辆品牌
    private String style;   //车辆类型
    private float carLoad;  //车辆载重
    private String driverName;  //驾驶员姓名
    private String driverTime;  //驾驶时间
    private String licenceNumber;   //驾照编号
    private String licenceStyle;    //驾照类型
    private String transportStyle;  //运输类型
    private String linkMan;     //联系人
    private String linkPhone;   //联系人电话
    private String remark;  //备注
    private String issueDate;   //发布时间
    private User user;  //发布人

    public String getTransportStyle() {
        return transportStyle;
    }

    public void setTransportStyle(String transportStyle) {
        this.transportStyle = transportStyle;
    }

    public Car() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Car{" +
                "id=" + id +
                ", tradeMark='" + tradeMark + '\'' +
                ", brand='" + brand + '\'' +
                ", style='" + style + '\'' +
                ", carLoad=" + carLoad +
                ", driverName='" + driverName + '\'' +
                ", driverTime='" + driverTime + '\'' +
                ", licenceNumber='" + licenceNumber + '\'' +
                ", licenceStyle='" + licenceStyle + '\'' +
                ", transportStyle='" + transportStyle + '\'' +
                ", linkMan='" + linkMan + '\'' +
                ", linkPhone='" + linkPhone + '\'' +
                ", remark='" + remark + '\'' +
                ", issueDate=" + issueDate +
                ", user=" + user +
                '}';
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

    public String getIssueDate() {
        return issueDate;
    }

    public void setIssueDate(String issueDate) {
        this.issueDate = issueDate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Car(int id, String tradeMark, String brand, String style, float carLoad, String driverName, String driverTime, String licenceNumber, String licenceStyle, String transportStyle, String linkMan, String linkPhone, String remark, String issueDate, User user) {
        this.id = id;
        this.tradeMark = tradeMark;
        this.brand = brand;
        this.style = style;
        this.carLoad = carLoad;
        this.driverName = driverName;
        this.driverTime = driverTime;
        this.licenceNumber = licenceNumber;
        this.licenceStyle = licenceStyle;
        this.transportStyle = transportStyle;
        this.linkMan = linkMan;
        this.linkPhone = linkPhone;
        this.remark = remark;
        this.issueDate = issueDate;
        this.user = user;
    }
}
