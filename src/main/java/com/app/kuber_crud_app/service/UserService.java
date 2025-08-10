package com.app.kuber_crud_app.service;

import com.app.kuber_crud_app.repository.User;
import com.app.kuber_crud_app.repository.UserRepository;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.*;

import org.slf4j.Logger;

@RequiredArgsConstructor
@Service
public class UserService {

    @PostConstruct
    void mm() {
        Logger logger = LoggerFactory.getLogger(getClass());
        logger.info("DB_URL={}", System.getenv("DB_URL"));
        logger.info("DB_USER={}", System.getenv("DB_USER"));
        logger.info("DB_PASSWORD={}", System.getenv("DB_PASSWORD"));
    }

    private final UserRepository userRepository;

    public User createUser(User user) {
        user.setId(null);
        return userRepository.save(user);
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public Optional<User> getUserById(Long id) {
        return userRepository.findById(id);
    }

    public Optional<User> updateUser(Long userId, User updatedUser) {
        return userRepository.findById(userId).map(existing -> {
            existing.setFirstName(updatedUser.getFirstName());
            existing.setLastName(updatedUser.getLastName());
            existing.setEmail(updatedUser.getEmail());
            existing.setPhone(updatedUser.getPhone());
            return userRepository.save(existing);
        });
    }

    public boolean deleteUser(Long id) {
        if (userRepository.existsById(id)) {
            userRepository.deleteById(id);
            return true;
        }
        return false;
    }

}
