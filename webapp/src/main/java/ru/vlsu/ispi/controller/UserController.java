package ru.vlsu.ispi.controller;

import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import ru.vlsu.ispi.dao.UserDAO;
import ru.vlsu.ispi.model.User;
import ru.vlsu.ispi.service.UserService;

import java.util.List;

@Controller
public class UserController {
    private final UserDAO userDAO;
    private final UserService userService;

    public UserController(UserDAO userDAO, UserService userService) {
        this.userDAO = userDAO;
        this.userService = userService;
    }

    @GetMapping("/users")
    public String getUsers(Model model) {
        List<User> users = userDAO.getAll();
        model.addAttribute("users", users);
        model.addAttribute("user", new User());
        return "users";
    }

    @GetMapping("/users/{username}")
    public String readUser(@PathVariable("username") String username, Model model) {
        model.addAttribute("user", userDAO.read(username));
        return "user";
    }

    @PostMapping("/users/create")
    public String createUser(@Valid @ModelAttribute("user") User user, BindingResult bindingResult) {
        if (bindingResult.hasErrors())
            return "users";
        if (user.getId() == 0)
            userService.create(user);
        else
            userDAO.update(user);
        return "redirect:/users";
    }

    @GetMapping("/users/delete/{username}")
    public String deleteUser(@PathVariable("username") String username) {
        userDAO.delete(username);
        return "redirect:/users";
    }

    @GetMapping("/users/update/{username}")
    public String updateUser(@PathVariable("username") String username, Model model) {
        model.addAttribute("user", userDAO.read(username));
        model.addAttribute("users", userDAO.getAll());
        return "users";
    }
}
