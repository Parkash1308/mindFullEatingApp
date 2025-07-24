package com.mindfulEatingApp.mindfulEatingApp.dto.request;

import jakarta.validation.constraints.*;
import lombok.*;

@Data
@Builder
public class RegisterRequest {
    @NotBlank(message = "Username is required")
    @Size(min = 3, max = 50, message = "Username must be 3-50 characters")
    private String username;

    @NotBlank(message = "Email is required")
    @Email(message = "Invalid email format")
    private String email;

    @NotBlank(message = "Password is required")

    private String password;
}