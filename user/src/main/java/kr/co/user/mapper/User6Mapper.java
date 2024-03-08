package kr.co.user.mapper;

import kr.co.user.dto.User6DTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface User6Mapper {
    public void insertUser6(User6DTO user6DTO);
    public User6DTO selectUser6(int seq);
    public List<User6DTO> selectUser6s();
    public void updateUser6(User6DTO user6DTO);
    public void deleteUser6(int seq);
}
