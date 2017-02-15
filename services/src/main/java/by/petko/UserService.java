package by.petko;

import by.petko.config.HibernateUtilLibrary;
import by.petko.entity.UserEntity;
import by.petko.repository.UserDao;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.http.HttpSession;
import java.util.*;

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

    public void saveOrUpdate(UserEntity user) {
        Session currentSession = null;
        Transaction transaction = null;
        try {
            currentSession = util.getSession();
            transaction = currentSession.beginTransaction();
            userDao.saveOrUpdate(user);
            transaction.commit();
        } catch (HibernateException e) {
            if (transaction != null) transaction.rollback();
            throw new HibernateException(e.getMessage());
        } finally {
            util.releaseSession(currentSession);
        }
    }

    public UserEntity getById(Integer id) {
        Session currentSession = null;
        Transaction transaction = null;
        try {
            currentSession = util.getSession();
            transaction = currentSession.beginTransaction();
            UserEntity user = userDao.getById(id);
            transaction.commit();
            return user;
        } catch (HibernateException e) {
            if (transaction != null) transaction.rollback();
            throw new HibernateException(e.getMessage());
        } finally {
            util.releaseSession(currentSession);
        }
    }

    public void refresh(UserEntity user) {
        Session currentSession = null;
        Transaction transaction = null;
        try {
            currentSession = util.getSession();
            transaction = currentSession.beginTransaction();
            userDao.refresh(user);
            transaction.commit();
        } catch (HibernateException e) {
            if (transaction != null) transaction.rollback();
            throw new HibernateException(e.getMessage());
        } finally {
            util.releaseSession(currentSession);
        }
    }

    public void changePassword(UserEntity user, String currentPassword,
                               String repeatedPassword, String desiredPassword) {
        Session currentSession = null;
        Transaction transaction = null;
        try {
            currentSession = util.getSession();
            transaction = currentSession.beginTransaction();
            user = userDao.getById(user.getUserId());
            if (!user.getPassword().equals(currentPassword) || !currentPassword.equals(repeatedPassword)) {
                throw new HibernateException("Can't change the password: wrong current password entered!");
            }
            user.setPassword(desiredPassword);
            userDao.saveOrUpdate(user);
            transaction.commit();
        } catch (HibernateException e) {
            if (transaction != null) transaction.rollback();
            throw new HibernateException(e.getMessage());
        } finally {
            util.releaseSession(currentSession);
        }
    }

    public Long getTotalCount() {
        Session currentSession = null;
        try {
            currentSession = util.getSession();
            return userDao.getTotalCount();
        } catch (HibernateException e) {
            throw new HibernateException(e.getMessage());
        } finally {
            util.releaseSession(currentSession);
        }
    }

    public List<UserEntity> getAll(String sortBy, String orderType, Map<String, String> filters) {
        List<UserEntity> result;
        Session currentSession = null;
        try {
            currentSession = util.getSession();
            if (filters == null) filters = new HashMap<>();
            result = userDao.getAllWithSortAndFilter(sortBy, orderType, filters);
            return result;
        } catch (HibernateException e) {
            throw new HibernateException(e.getMessage());
        } finally {
            util.releaseSession(currentSession);
        }
    }
}
