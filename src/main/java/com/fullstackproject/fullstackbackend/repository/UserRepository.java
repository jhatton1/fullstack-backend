package com.fullstackproject.fullstackbackend.repository;

import com.fullstackproject.fullstackbackend.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository  extends JpaRepository<User, Long> {
}
