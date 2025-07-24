package com.mindfulEatingApp.mindfulEatingApp.services;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.gson.GsonFactory;
import com.mindfulEatingApp.mindfulEatingApp.model.User;
import com.mindfulEatingApp.mindfulEatingApp.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections; // Changed from Arrays to Collections for single element
import java.util.List;

@Service
@RequiredArgsConstructor
public class GoogleSignInService {

    private static final Logger logger = LoggerFactory.getLogger(GoogleSignInService.class);

    // Only using Android Client ID for verification
    @Value("${google.client-id.web}")
    private String androidClientId; // <--- KEEP ONLY THIS ONE

    // If 'google.client-id' (web client ID) is still defined in application.properties
    // but you don't intend to use it for verification, you could comment out or remove this:
    // @Value("${google.client-id}")
    // private String webClientId;

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public User authenticateGoogleUser(String idTokenString) throws GeneralSecurityException, IOException {
        // Build the verifier with only the Android Client ID in the audience.
        List<String> audienceClients = Collections.singletonList(androidClientId); // <--- MODIFIED TO USE ONLY ANDROID CLIENT ID
        
        GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(
                new NetHttpTransport(),
                new GsonFactory())
                .setAudience(audienceClients) // Set audience to include only the Android client ID
                .setIssuer("https://accounts.google.com") // Standard Google issuer
                .build();

        GoogleIdToken idToken = verifier.verify(idTokenString);

        if (idToken != null) {
            GoogleIdToken.Payload payload = idToken.getPayload();

            String email = payload.getEmail();
            String name = (String) payload.get("name"); // 'name' might be null

            // Find or create user
            return userRepository.findByEmail(email)
                    .orElseGet(() -> {
                        logger.info("Creating new user from Google Sign-In: {}", email);
                        User newUser = new User();
                        newUser.setEmail(email);
                        // Ensure username is not null; fall back to email if name is missing
                        newUser.setUsername(name != null && !name.isEmpty() ? name : email.split("@")[0]);
                        // Generate a random password for Google-signed-up users
                        newUser.setPassword(passwordEncoder.encode(generateRandomPassword()));
                        return userRepository.save(newUser);
                    });
        }
        logger.warn("Google ID Token verification failed: Token is invalid or null. Token received: {}", idTokenString);
        throw new GeneralSecurityException("Google ID Token verification failed: Token is invalid or null.");
    }

    private String generateRandomPassword() {
        // Generates a random UUID as a placeholder password for users signing in via Google.
        // They won't use this password directly.
        return java.util.UUID.randomUUID().toString();
    }
}