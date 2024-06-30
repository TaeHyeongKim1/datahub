package datacentererp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import datacentererp.service.UserService;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/registerCustomer.do")
    public String registerCustomer(@RequestParam String username, @RequestParam String password, @RequestParam String name, @RequestParam String companyNumber) {
        userService.registerCustomer(username, password, name, companyNumber);
        return "redirect:/login";
    }

    @PostMapping("/registerAdmin.do")
    public String registerAdmin(@RequestParam String username, @RequestParam String password, @RequestParam String name, @RequestParam String employeeNumber, @RequestParam String position) {
        userService.registerAdmin(username, password, name, employeeNumber, position);
        return "redirect:/login";
    }
}
