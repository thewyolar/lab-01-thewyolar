package ru.vlsu.ispi.controller;

import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import ru.vlsu.ispi.model.Order;
import ru.vlsu.ispi.service.OrderService;

import java.util.List;

@Controller
@RequestMapping("/orders")
public class OrderController {
    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping
    public String getOrders(Model model) {
        List<Order> orders = orderService.getAll();
        model.addAttribute("orders", orders);
        model.addAttribute("order", new Order());
        return "orders";
    }

    @PostMapping("/create")
    public String createOrder(@Valid @ModelAttribute("order") Order order, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "orders";
        } else if (order.getId() == 0) {
            orderService.create(order);
        }
        return "redirect:/orders";
    }

    @GetMapping("/delete/{id}")
    public String deleteOrder(@PathVariable("id") long id) {
        orderService.delete(id);
        return "redirect:/orders";
    }

    @PostMapping("/update")
    public String updateOrder(@Valid @ModelAttribute("order") Order order, @RequestParam("id") Long id, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "orders";
        } else {
            order.setId(id);
            orderService.update(order);
        }
        return "redirect:/orders";
    }
}
