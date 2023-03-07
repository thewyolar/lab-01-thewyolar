package ru.vlsu.ispi.controller;

import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import ru.vlsu.ispi.dao.RoleDAO;
import ru.vlsu.ispi.model.Role;

import java.util.List;

@Controller
@RequestMapping("/roles")
public class RoleController {
    private final RoleDAO roleDAO;

    public RoleController(RoleDAO roleDAO) {
        this.roleDAO = roleDAO;
    }

    @GetMapping
    public String getRoles(Model model) {
        List<Role> roles = roleDAO.getAll();
        model.addAttribute("roles", roles);
        model.addAttribute("role", new Role());
        return "roles";
    }

    @PostMapping("/create")
    public String createRole(@Valid @ModelAttribute("role") Role role, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "roles";
        } else if (role.getId() == 0) {
            roleDAO.create(role);
        }
        return "redirect:/roles";
    }

    @GetMapping("/delete/{roleName}")
    public String deleteRole(@PathVariable("roleName") String roleName) {
        roleDAO.delete(roleName);
        return "redirect:/roles";
    }

    @PostMapping("/update")
    public String updateRole(@Valid @ModelAttribute("role") Role role, @RequestParam("id") Long role_id, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "roles";
        } else {
            role.setId(role_id);
            roleDAO.update(role);
        }
        return "redirect:/roles";
    }
}
