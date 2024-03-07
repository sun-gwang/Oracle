package kr.co.user.service;

import kr.co.user.dto.User3DTO;
import kr.co.user.mapper.User3Mapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class User3Service {

    private final User3Mapper mapper;

    public User3Service(User3Mapper mapper) {
        this.mapper = mapper;
    }

    public void insertUser3(User3DTO user3DTO){
        mapper.insertUser3(user3DTO);
    }
    public User3DTO selectUser3(String id) {
        return mapper.selectUser3(id);
    }
    public List<User3DTO> selectUser3s(){
        return mapper.selectUser3s();
    }
    public void updateUser3(User3DTO user3DTO){
        mapper.updateUser3(user3DTO);
    }
    public void deleteUser3(String id){
        mapper.deleteUser3(id);
    }
}
