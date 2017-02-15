package by.petko.entity;


import javax.persistence.*;
import javax.validation.constraints.Pattern;

@Entity
@Table(name = "users_data")
public class ContactData {
    private Integer dataId;
    private String city;
    private String street;
    private String building;
    private String flat;
    private String phone;
    private String email;
    private UserEntity user;

    @Id
    @Column(name = "uid", nullable = false, unique = true)
    public Integer getDataId() {
        return dataId;
    }

    public void setDataId(Integer dataId) {
        this.dataId = dataId;
    }

    @Column(name = "city")
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Column(name = "street")
    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    @Column(name = "building")
    public String getBuilding() {
        return building;
    }

    public void setBuilding(String building) {
        this.building = building;
    }

    @Column(name = "flat")
    public String getFlat() {
        return flat;
    }

    public void setFlat(String flat) {
        this.flat = flat;
    }

    @Pattern(regexp = "^\\+375\\([0-9]{2}\\)[0-9]{3}\\-[0-9]{2}\\-[0-9]{2}$",
            message = "phone number must be '+375(xx)xxx-xx-xx' formatted.")
    @Column(name = "phone")
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Pattern(regexp = "^[a-zA-Z0-9.%+-_]+@[a-zA-Z0-9.%+-]+\\.[a-zA-Z]{2,}$",
            message = "please, enter a valid email address")
    @Column(name = "email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @OneToOne
    @PrimaryKeyJoinColumn
    public UserEntity getUser() {
        return user;
    }

    public void setUser(UserEntity user) {
        this.user = user;
    }
}
