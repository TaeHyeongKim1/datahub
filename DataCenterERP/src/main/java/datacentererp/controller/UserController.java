package datacentererp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import datacentererp.model.Admin;
import datacentererp.model.Customer;
import datacentererp.service.UserService;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/registerCustomer.do")
    public String registerCustomer(@RequestParam String username, @RequestParam String password, @RequestParam String name, @RequestParam String companyNumber) {
        userService.registerCustomer(username, password, name, companyNumber);
        return "redirect:/login.do";
    }

    @PostMapping("/registerAdmin.do")
    public String registerAdmin(@RequestParam String username, @RequestParam String password, @RequestParam String name, @RequestParam String employeeNumber, @RequestParam String position) {
        userService.registerAdmin(username, password, name, employeeNumber, position);
        return "redirect:/login.do";
    }
    
    // 로그인 페이지 이동
    @GetMapping("/login.do")
    public String showLoginPage() {
        return "login";
    }

    // 회원가입 페이지 이동
    @GetMapping("/register.do")
    public String showRegisterPage() {
        return "register";
    }

    @PostMapping("/login.do")
    public String login(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            @RequestParam("loginType") String loginType,
            HttpSession session,
            Model model) {
        
        boolean isValidUser = userService.validateUser(username, password, loginType);

        if (isValidUser) {
            session.setAttribute("user", username);
            session.setAttribute("loginType", loginType);
            return "redirect:/main.do";
        } else {
            model.addAttribute("error", "아이디혹은 비밀번호가 틀립니다.");
            return "login";
        }
    }

    @GetMapping("/logout.do")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login.do";
    }
    // 회원가입 처리 (간단한 예시)
    @PostMapping("/register.do")
    public String register(String username, String password, Model model) {
        // 회원가입 처리 로직 추가 (데이터베이스 저장 등)
        model.addAttribute("message", "회원가입이 완료되었습니다.");
        return "redirect:/login.do";
    }

    // 마이페이지 이동
    @GetMapping("/mypage.do")
    public String showMyPage(HttpSession session, Model model) {
        String loginType = (String) session.getAttribute("loginType");

        if ("admin".equals(loginType)) {
            return "redirect:/adminMypage";
        } else if ("customer".equals(loginType)) {
            return "redirect:/customerMypage";
        } else {
            return "redirect:/login.do";
        }
    }

    @GetMapping("/mypage/admin.do")
    public String showAdminMypage(HttpSession session, Model model) {
        Admin admin = (Admin) session.getAttribute("user");
        if (admin != null) {
            model.addAttribute("admin", admin);
            return "adminMypage";
        } else {
            return "redirect:/login.do";
        }
    }

    @GetMapping("/mypage/customer.do")
    public String showCustomerMypage(HttpSession session, Model model) {
        Customer customer = (Customer) session.getAttribute("user");
        if (customer != null) {
            model.addAttribute("customer", customer);
            return "customerMypage";
        } else {
            return "redirect:/login.do";
        }
    }
    
  
}
