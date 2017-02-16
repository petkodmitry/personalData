package by.petko.repository;

import by.petko.config.HibernateUtilLibrary;
import by.petko.entity.ContactData;
import by.petko.entity.UserEntity;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;

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

    public UserEntity getByLogin(String login) {
        session = util.getSession();
        String hql = "SELECT U FROM UserEntity U WHERE U.login=:login";
        Query query = session.createQuery(hql);
        query.setParameter("login", login);
        return (UserEntity) query.uniqueResult();
    }

    public void refresh(UserEntity user) {
        session = util.getSession();
        session.refresh(user);
    }

    public void delete(UserEntity user) {
        session = util.getSession();
        session.delete(user);
    }

    public Long getTotalCount() {
        Long result;
        session = util.getSession();
        String hql = "SELECT count(id) FROM UserEntity";
        Query query = session.createQuery(hql);
        result = (Long) query.uniqueResult();
        return result;
    }

    public List<UserEntity> getAllWithSortAndFilter(String sortBy,
                                                    String orderType, Map<String, String> filters) {
        List<UserEntity> result;
        session = util.getSession();
        Criteria criteriaUser = session.createCriteria(UserEntity.class, "user");
        criteriaUser.createAlias("user.contactData", "contactData", JoinType.LEFT_OUTER_JOIN);
        if (sortBy != null && orderType != null) {
            if ("login".equals(sortBy) || "name".equals(sortBy) || "middleName".equals(sortBy) ||
                    "surname".equals(sortBy) || "department".equals(sortBy) ||
                    "position".equals(sortBy) || "entryDate".equals(sortBy)) {
                criteriaUser = orderType.equals("asc") ? criteriaUser.addOrder(Order.asc(sortBy).ignoreCase())
                        : criteriaUser.addOrder(Order.desc(sortBy).ignoreCase());
            } else {
                criteriaUser = orderType.equals("asc") ? criteriaUser.addOrder(Order.asc("contactData." + sortBy).ignoreCase())
                        : criteriaUser.addOrder(Order.desc("contactData." + sortBy).ignoreCase());
            }
        }
        for (String filter : filters.keySet()) {
            switch (filter) {
                case "login":case "name":case "middleName":case "surname":
                case "department":case "position":
                    criteriaUser.add(Restrictions.ilike(filter, "%" + filters.get(filter) + "%"));
                    break;
                case "entryDate":
                    criteriaUser.add(Restrictions.sqlRestriction(" entry_date LIKE '" + filters.get(filter) + "' "));
                    break;
                default:
                    criteriaUser.add(Restrictions.ilike("contactData." + filter, "%" + filters.get(filter) + "%"));
                    break;
            }
        }
        result = criteriaUser.list();
        return result;
    }
}
