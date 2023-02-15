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
public class OrderController {
    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("/orders")
    public String home(Model model) {
        List<Order> orders = orderService.getAll();
        model.addAttribute("orders", orders);
        model.addAttribute("order", new Order());
        return "orders";
    }

    @GetMapping("/orders/{id}")
    public String readOrder(@PathVariable("id") long id, Model model) {
        model.addAttribute("order", orderService.read(id));
        return "order";
    }

    @PostMapping("/orders/create")
    public String createOrder(@Valid @ModelAttribute("order") Order order, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "orders";
        } else if (order.getId() == 0) {
            orderService.create(order);
        } else {
            orderService.update(order);
        }
        return "redirect:/orders";
    }

    @GetMapping("/orders/delete/{id}")
    public String deleteOrder(@PathVariable("id") long id) {
        orderService.delete(id);
        return "redirect:/orders";
    }

    @GetMapping("/orders/update/{id}")
    public String updateOrder(@PathVariable("id") long id, Model model) {
        model.addAttribute("order", orderService.read(id));
        model.addAttribute("orders", orderService.getAll());
        return "orders";
    }
}
