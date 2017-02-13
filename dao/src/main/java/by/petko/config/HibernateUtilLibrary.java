package by.petko.config;

import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class HibernateUtilLibrary {
    private static HibernateUtilLibrary util;
    private static Logger log = LogManager.getLogger(HibernateUtilLibrary.class);
    private static SessionFactory sessionFactory;
    private static ThreadLocal<Session> sessions = new ThreadLocal<>();

    public static synchronized HibernateUtilLibrary getHibernateUtil() {
        if (util == null){
            util = new HibernateUtilLibrary();
        }
        return util;
    }

    private HibernateUtilLibrary() {
        try {
            Configuration configuration = new Configuration().configure();
            StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder()
                    .applySettings(configuration.getProperties());
            ServiceRegistry registry = builder.build();
            sessionFactory = configuration.buildSessionFactory(registry);
        } catch (Throwable ex) {
            log.error("Initial SessionFactory creation failed. " + ex);
            System.exit(0);
        }
    }

    public Session getSession() {
        Session session = sessions.get();
        if (session == null) {
            session = sessionFactory.openSession();
            sessions.set(session);
        }
        return session;
    }

    public void releaseSession(Session session) {
        if (session != null) {
            if (session.isOpen()) session.close();
            sessions.remove();
        }
    }
}
