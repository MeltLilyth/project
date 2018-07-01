package service;

import Mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import pojo.User;

import javax.annotation.Resource;
import java.util.Random;

public class UserServiceImpl implements UserService {
    @Autowired(required = false)
    private  UserMapper userMapper;
    @Override
    public User queryUser(String accountId) throws Exception {
        return userMapper.findUserById(accountId);
    }

    @Override
    public void addUser(User user) throws Exception {
        userMapper.insertUser(user);
    }

    @Override
    public void updateMessage(User user) throws Exception {
         userMapper.updateUser(user);
    }

    @Override
    public String getAccountId() throws Exception {
        String str = "";
        Random random = new Random();
        int i = 0;
        while(i<10){
            int j = random.nextInt(10);
            if(j!=0){
                str = str + j;
                i++;
            }
        }
        return str;
    }
}
