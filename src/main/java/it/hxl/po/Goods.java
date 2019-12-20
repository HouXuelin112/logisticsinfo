package it.hxl.po;

public class Goods {
    private int id;
    private String goodsStyle;
    private String goodsName;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGoodsStyle() {
        return goodsStyle;
    }

    public void setGoodsStyle(String goodsStyle) {
        this.goodsStyle = goodsStyle;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public float getGoodsCount() {
        return goodsCount;
    }

    public void setGoodsCount(float goodsCount) {
        this.goodsCount = goodsCount;
    }

    public String getGoodsUnit() {
        return goodsUnit;
    }

    public void setGoodsUnit(String goodsUnit) {
        this.goodsUnit = goodsUnit;
    }

    public String getStartOmit() {
        return startOmit;
    }

    public void setStartOmit(String startOmit) {
        this.startOmit = startOmit;
    }

    public String getStartCity() {
        return startCity;
    }

    public void setStartCity(String startCity) {
        this.startCity = startCity;
    }

    public String getEndOmit() {
        return endOmit;
    }

    public void setEndOmit(String endOmit) {
        this.endOmit = endOmit;
    }

    public String getEndCity() {
        return endCity;
    }

    public void setEndCity(String endCity) {
        this.endCity = endCity;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public float getTransportTime() {
        return transportTime;
    }

    public void setTransportTime(float transportTime) {
        this.transportTime = transportTime;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getIssueDate() {
        return issueDate;
    }

    public void setIssueDate(String issueDate) {
        this.issueDate = issueDate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
    }

    public Goods() {
    }

    public Goods(int id, String goodsStyle, String goodsName, float goodsCount, String goodsUnit, String startOmit, String startCity, String endOmit, String endCity, String style, float transportTime, String phone, String link, String issueDate, String remark, User user, Car car) {
        this.id = id;
        this.goodsStyle = goodsStyle;
        this.goodsName = goodsName;
        this.goodsCount = goodsCount;
        this.goodsUnit = goodsUnit;
        this.startOmit = startOmit;
        this.startCity = startCity;
        this.endOmit = endOmit;
        this.endCity = endCity;
        this.style = style;
        this.transportTime = transportTime;
        this.phone = phone;
        this.link = link;
        this.issueDate = issueDate;
        this.remark = remark;
        this.user = user;
        this.car = car;
    }

    private float goodsCount;
    private String goodsUnit;
    private String startOmit;
    private String startCity;
    private String endOmit;
    private String endCity;
    private String style;
    private float transportTime;
    private String phone;
    private String link;
    private String issueDate;
    private String remark;
    private User user;
    private Car car;

    @Override
    public String toString() {
        return "Goods{" +
                "id=" + id +
                ", goodsStyle='" + goodsStyle + '\'' +
                ", goodsName='" + goodsName + '\'' +
                ", goodsCount=" + goodsCount +
                ", goodsUnit='" + goodsUnit + '\'' +
                ", startOmit='" + startOmit + '\'' +
                ", startCity='" + startCity + '\'' +
                ", endOmit='" + endOmit + '\'' +
                ", endCity='" + endCity + '\'' +
                ", style='" + style + '\'' +
                ", transportTime=" + transportTime +
                ", phone='" + phone + '\'' +
                ", link='" + link + '\'' +
                ", issueDate=" + issueDate +
                ", remark='" + remark + '\'' +
                ", user=" + user +
                ", car=" + car +
                '}';
    }
}
