package by.petko.handlers;

import by.petko.entity.ContactData;
import by.petko.entity.UserEntity;

import java.text.ParseException;
import java.text.SimpleDateFormat;

public class UserHandler {
    private static UserHandler instance;

    public static synchronized UserHandler getInstance() {
        if (instance == null) {
            instance = new UserHandler();
        }
        return instance;
    }

    private UserHandler() {}

    public UserEntity fillUserData(UserEntity userEntity, String login, String password, String name,
                                   String surname, String middleName, String role, String department,
                                   String position, String birthDate, String entryDate, String city,
                                   String street, String building, String flat, String phone,
                                   String email) throws ParseException{
        if (userEntity == null) userEntity = new UserEntity();

        if (userEntity.getLogin() == null && login != null) userEntity.setLogin(login);
        if (userEntity.getPassword() == null && password != null) userEntity.setPassword(password);
        if (userEntity.getRole() == null && role != null) userEntity.setRole(role);

        userEntity.setName("".equals(name) ? null : name);
        userEntity.setSurname("".equals(surname) ? null : surname);
        userEntity.setMiddleName("".equals(middleName) ? null : middleName);
        userEntity.setDepartment("".equals(department) ? null : department);
        userEntity.setPosition("".equals(position) ? null : position);

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        if ("".equals(birthDate)) userEntity.setBirthDate(null);
        else if (birthDate != null) userEntity.setBirthDate(dateFormat.parse(birthDate));
        if ("".equals(entryDate)) userEntity.setEntryDate(null);
        else if (entryDate != null) userEntity.setEntryDate(dateFormat.parse(entryDate));

        ContactData contactData = userEntity.getContactData();
        if (contactData == null) {
            contactData = new ContactData();
            userEntity.setContactData(contactData);
            contactData.setUser(userEntity);
        }
        contactData.setCity("".equals(city) ? null : city);
        contactData.setStreet("".equals(street) ? null : street);
        contactData.setBuilding("".equals(building) ? null : building);
        contactData.setFlat("".equals(flat) ? null : flat);
        contactData.setPhone("".equals(phone) ? null : phone);
        contactData.setEmail("".equals(email) ? null : email);

        return userEntity;
    }
}
