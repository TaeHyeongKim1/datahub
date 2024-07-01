package datacentererp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping("/main.do")
    public String showMainPage(Model model) {
        // 모델에 필요한 데이터를 추가할 수 있습니다.
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