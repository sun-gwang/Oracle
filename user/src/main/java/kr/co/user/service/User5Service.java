package kr.co.user.service;

import kr.co.user.dto.User5DTO;
import kr.co.user.mapper.User5Mapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class User5Service {

    private final User5Mapper mapper;

    public User5Service(User5Mapper mapper) {
        this.mapper = mapper;
    }
    public void insertUser5(User5DTO user5DTO){
        mapper.insertUser5(user5DTO);
    }
    public User5DTO selectUser5(String name){
        return mapper.selectUser5(name);
    }
    public List<User5DTO> selectUser5s(){
        return mapper.selectUser5s();
    }
    public void updateUser5(User5DTO user5DTO){
        mapper.updateUser5(user5DTO);
    }
    public void deleteUser5(String name){
        mapper.deleteUser5(name);
    }
}
