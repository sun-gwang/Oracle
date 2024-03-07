package kr.co.user.mapper;

import kr.co.user.dto.User1DTO;
import kr.co.user.dto.User3DTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface User3Mapper {
    public void insertUser3(User3DTO user3DTO);
    public User3DTO selectUser3(String id);
    public List<User3DTO> selectUser3s();
    public void updateUser3(User3DTO user3DTO);
    public void deleteUser3(String id);
}
