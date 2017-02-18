package by.petko;

import by.petko.entity.UserRole;
import by.petko.repository.UserDao;
import by.petko.entity.UserEntity;
import org.hibernate.HibernateException;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

public class UserDaoTest {
    public static UserDao userDao;

    @BeforeClass
    public static void init() {
        userDao = UserDao.getInstance();
    }

    @Test (expected = IllegalArgumentException.class)
    public void testSave1() {
        userDao.saveOrUpdate(null);
    }

    @Test (expected = HibernateException.class)
    public void testSave2() {
        UserEntity userEntity = new UserEntity();
        userDao.saveOrUpdate(userEntity);
    }

    @Test
    public void testSave3() {
        UserEntity userEntity = new UserEntity();
        userEntity.setLogin("123");
        userEntity.setPassword("123456");
        userEntity.setRole(UserRole.values()[0].toString());
        userDao.saveOrUpdate(userEntity);
        userEntity = userDao.getByLogin("123");
        Assert.assertNotNull("", userEntity);
        userDao.delete(userEntity);
    }
}
