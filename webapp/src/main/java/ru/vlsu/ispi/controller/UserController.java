package ru.vlsu.ispi.controller;

import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import ru.vlsu.ispi.model.User;
import ru.vlsu.ispi.service.UserService;

import java.util.List;

@Controller
public class UserController {
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/users")
    public String getUsers(Model model) {
        List<User> users = userService.getAll();
        model.addAttribute("users", users);
        model.addAttribute("user", new User());
        return "users";
    }

    @GetMapping("/users/{username}")
    public String readUser(@PathVariable("username") String username, Model model) {
        model.addAttribute("user", userService.read(username));
        return "user";
    }

    @PostMapping("/users/create")
    public String createUser(@Valid @ModelAttribute("user") User user, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "users";
        } else if (user.getId() == 0) {
            userService.create(user);
        } else {
            userService.update(user);
        }
        return "redirect:/users";
    }

    @GetMapping("/users/delete/{username}")
    public String deleteUser(@PathVariable("username") String username) {
        userService.delete(username);
        return "redirect:/users";
    }

    @GetMapping("/users/update/{username}")
    public String updateUser(@PathVariable("username") String username, Model model) {
        model.addAttribute("user", userService.read(username));
        model.addAttribute("users", userService.getAll());
        return "users";
    }
}
