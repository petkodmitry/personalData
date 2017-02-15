package by.petko.repository;

import by.petko.config.HibernateUtilLibrary;
import by.petko.entity.UserEntity;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import java.util.List;
import java.util.Map;

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

    public void saveOrUpdate(UserEntity user) {
        session = util.getSession();
        session.saveOrUpdate(user);
//        session.flush();
//        session.refresh(user);
    }

    public UserEntity getById(Integer id) {
        session = util.getSession();
        return (UserEntity) session.get(UserEntity.class, id);
    }

    public void refresh(UserEntity user) {
        session = util.getSession();
        session.refresh(user);
    }

    public Long getTotalCount() {
        Long result;
        session = util.getSession();
        String hql = "SELECT count(id) FROM UserEntity";
        Query query = session.createQuery(hql);
        result = (Long) query.uniqueResult();
        return result;
    }

    public List<UserEntity> getAllWithSortAndFilter(/*int first, int max, */String sortBy,
                                                    String orderType, Map<String, String> filters) {
        List<UserEntity> result;
            session = util.getSession();
            Criteria criteria = session.createCriteria(UserEntity.class);
            if (sortBy != null && orderType != null) {
                criteria = orderType.equals("asc") ? criteria.addOrder(Order.asc(sortBy).ignoreCase())
                        : criteria.addOrder(Order.desc(sortBy).ignoreCase());
            }
            for (String filter : filters.keySet()) {
                switch (filter) {
                    case "userId":
                        criteria.add(Restrictions.sqlRestriction(" uid LIKE '%" + filters.get(filter) + "%' "));
                        break;
                    default:
                        criteria.add(Restrictions.ilike(filter, "%" + filters.get(filter) + "%"));
                        break;
                }
            }
//            criteria.setFirstResult(first);
//            criteria.setMaxResults(max);
            result = criteria.list();
        return result;
    }

    /*public void flush() {
        session = util.getSession();
        session.flush();
    }*/
}
