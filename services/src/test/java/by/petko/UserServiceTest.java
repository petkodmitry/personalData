package by.petko;

import by.petko.entity.UserRole;
import by.petko.repository.UserDao;
import by.petko.entity.UserEntity;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

public class UserServiceTest {
    public static UserService userService;
    public static UserDao userDao;

    @BeforeClass
    public static void init() {
        userService = UserService.getInstance();
        userDao = UserDao.getInstance();
    }

    public int getTheLastUserId() {
        List<UserEntity> list = userDao.getAllWithSortAndFilter(null, null, null);
        Set<Integer> userIds = list.stream().map(UserEntity::getUserId).collect(Collectors.toSet());
        Object[] ids = userIds.toArray();
        Arrays.sort(ids);
        return (int) ids[ids.length - 1];
    }

    @Test
    public void testAdd() {
        String login = "test";
        UserEntity userEntity = new UserEntity();
        userEntity.setLogin(login);
        userEntity.setPassword("123456");
        userEntity.setRole(UserRole.values()[0].toString());
        userService.saveOrUpdate(userEntity);
        int id = getTheLastUserId();
        userEntity = userDao.getById(id);
        Assert.assertEquals(userEntity.getLogin(), login);
        userService.deleteUser(login);
    }
}
