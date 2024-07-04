package datacentererp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping("/main.do")
    public String showMainPage(Model model) {
        
        return "main";
    }

   
	//http://localhost:7080/DataCenterERP/main.do
    @GetMapping("/mainlogin.do")
    public String showMainPage(HttpSession session, Model model) {
        String username = (String) session.getAttribute("user");
        String loginType = (String) session.getAttribute("loginType");

        if (username == null || loginType == null) {
            return "redirect:/login.do";
        }

        model.addAttribute("username", username);
        model.addAttribute("loginType", loginType);

        
        return "main";
    }
}