package ru.vlsu.ispi.dao;

import org.springframework.stereotype.Repository;
import ru.vlsu.ispi.model.Role;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class RoleDAO implements DAO<Role, String> {

    private final Connection connection;

    public RoleDAO(Connection connection) {
        this.connection = connection;
    }

    @Override
    public List<Role> getAll() {
        List<Role> result = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM \"Roles\"")) {
            final ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("role_id");
                String role = rs.getString("role");
                result.add(new Role(id, role));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public boolean create(Role role) {
        boolean result = false;

        try (PreparedStatement statement = connection.prepareStatement("INSERT INTO \"Roles\" (role_id, role) " +
                "VALUES (DEFAULT, (?)) RETURNING role_id")) {
            statement.setString(1, role.getName());
            result = statement.executeQuery().next();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public Role read(String roleName) {
        Role result = new Role();

        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM \"Roles\" WHERE role = (?)")) {
            statement.setString(1, roleName);
            final ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                result.setId(rs.getInt("role_id"));
                result.setName(roleName);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public boolean update(Role role) {
        boolean result = false;

        try (PreparedStatement statement = connection.prepareStatement("UPDATE \"Roles\" SET role = (?) " +
                "WHERE role_id = (?) RETURNING role_id")) {
            statement.setString(1, role.getName());
            statement.setLong(2, role.getId());
            result = statement.executeQuery().next();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public boolean delete(String roleName) {
        boolean result = false;

        try (PreparedStatement statement = connection.prepareStatement("DELETE FROM \"Roles\" " +
                "WHERE role = (?) RETURNING role_id")) {
            statement.setString(1, roleName);
            result = statement.executeQuery().next();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public boolean deleteAll() {
        boolean result = false;

        try (PreparedStatement statement = connection.prepareStatement("DELETE FROM \"Roles\" RETURNING true")) {
            result = statement.executeQuery().next();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
}
