package com.ris.CoolinarikaWEB.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	UserService service;

	@Bean
	public PasswordEncoder getPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		// TODO Auto-generated method stub
		auth.userDetailsService(service);
	}

	@Override
	public void configure(HttpSecurity security) throws Exception{
		// TODO Auto-generated method stub
		security.authorizeRequests()
		.antMatchers("/", "/login", "/signup").permitAll()
		.antMatchers("/admin/**", "/pages/new_category.jsp", "/pages/reports_page.jsp")
		.hasRole("ADMIN")
		.antMatchers("/users/**")
		.hasAnyRole("ADMIN", "USER")
		.and()
		.formLogin()
		.loginPage("/pages/login.jsp")
		.loginProcessingUrl("/login")
		.defaultSuccessUrl("/users/index")//ovde mora getAll da bi pokupio sve inf
		.failureForwardUrl("/pages/login_failed.jsp")//staviti failure stranicu
		.and()
		.logout()
		.invalidateHttpSession(true)
		.logoutSuccessUrl("/pages/login.jsp").and()
		.exceptionHandling().accessDeniedPage("/pages/access_denied.jsp")
		.and().rememberMe()
		.and().csrf().disable();

	}
}
