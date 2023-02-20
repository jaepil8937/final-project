package com.last.security;

import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;

import org.springframework.security.core.annotation.AuthenticationPrincipal;

@AuthenticationPrincipal
@Retention(RUNTIME)
public @interface AuthenticatedUser {

}
