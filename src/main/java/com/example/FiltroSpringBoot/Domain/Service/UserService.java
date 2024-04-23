package com.example.FiltroSpringBoot.Domain.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.FiltroSpringBoot.Domain.Exceptions.InvalidUserException;
import com.example.FiltroSpringBoot.Domain.Exceptions.UserDuplicateException;
import com.example.FiltroSpringBoot.Domain.Repository.UserRepository;
import com.example.FiltroSpringBoot.Persistence.Entity.User;

import java.util.LinkedHashMap;
import java.util.Map;

@Service
public class UserService {
    @Autowired
    UserRepository userRepository;

    public void userValidation(String username, String password) {
        User user = userRepository.findByUsername(username);
        if (user == null || !user.getEncryptedPass().equalsIgnoreCase(password)) {
            throw new InvalidUserException("The credentials entered are wrong");
        }
    }

    public Map<Object, Object> registerUser(User user) {
        try {
            userRepository.save(user);
            return new LinkedHashMap<>() {{
                put("message", "User has been registered successfully");
            }};
        } catch (Exception e) {
            throw new UserDuplicateException("Username already exists");
        }
    }
}
