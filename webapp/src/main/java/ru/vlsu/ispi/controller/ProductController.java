package ru.vlsu.ispi.controller;

import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import ru.vlsu.ispi.dao.ProductDAO;
import ru.vlsu.ispi.model.Product;

import java.util.List;

@Controller
public class ProductController {
    private final ProductDAO productDAO;

    public ProductController(ProductDAO productDAO) {
        this.productDAO = productDAO;
    }

    @GetMapping("/products")
    public String getProducts(Model model) {
        List<Product> products = productDAO.getAll();
        model.addAttribute("products", products);
        model.addAttribute("product", new Product());
        return "products";
    }

    @GetMapping("/products/{productName}")
    public String readProduct(@PathVariable("productName") String productName, Model model) {
        model.addAttribute("product", productDAO.read(productName));
        return "product";
    }

    @PostMapping("/products/create")
    public String createProduct(@Valid @ModelAttribute("product") Product product, BindingResult bindingResult) {
        if (bindingResult.hasErrors())
            return "products";
        if (product.getId() == 0)
            productDAO.create(product);
        else
            productDAO.update(product);
        return "redirect:/products";
    }

    @GetMapping("/products/delete/{productName}")
    public String deleteProduct(@PathVariable("productName") String productName) {
        productDAO.delete(productName);
        return "redirect:/products";
    }

    @GetMapping("/products/update/{productName}")
    public String updateProduct(@PathVariable("productName") String productName, Model model) {
        model.addAttribute("product", productDAO.read(productName));
        model.addAttribute("products", productDAO.getAll());
        return "products";
    }
}
