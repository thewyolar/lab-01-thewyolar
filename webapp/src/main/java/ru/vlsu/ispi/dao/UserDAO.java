package ru.vlsu.ispi.dao;

import org.springframework.stereotype.Repository;
import ru.vlsu.ispi.model.Role;
import ru.vlsu.ispi.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class UserDAO implements DAO<User, String> {
    private final Connection connection;

    public UserDAO(Connection connection) {
        this.connection = connection;
    }

    @Override
    public List<User> getAll() {
        List<User> result = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM \"Users\" JOIN \"Roles\" " +
                "ON \"Users\".\"role_id\" = \"Roles\".\"role_id\"")) {
            final ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("user_id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                Role role = new Role(rs.getInt("role_id"), rs.getString("role"));
                result.add(new User(id, username, password, role));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public boolean create(User user) {
        boolean result = false;

        try (PreparedStatement statement = connection.prepareStatement("INSERT INTO \"Users\" (user_id, username, password, role_id) " +
                "VALUES (DEFAULT, (?), (?), (?)) RETURNING user_id")) {
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword());
            statement.setLong(3, user.getRole().getId());
            result = statement.executeQuery().next();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public User read(String username) {
        User result = new User();

        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM \"Users\" " +
                "JOIN \"Roles\" ON \"Users\".\"role_id\" = \"Roles\".\"role_id\" WHERE \"Users\".username = (?)")) {
            statement.setString(1, username);
            final ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                result.setId(rs.getInt("user_id"));
                result.setUsername(username);
                result.setPassword(rs.getString("password"));
                result.setRole(new Role(rs.getInt("role_id"), rs.getString("role")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public boolean update(User user) {
        boolean result = false;

        try (PreparedStatement statement = connection.prepareStatement("UPDATE \"Users\" SET username = (?), password = (?), role_id = (?) " +
                "WHERE user_id = (?) RETURNING user_id")) {
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword());
            statement.setLong(3, user.getRole().getId());
            statement.setLong(4, user.getId());
            result = statement.executeQuery().next();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public boolean delete(String username) {
        boolean result = false;

        try (PreparedStatement statement = connection.prepareStatement("DELETE FROM \"Users\" " +
                "WHERE username = (?) RETURNING user_id")) {
            statement.setString(1, username);
            result = statement.executeQuery().next();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public boolean deleteAll() {
        boolean result = false;

        try (PreparedStatement statement = connection.prepareStatement("DELETE FROM \"Users\" RETURNING user_id")) {
            result = statement.executeQuery().next();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
}
