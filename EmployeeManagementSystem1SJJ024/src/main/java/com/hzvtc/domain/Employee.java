package com.hzvtc.domain;

public class Employee {
    private Integer id;
    private String name;
    private String gender;
    private String position;
    private String contact;

    // 构造函数
    public Employee() {}

    public Employee(String name, String gender, String position, String contact) {
        this.name = name;
        this.gender = gender;
        this.position = position;
        this.contact = contact;
    }

    // Getter和Setter方法
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", position='" + position + '\'' +
                ", contact='" + contact + '\'' +
                '}';
    }
}
