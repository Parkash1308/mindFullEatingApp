package com.mindfulEatingApp.mindfulEatingApp.dto.response;

import lombok.*;

@Data
@Builder
public class RegisterResponse {
    private Long id;
    private String username;
    private String email;
    private String message;
}