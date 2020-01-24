package com.ris.CoolinarikaWEB.converter;

import org.springframework.core.convert.converter.Converter;

import com.ris.CoolinarikaWEB.repository.RoleRepository;

import model.Role;

public class RoleConverter implements Converter<String, Role> {

	RoleRepository rr;
	
	@Override
	public Role convert(String source) {
		int roleId = -1;
		try {
			roleId = Integer.parseInt(source);
		} catch (NumberFormatException e) {
			// TODO: handle exception
		}
		Role role = rr.findById(roleId).get();
		
		return role;
	}

}
