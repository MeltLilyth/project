package service;

import pojo.User;

public interface UserService {
    public User queryUser(String accountId)throws Exception;
    public void addUser(User user)throws Exception;
    public void updateMessage(User user)throws Exception;
    public String getAccountId()throws Exception;
}
