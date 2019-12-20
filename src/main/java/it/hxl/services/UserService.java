package it.hxl.services;

import it.hxl.dao.UserDao;
import it.hxl.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserService {
    @Autowired
    private UserDao userDao;

    public List<User> findAll(){
       return userDao.findUser(new User());
    }

    public User findUser(String username, String password){
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        List<User> users = userDao.findUser(user);
        return users.size() > 0?users.get(0): null;
    }

    public User findUserByName(String username){
        return userDao.findUserByName(username);
    }

    public int addUser(User user){
        return userDao.addUser(user);
    }

    public int updateUser(User user){
        return userDao.updateUser(user);
    }
}
