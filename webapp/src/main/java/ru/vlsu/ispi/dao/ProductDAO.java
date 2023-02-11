package ru.vlsu.ispi.dao;

import org.springframework.stereotype.Repository;
import ru.vlsu.ispi.model.Product;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class ProductDAO implements DAO<Product, String> {
    private final Connection connection;

    public ProductDAO(Connection connection) {
        this.connection = connection;
    }

    @Override
    public List<Product> getAll() {
        List<Product> result = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM \"Products\"")) {
            final ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("product_id");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                result.add(new Product(id, name, price));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public boolean create(Product product) {
        boolean result = false;

        try (PreparedStatement statement = connection.prepareStatement("INSERT INTO \"Products\" (product_id, name, price) " +
                "VALUES (DEFAULT, (?), (?)) RETURNING product_id")) {
            statement.setString(1, product.getName());
            statement.setDouble(2, product.getPrice());
            result = statement.executeQuery().next();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public Product read(String productName) {
        Product result = new Product();

        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM \"Products\" " +
                "WHERE name = (?)")) {
            statement.setString(1, productName);
            final ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                result.setId(rs.getInt("product_id"));
                result.setName(productName);
                result.setPrice(rs.getDouble("price"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public boolean update(Product product) {
        boolean result = false;

        try (PreparedStatement statement = connection.prepareStatement("UPDATE \"Products\" SET name = (?), price = (?) " +
                "WHERE product_id = (?) RETURNING product_id")) {
            statement.setString(1, product.getName());
            statement.setDouble(2, product.getPrice());
            statement.setLong(3, product.getId());
            result = statement.executeQuery().next();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public boolean delete(String productName) {
        boolean result = false;

        try (PreparedStatement statement = connection.prepareStatement("DELETE FROM \"Products\" " +
                "WHERE name = (?) RETURNING product_id")) {
            statement.setString(1, productName);
            result = statement.executeQuery().next();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public boolean deleteAll() {
        boolean result = false;

        try (PreparedStatement statement = connection.prepareStatement("DELETE FROM \"Products\" RETURNING true")) {
            result = statement.executeQuery().next();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
}
