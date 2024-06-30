package datacentererp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

    // 로그인 처리
    @PostMapping("/login.do")
    public String login(String username, String password, HttpSession session, Model model) {
        // 로그인 처리 로직 추가 (데이터베이스 조회 등)
        if ("admin".equals(username) && "adminpassword".equals(password)) {
            session.setAttribute("user", username);
            return "redirect:/main.do";
        } else if ("customer".equals(username) && "customerpassword".equals(password)) {
            session.setAttribute("user", username);
            return "redirect:/main.do";
        } else {
            model.addAttribute("error", "Invalid username or password.");
            return "login";
        }
    }

    // 로그아웃 처리
    @GetMapping("/logout.do")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login.do";
    }

    // 회원가입 처리 (간단한 예시)
    @PostMapping("/register.do")
    public String register(String username, String password, Model model) {
        // 회원가입 처리 로직 추가 (데이터베이스 저장 등)
        model.addAttribute("message", "Registration successful. Please login.");
        return "redirect:/login.do";
    }

    // 마이페이지 이동
    @GetMapping("/mypage.do")
    public String showMyPage(HttpSession session, Model model) {
        String user = (String) session.getAttribute("user");
        if (user != null) {
            model.addAttribute("user", user);
            return "mypage";
        } else {
            return "redirect:/login.do";
        }
    }

  
}
