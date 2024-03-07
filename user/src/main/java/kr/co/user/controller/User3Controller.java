package kr.co.user.controller;

import kr.co.user.dto.User3DTO;
import kr.co.user.service.User3Service;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class User3Controller {

    private final User3Service user3Service;

    public User3Controller(User3Service user3Service) {
        this.user3Service = user3Service;
    }

    @GetMapping("/user3/list")
    public String list(Model model){
        List<User3DTO> users = user3Service.selectUser3s();
        model.addAttribute("users", users);
        return "/user3/list";
    }

    @GetMapping("/user3/register")
    public String register(){
        return "/user3/register";
    }

    @PostMapping("/user3/register")
    public String register(User3DTO user3DTO){

        user3Service.insertUser3(user3DTO);
        return "redirect:/user3/list";
    }

    @GetMapping("/user3/modify")
    public String modify(@RequestParam("id")String id, Model model){

        User3DTO user3DTO = user3Service.selectUser3(id);
        model.addAttribute(user3DTO);
        return "/user3/modify";
    }

    @PostMapping("/user3/modify")
    public String modify(User3DTO user3DTO){

        user3Service.updateUser3(user3DTO);
        return "redirect:/user3/list";
    }

    @GetMapping("/user3/delete")
    public String delete(@RequestParam("id") String id){

        user3Service.deleteUser3(id);
        return "redirect:/user3/list";
    }
}
