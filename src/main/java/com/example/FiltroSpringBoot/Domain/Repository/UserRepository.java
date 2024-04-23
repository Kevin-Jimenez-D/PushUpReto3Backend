package com.example.FiltroSpringBoot.Domain.Repository;

import com.example.FiltroSpringBoot.Persistence.Entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;



@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    User findByUsername(String username);
}
