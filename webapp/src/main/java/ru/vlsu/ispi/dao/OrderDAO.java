package ru.vlsu.ispi.dao;

import org.springframework.stereotype.Repository;
import ru.vlsu.ispi.model.Order;
import ru.vlsu.ispi.model.Product;
import ru.vlsu.ispi.model.Role;
import ru.vlsu.ispi.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class OrderDAO implements DAO<Order, Long> {
    private final Connection connection;

    public OrderDAO(Connection connection) { this.connection = connection; }

    @Override
    public List<Order> getAll() {
        List<Order> result = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM \"Orders\" " +
                "JOIN \"Users\" ON \"Orders\".\"user_id\" = \"Users\".\"user_id\" " +
                "JOIN \"Roles\" ON \"Users\".\"role_id\" = \"Roles\".\"role_id\" " +
                "JOIN \"Products\" ON \"Orders\".\"product_id\" = \"Products\".\"product_id\"")) {
            final ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString("order_id"));
                Role role = new Role(rs.getInt("role_id"), rs.getString("role"));
                User user = new User(rs.getInt("user_id"), rs.getString("username"), rs.getString("password"), role);
                Product product = new Product(rs.getInt("product_id"), rs.getString("name"), rs.getDouble("price"));
                int count = Integer.parseInt(rs.getString("count"));
                Date date = rs.getDate("date");
                result.add(new Order(id, user, product, count, date));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public boolean create(Order order) {
        boolean result = false;

        try (PreparedStatement statement = connection.prepareStatement("INSERT INTO \"Orders\" (order_id, user_id, product_id, count, date) " +
                "VALUES (DEFAULT, (?), (?), (?), (?)) RETURNING order_id")) {
            statement.setLong(1, order.getUser().getId());
            statement.setLong(2, order.getProduct().getId());
            statement.setInt(3, order.getCount());
            statement.setDate(4, order.getDate());
            result = statement.executeQuery().next();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public Order read(Long id) {
        Order result = new Order();

        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM \"Orders\" " +
                "JOIN \"Users\" ON \"Orders\".\"user_id\" = \"Users\".\"user_id\" " +
                "JOIN \"Roles\" ON \"Users\".\"role_id\" = \"Roles\".\"role_id\" " +
                "JOIN \"Products\" ON \"Orders\".\"product_id\" = \"Products\".\"product_id\" WHERE \"Orders\".order_id = (?)")) {
            statement.setLong(1, id);
            final ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                result.setId(rs.getInt("order_id"));

                Role role = new Role(rs.getInt("role_id"), rs.getString("role"));
                User user = new User(rs.getInt("user_id"), rs.getString("username"), rs.getString("password"), role);
                result.setUser(user);

                Product product = new Product(rs.getInt("product_id"), rs.getString("name"), rs.getDouble("price"));
                result.setProduct(product);

                result.setCount(rs.getInt("count"));
                result.setDate(rs.getDate("date"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public boolean update(Order order) {
        boolean result = false;

        try (PreparedStatement statement = connection.prepareStatement("UPDATE \"Orders\" SET user_id = (?), product_id = (?), count = (?), date = (?) " +
                "WHERE order_id = (?) RETURNING order_id")) {
            statement.setLong(1, order.getUser().getId());
            statement.setLong(2, order.getProduct().getId());
            statement.setInt(3, order.getCount());
            statement.setDate(4, order.getDate());
            statement.setLong(5, order.getId());
            result = statement.executeQuery().next();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public boolean delete(Long id) {
        boolean result = false;

        try (PreparedStatement statement = connection.prepareStatement("DELETE FROM \"Orders\" " +
                "WHERE order_id = (?) RETURNING order_id")) {
            statement.setLong(1, id);
            result = statement.executeQuery().next();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public boolean deleteAll() {
        boolean result = false;

        try (PreparedStatement statement = connection.prepareStatement("DELETE FROM \"Orders\" RETURNING true")) {
            result = statement.executeQuery().next();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
}
