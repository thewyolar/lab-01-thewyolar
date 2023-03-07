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
@RequestMapping("/products")
public class ProductController {
    private final ProductDAO productDAO;

    public ProductController(ProductDAO productDAO) {
        this.productDAO = productDAO;
    }

    @GetMapping
    public String getProducts(Model model) {
        List<Product> products = productDAO.getAll();
        model.addAttribute("products", products);
        model.addAttribute("product", new Product());
        return "products";
    }

    @PostMapping("/create")
    public String createProduct(@Valid @ModelAttribute("product") Product product, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "products";
        } else if (product.getId() == 0) {
            productDAO.create(product);
        }
        return "redirect:/products";
    }

    @GetMapping("/delete/{productName}")
    public String deleteProduct(@PathVariable("productName") String productName) {
        productDAO.delete(productName);
        return "redirect:/products";
    }

    @PostMapping("/update")
    public String updateProduct(@Valid @ModelAttribute("order") Product product, @RequestParam("id") Long product_id, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "products";
        } else {
            product.setId(product_id);
            productDAO.update(product);
        }
        return "redirect:/products";
    }
}
