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
@RequestMapping("/users")
public class UserController {
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public String getUsers(Model model) {
        List<User> users = userService.getAll();
        model.addAttribute("users", users);
        model.addAttribute("user", new User());
        return "users";
    }

    @PostMapping("/create")
    public String createUser(@Valid @ModelAttribute("user") User user, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "users";
        } else if (user.getId() == 0) {
            userService.create(user);
        }
        return "redirect:/users";
    }

    @GetMapping("/users/delete/{username}")
    public String deleteUser(@PathVariable("username") String username) {
        userService.delete(username);
        return "redirect:/users";
    }

    @PostMapping("/update")
    public String updateUser(@Valid @ModelAttribute("user") User user, @RequestParam("id") Long user_id, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "users";
        } else {
            user.setId(user_id);
            userService.update(user);
        }
        return "redirect:/users";
    }
}
