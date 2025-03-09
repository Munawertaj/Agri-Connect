package com.triadKnights.agriConnect.controller;

import com.triadKnights.agriConnect.model.Product;
import com.triadKnights.agriConnect.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

    private final ProductService productService;

    @Autowired
    public HomeController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/")
    public String home(@RequestParam(value = "page", defaultValue = "0") int page, Model model) {
        int pageSize = 9;
        Page<Product> products = productService.getProducts(page, pageSize);
        model.addAttribute("products", products);
        return "home";
    }
    @GetMapping("/home")
    public String home(Model model) {
        return "redirect:/";
    }
}
