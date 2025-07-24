package com.mindfulEatingApp.mindfulEatingApp.services.Impl;

import com.mindfulEatingApp.mindfulEatingApp.dto.request.RegisterRequest;
import com.mindfulEatingApp.mindfulEatingApp.dto.request.SignInRequest;
import com.mindfulEatingApp.mindfulEatingApp.dto.response.RegisterResponse;
import com.mindfulEatingApp.mindfulEatingApp.dto.response.SignInResponse;
import com.mindfulEatingApp.mindfulEatingApp.model.User;
import com.mindfulEatingApp.mindfulEatingApp.repository.UserRepository;
import com.mindfulEatingApp.mindfulEatingApp.services.UserService;
import com.mindfulEatingApp.mindfulEatingApp.security.JwtTokenProvider; // <--- ADD THIS IMPORT
import lombok.RequiredArgsConstructor;

import java.util.Optional;
import org.springframework.security.authentication.AuthenticationManager; // <--- ADD THIS IMPORT
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken; // <--- ADD THIS IMPORT
import org.springframework.security.core.Authentication; // <--- ADD THIS IMPORT
import org.springframework.security.core.context.SecurityContextHolder; // <--- ADD THIS IMPORT
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final AuthenticationManager authenticationManager; // <--- ADD THIS INJECTION
    private final JwtTokenProvider jwtTokenProvider;         // <--- ADD THIS INJECTION

    @Override
    public RegisterResponse registerUser(RegisterRequest request) {
        // Check if username or email already exists
        if (userRepository.existsByUsername(request.getUsername())) {
            throw new IllegalArgumentException("Username already taken");
        }
        
        if (userRepository.existsByEmail(request.getEmail())) {
            throw new IllegalArgumentException("Email already registered");
        }

        // Create new user
        User user = User.builder()
                .username(request.getUsername())
                .email(request.getEmail())
                .password(passwordEncoder.encode(request.getPassword()))
                .build();

        User savedUser = userRepository.save(user);

        return RegisterResponse.builder()
                .id(savedUser.getId())
                .username(savedUser.getUsername())
                .email(savedUser.getEmail())
                .message("User registered successfully")
                .build();
    }

    @Override
    public SignInResponse signInUser(SignInRequest request) {
        // Authenticate user using Spring Security's AuthenticationManager
        Authentication authentication = authenticationManager.authenticate( // <--- MODIFIED
                new UsernamePasswordAuthenticationToken(
                        request.getEmail(), // Username (email in your case)
                        request.getPassword()
                )
        );

        // Set authentication in SecurityContextHolder
        SecurityContextHolder.getContext().setAuthentication(authentication); // <--- ADDED

        // Retrieve the authenticated user from the database (optional, but good for response DTO)
        User user = userRepository.findByEmail(request.getEmail())
                .orElseThrow(() -> new RuntimeException("User not found after authentication"));

        // Generate JWT token
        String jwt = jwtTokenProvider.generateToken(authentication); // <--- ADDED

        return SignInResponse.builder()
                .id(user.getId())
                .username(user.getUsername())
                .email(user.getEmail())
                .token(jwt) // <--- ADDED: Set the generated JWT token
                .message("Authentication successful")
                .build();
    }
}