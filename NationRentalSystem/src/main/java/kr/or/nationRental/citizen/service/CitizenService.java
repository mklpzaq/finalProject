package kr.or.nationRental.citizen.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CitizenService {
	@Autowired
	private CitizenDto citizenDto;
	
	public int addCitizen(String citizenDto) {
		int row = CitizenDao.insertCitizen(citizenDto);
		return row;
	}
	
}
