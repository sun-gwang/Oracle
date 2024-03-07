package kr.co.user.service;

import kr.co.user.dto.User4DTO;
import kr.co.user.mapper.User4Mapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class User4Service {

    private final User4Mapper mapper;

    public User4Service(User4Mapper mapper) {
        this.mapper = mapper;
    }

    public void insertUser4(User4DTO user4DTO){
        mapper.insertUser4(user4DTO);
    }
    public User4DTO selectUser4(String name){
        return mapper.selectUser4(name);
    }
    public List<User4DTO> selectUser4s(){
        return mapper.selectUser4s();
    }
    public void updateUser4(User4DTO user4DTO){
        mapper.updateUser4(user4DTO);
    }
    public void deleteUser4(String name){
        mapper.deleteUser4(name);
    }
}
