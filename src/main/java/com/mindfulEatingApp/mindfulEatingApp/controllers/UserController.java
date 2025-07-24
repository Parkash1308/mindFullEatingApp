package com.mindfulEatingApp.mindfulEatingApp.controllers;

import com.mindfulEatingApp.mindfulEatingApp.dto.request.RegisterRequest;
import com.mindfulEatingApp.mindfulEatingApp.dto.request.SignInRequest;
import com.mindfulEatingApp.mindfulEatingApp.dto.response.RegisterResponse;
import com.mindfulEatingApp.mindfulEatingApp.dto.response.SignInResponse;
import com.mindfulEatingApp.mindfulEatingApp.model.User; // Import User model
import com.mindfulEatingApp.mindfulEatingApp.services.UserService;
import com.mindfulEatingApp.mindfulEatingApp.services.GoogleSignInService; // Import GoogleSignInService
import com.mindfulEatingApp.mindfulEatingApp.security.JwtTokenProvider; // Import JwtTokenProvider

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken; // Import
import org.springframework.security.core.Authentication; // Import
import org.springframework.security.core.context.SecurityContextHolder; // Import
import org.springframework.web.bind.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Collections; 
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;

@RestController
@RequestMapping("/api/user")
@RequiredArgsConstructor
@Tag(name = "User Management", description = "Endpoints for user registration and authentication")
public class UserController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    private final UserService userService;
    private final GoogleSignInService googleSignInService; // Inject GoogleSignInService
    private final JwtTokenProvider jwtTokenProvider; // Inject JwtTokenProvider

    @Operation(
        summary = "Register new user",
        description = "Create a new user account with username, email and password",
        responses = {
            @ApiResponse(responseCode = "201", description = "User created successfully"),
            @ApiResponse(responseCode = "400", description = "Invalid input"),
            @ApiResponse(responseCode = "409", description = "Username/email already exists")
        }
    )
    @PostMapping("/signup")
    public ResponseEntity<RegisterResponse> registerUser(
            @Valid @RequestBody RegisterRequest request) {
        
        RegisterResponse response = userService.registerUser(request);
        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }

    @Operation(
        summary = "Sign in user with email and password",
        description = "Authenticate user with email and password and return JWT token",
        responses = {
            @ApiResponse(responseCode = "200", description = "Authentication successful"),
            @ApiResponse(responseCode = "401", description = "Invalid credentials")
        }
    )
    @PostMapping("/signin")
    public ResponseEntity<SignInResponse> signInUser(
            @Valid @RequestBody SignInRequest request) {
        
        SignInResponse response = userService.signInUser(request);
        
        // The service now handles authentication and token generation.
        // We just check the message for success/failure.
        if (response.getMessage().equals("Authentication successful")) {
            return ResponseEntity.ok(response);
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
        }
    }

    @Operation(
        summary = "Sign in user with Google ID token",
        description = "Authenticate user with Google ID token and return JWT token. Creates new user if not exists.",
        responses = {
            @ApiResponse(responseCode = "200", description = "Google sign-in successful"),
            @ApiResponse(responseCode = "400", description = "Invalid Google ID token or other error")
        }
    )
    @PostMapping("/google-signin")
    public ResponseEntity<SignInResponse> googleSignIn(@RequestBody String idToken) {
        User user = null;
        String errorMessage = "Google sign-in failed due to an unknown error.";

        try {
            user = googleSignInService.authenticateGoogleUser(idToken);

            // If authentication is successful, manually set the security context
            Authentication authentication = new UsernamePasswordAuthenticationToken(
                    user.getEmail(), // Principal (username/email)
                    null,            // Credentials (not needed for token-based auth)
                    Collections.emptyList() // Authorities (roles) - add if you have them
            );
            SecurityContextHolder.getContext().setAuthentication(authentication);

            // Generate JWT token for the Google authenticated user
            String jwt = jwtTokenProvider.generateTokenFromUsername(user.getEmail());

            SignInResponse response = SignInResponse.builder()
                    .id(user.getId())
                    .email(user.getEmail())
                    .username(user.getUsername())
                    .token(jwt) // Set the generated JWT
                    .message("Google login successful")
                    .build();
            return ResponseEntity.ok(response);

        } catch (Exception e) {
            logger.error("Error during Google ID token authentication or user processing: {}", e.getMessage(), e);
            errorMessage = "Google sign-in failed: " + e.getMessage();
            SignInResponse errorResponse = SignInResponse.builder()
                    .message(errorMessage)
                    .build();
            return new ResponseEntity<>(errorResponse, HttpStatus.BAD_REQUEST);
        }
    }
}