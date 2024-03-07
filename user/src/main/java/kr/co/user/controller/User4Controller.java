package kr.co.user.controller;

import kr.co.user.dto.User4DTO;
import kr.co.user.service.User4Service;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class User4Controller {

    private final User4Service user4Service;

    public User4Controller(User4Service user4Service) {
        this.user4Service = user4Service;
    }

    @GetMapping("/user4/list")
    public String list(Model model) {

        List<User4DTO> users = user4Service.selectUser4s();
        model.addAttribute("users", users);
        return "/user4/list";
    }

    @GetMapping("/user4/register")
    public String register() {
        return "/user4/register";
    }

    public String register(User4DTO user4DTO) {

        user4Service.insertUser4(user4DTO);
        return "redirect:/user4/list";
    }

    @GetMapping("/user4/modify")
    public String modify(@RequestParam("name") String name, Model model) {
        User4DTO user4DTO = user4Service.selectUser4(name);
        model.addAttribute(user4DTO);
        return "/user4/modify";
    }

    @PostMapping("/user4/modify")
    public String modify(User4DTO user4DTO) {

        user4Service.updateUser4(user4DTO);
        return "redirect:/user4/list";
    }

    @GetMapping("/user4/delete")
    public String delete(@RequestParam("name") String name) {
        user4Service.deleteUser4(name);
        return "redirect:/user4/list";
    }
}



