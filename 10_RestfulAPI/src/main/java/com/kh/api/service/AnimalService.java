package com.kh.api.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.api.model.dao.AnimalDAO;
import com.kh.api.model.vo.Animal;

@Service
public class AnimalService {

	@Autowired
	private AnimalDAO dao;
	
	public int insert(Animal animal) {
		return dao.insert(animal);
	}
	
	public List<Animal> select(){
		return dao.select();
	}
	
	public Animal select(int no) {
		return dao.select(no);
	}
	
	public int update(Animal animal) {
		return dao.update(animal);
	}
	
	public int delete(int no) {
		return dao.delete(no);
	}
	
}
