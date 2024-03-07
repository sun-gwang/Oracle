package kr.co.user.controller;

import kr.co.user.dto.User2DTO;
import kr.co.user.service.User2Service;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class User2Controller {

    private final User2Service user2Service;

    public User2Controller(User2Service user2Service) {
        this.user2Service = user2Service;
    }

    @GetMapping("/user2/list")
    public String list(Model model){

        List <User2DTO> users = user2Service.selectUser2s();
        model.addAttribute("users", users);
        return "/user2/list";
    }

    @GetMapping("/user2/register")
    public String register(){

        return "/user2/register";
    }

    @PostMapping("/user2/register")
    public String register(User2DTO user2DTO){

        user2Service.insertUser2(user2DTO);

        return "redirect:/user2/list";
    }

    @GetMapping("/user2/modify")
    public String modify(@RequestParam("id") String id, Model model){

        User2DTO user2DTO = user2Service.selectUser2(id);
        model.addAttribute(user2DTO);
        return "/user2/modify";
    }

    @PostMapping("/user2/modify")
    public String modify(User2DTO user2DTO){

        user2Service.updateUser2(user2DTO);
        return "redirect:/user2/list";
    }

    @GetMapping("/user2/delete")
    public String delete(@RequestParam("id") String id){

        user2Service.deleteUser2(id);
        return "redirect:/user2/list";
    }

}
