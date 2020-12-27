package com.kiriya.entity;


public class Student {

  private int id;
  private int num;
  private String password;
  private String name;
  private String sex;
  private String tel;
  private String sign_in_time;
  private String major;


  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }


  public int getNum() {
    return num;
  }

  public void setNum(int num) {
    this.num = num;
  }


  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public String getSex() {
    return sex;
  }

  public void setSex(String sex) {
    this.sex = sex;
  }


  public String getTel() {
    return tel;
  }

  public void setTel(String tel) {
    this.tel = tel;
  }


  public String getSignInTime() {
    return sign_in_time;
  }

  public void setSignInTime(String sign_in_time) {
    this.sign_in_time = sign_in_time;
  }


  public String getMajor() {
    return major;
  }

  public void setMajor(String major) {
    this.major = major;
  }


}
