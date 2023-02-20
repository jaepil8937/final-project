package com.last.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.PasswordEncoder;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	PasswordEncoder passwordEncoder;
	@Autowired
	EmployeeUserDetailsService employeeUserDetailsService;

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.csrf().disable()
			.authorizeRequests()
			.antMatchers("/home", "/login").permitAll()
			.antMatchers("/hr").hasAnyRole("EMPLOYEE", "ADMIN")
			.antMatchers("/holiday").hasAnyRole("EMPLOYEE", "ADMIN")
			.antMatchers("/work").hasAnyRole("EMPLOYEE", "ADMIN")
			.antMatchers("/pay").hasAnyRole("EMPLOYEE", "ADMIN")
			.antMatchers("/salary").hasAnyRole("EMPLOYEE", "ADMIN")
			.antMatchers("/vacation/calculate", "/vacation/apply", "/vacation/used").hasAnyRole("EMPLOYEE", "ADMIN")
			.antMatchers("/vacation/setting").hasRole("ADMIN")
			.and()
			.formLogin()
			.loginPage("/login")
			.loginProcessingUrl("/login")
			.usernameParameter("employeeNo")
			.passwordParameter("password")
			.defaultSuccessUrl("/home", true)
			.failureUrl("/login?error=fail")
			.and()
			.logout()
			.logoutUrl("/logout")
			.logoutSuccessUrl("/home")
			.invalidateHttpSession(true)
			.deleteCookies("JSESSIONID");
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(employeeUserDetailsService).passwordEncoder(passwordEncoder);
	}
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**");
	}
}
