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
public class RoleController {
    private final RoleDAO roleDAO;

    public RoleController(RoleDAO roleDAO) {
        this.roleDAO = roleDAO;
    }

    @GetMapping("/roles")
    public String getRoles(Model model) {
        List<Role> roles = roleDAO.getAll();
        model.addAttribute("roles", roles);
        model.addAttribute("role", new Role());
        return "roles";
    }

    @GetMapping("/roles/{roleName}")
    public String readRole(@PathVariable("roleName") String roleName, Model model) {
        model.addAttribute("role", roleDAO.read(roleName));
        return "role";
    }

    @PostMapping("/roles/create")
    public String createRole(@Valid @ModelAttribute("role") Role role, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "roles";
        } else if (role.getId() == 0) {
            roleDAO.create(role);
        }
        return "redirect:/roles";
    }

    @GetMapping("/roles/delete/{roleName}")
    public String deleteRole(@PathVariable("roleName") String roleName) {
        roleDAO.delete(roleName);
        return "redirect:/roles";
    }

    @PostMapping("/roles/update")
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
