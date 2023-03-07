package ru.vlsu.ispi.service;

import org.springframework.stereotype.Service;
import ru.vlsu.ispi.dao.RoleDAO;
import ru.vlsu.ispi.dao.UserDAO;
import ru.vlsu.ispi.model.Product;
import ru.vlsu.ispi.model.Role;
import ru.vlsu.ispi.model.User;

import java.util.List;

@Service
public class UserService implements IService<User, String> {
    private final UserDAO userDAO;
    private final RoleDAO roleDAO;

    public UserService(UserDAO userDAO, RoleDAO roleDAO) {
        this.userDAO = userDAO;
        this.roleDAO = roleDAO;
    }

    @Override
    public List<User> getAll() {
        return userDAO.getAll();
    }

    @Override
    public boolean create(User user) {
        Role userRole = user.getRole();
        if (!isRoleExists(userRole.getName())) {
            roleDAO.create(userRole);
        }

        user.setRole(roleDAO.read(userRole.getName()));
        if (!isUserExists(user.getUsername())) {
            return userDAO.create(user);
        } else {
            System.out.println("Пользователь с таким именем уже существует!");
        }
        return false;
    }

    @Override
    public User read(String username) {
        if (isUserExists(username)) {
            return userDAO.read(username);
        } else {
            System.out.println("Пользователя с таким именем не существует!");
            return null;
        }
    }

    @Override
    public boolean update(User user) {
        Role role = roleDAO.read(user.getRole().getName());
        user.getRole().setId(role.getId());
        return userDAO.update(user);
    }

    @Override
    public boolean delete(String username) {
        if (isUserExists(username)) {
            return userDAO.delete(username);
        } else {
            System.out.println("Пользователя с таким именем не существует!");
            return false;
        }
    }

    private boolean isUserExists(String username) {
        User user = userDAO.read(username);
        if (user.getUsername() != null) {
            return true;
        }
        return false;
    }

    private boolean isRoleExists(String roleName) {
        Role role = roleDAO.read(roleName);
        if (role.getName() != null) {
            return true;
        }
        return false;
    }

    @Override
    public boolean deleteAll() {
        return userDAO.deleteAll();
    }
}
