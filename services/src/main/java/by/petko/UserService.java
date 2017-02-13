package by.petko;

import by.petko.config.HibernateUtilLibrary;
import by.petko.entity.UserEntity;
import by.petko.repository.UserDao;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class UserService {
    private static UserService instance;
    private static HibernateUtilLibrary util = HibernateUtilLibrary.getHibernateUtil();
    private static UserDao userDao = UserDao.getInstance();

    public static synchronized UserService getInstance() {
        if (instance == null) {
            instance = new UserService();
        }
        return instance;
    }

    private UserService() {
    }

    public UserEntity login(String login, String password) {
        if (login == null || password == null) return null;
        Session currentSession = null;
        Transaction transaction = null;
        try {
            currentSession = util.getSession();
            transaction = currentSession.beginTransaction();
            UserEntity user = userDao.getByLoginAndPassword(login, password);
            transaction.commit();
            return user;
        } catch (HibernateException e) {
            if (transaction != null) transaction.rollback();
            throw new HibernateException(e.getMessage());
        } finally {
            util.releaseSession(currentSession);
        }
    }
}
