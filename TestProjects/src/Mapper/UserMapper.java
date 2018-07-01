package Mapper;

import pojo.User;

public interface UserMapper {
    public User findUserById(String accountId)throws Exception;
    public void insertUser(User user) throws Exception;
    public void updateUser(User user)throws Exception;
}
