package by.petko.repository;

import by.petko.config.HibernateUtilLibrary;
import by.petko.entity.UserEntity;
import org.hibernate.Query;
import org.hibernate.Session;

public class UserDao {
    private static UserDao instance;
    protected static HibernateUtilLibrary util = HibernateUtilLibrary.getHibernateUtil();
    protected static Session session;

    public static synchronized UserDao getInstance() {
        if (instance == null) {
            instance = new UserDao();
        }
        return instance;
    }

    private UserDao() {
    }

    public UserEntity getByLoginAndPassword(String login, String password) {
        session = util.getSession();
        String hql = "select U from UserEntity U where U.login=:login and U.password=:password";
        Query query = session.createQuery(hql);
        query.setParameter("login", login);
        query.setParameter("password", password);
        return (UserEntity) query.uniqueResult();
    }
}
