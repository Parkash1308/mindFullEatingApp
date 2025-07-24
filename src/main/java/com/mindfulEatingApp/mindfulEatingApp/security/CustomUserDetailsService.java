package com.mindfulEatingApp.mindfulEatingApp.security;

import com.mindfulEatingApp.mindfulEatingApp.model.User;
import com.mindfulEatingApp.mindfulEatingApp.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collections;

@Service
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {

    private final UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new UsernameNotFoundException("User not found with email: " + email));

        // IMPORTANT: Create a Spring Security UserDetails object from your User entity.
        // This prevents direct entity serialization issues and StackOverflowError.
        return new org.springframework.security.core.userdetails.User(
                user.getEmail(),          // Username for Spring Security (using email)
                user.getPassword(),       // Hashed password
                Collections.emptyList()   // User roles/authorities (empty for now)
        );
    }
}