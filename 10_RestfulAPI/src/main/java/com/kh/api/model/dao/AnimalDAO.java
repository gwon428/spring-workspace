package com.kh.api.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.api.model.vo.Animal;

@Repository
public class AnimalDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	public int insert(Animal animal) {
		return session.insert("animal.insert", animal);
	}
	
	public List<Animal> select(){
		return session.selectList("animal.select", 0);
	}
	
	public Animal select(int no) {
		return session.selectOne("animal.select", no);
	}
	
	public int update(Animal animal) {
		return session.update("animal.update", animal);
	}
	
	public int delete(int no) {
		return session.delete("animal.delete", no);
	}
	
}
