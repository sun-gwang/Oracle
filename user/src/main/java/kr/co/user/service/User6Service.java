package kr.co.user.service;

import kr.co.user.dto.User6DTO;
import kr.co.user.mapper.User6Mapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class User6Service {

    private final User6Mapper mapper;

    public User6Service(User6Mapper mapper) {
        this.mapper = mapper;
    }

    public void insertUser6(User6DTO user6DTO){
        mapper.insertUser6(user6DTO);
    }
    public User6DTO selectUser6(int seq){
        return mapper.selectUser6(seq);
    }
    public List<User6DTO> selectUser6s(){
        return mapper.selectUser6s();
    }
    public void updateUser6(User6DTO user6DTO){
        mapper.updateUser6(user6DTO);
    }
    public void deleteUser6(int seq){
        mapper.deleteUser6(seq);
    }
}
