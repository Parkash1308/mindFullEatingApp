package com.mindfulEatingApp.mindfulEatingApp.services;

import com.mindfulEatingApp.mindfulEatingApp.dto.request.RegisterRequest;
import com.mindfulEatingApp.mindfulEatingApp.dto.request.SignInRequest;
import com.mindfulEatingApp.mindfulEatingApp.dto.response.RegisterResponse;
import com.mindfulEatingApp.mindfulEatingApp.dto.response.SignInResponse;

public interface UserService {
    RegisterResponse registerUser(RegisterRequest request);
    SignInResponse signInUser(SignInRequest request);
}