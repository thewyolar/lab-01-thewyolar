package ru.vlsu.ispi.service;

import org.springframework.stereotype.Service;
import ru.vlsu.ispi.dao.OrderDAO;
import ru.vlsu.ispi.dao.ProductDAO;
import ru.vlsu.ispi.dao.UserDAO;
import ru.vlsu.ispi.model.Order;
import ru.vlsu.ispi.model.Product;
import ru.vlsu.ispi.model.User;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

@Service
public class OrderService implements IService<Order, Long> {
    private final UserDAO userDAO;
    private final ProductDAO productDAO;
    private final OrderDAO orderDAO;

    public OrderService(UserDAO userDAO, ProductDAO productDAO, OrderDAO orderDAO) {
        this.userDAO = userDAO;
        this.productDAO = productDAO;
        this.orderDAO = orderDAO;
    }

    @Override
    public List<Order> getAll() {
        return orderDAO.getAll();
    }

    @Override
    public boolean create(Order order) {
        User user = order.getUser();
        Product product = order.getProduct();
        if (!isUserExists(user.getUsername())) {
            userDAO.create(user);
        } else if (!isProductExists(product.getName())) {
            productDAO.create(product);
        }

        order.setUser(userDAO.read(user.getUsername()));
        order.setProduct(productDAO.read(product.getName()));
        if (!isOrderExists(order.getId())) {
            order.setDate(Date.valueOf(LocalDate.now()));
            return orderDAO.create(order);
        } else {
            System.out.println("Заказ с таким id уже существует!");
        }
        return false;
    }

    @Override
    public Order read(Long order_id) {
        if (isOrderExists(order_id)) {
            return orderDAO.read(order_id);
        } else {
            System.out.println("Заказа с таким id не существует!");
            return null;
        }
    }

    @Override
    public boolean update(Order order) {
        User user = userDAO.read(order.getUser().getUsername());
        order.getUser().setId(user.getId());
        Product product = productDAO.read(order.getProduct().getName());
        order.getProduct().setId(product.getId());
        return orderDAO.update(order);
    }

    @Override
    public boolean delete(Long order_id) {
        if (isOrderExists(order_id)) {
            return orderDAO.delete(order_id);
        } else {
            System.out.println("Заказа с таким id не существует!");
            return false;
        }
    }

    private boolean isOrderExists(long order_id) {
        Order order = orderDAO.read(order_id);
        if (order.getId() != 0) {
            return true;
        }
        return false;
    }

    private boolean isProductExists(String productName) {
        Product product = productDAO.read(productName);
        if (product.getName() != null) {
            return true;
        }
        return false;
    }

    private boolean isUserExists(String username) {
        User user = userDAO.read(username);
        if (user.getUsername() != null) {
            return true;
        }
        return false;
    }

    @Override
    public boolean deleteAll() {
        return orderDAO.deleteAll();
    }
}
