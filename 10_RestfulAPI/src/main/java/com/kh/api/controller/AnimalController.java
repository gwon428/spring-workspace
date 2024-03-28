package com.kh.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.api.model.vo.Animal;
import com.kh.api.service.AnimalService;

@RestController
public class AnimalController {
	
	@Autowired
	private AnimalService service;
	
	// 추가 -> http://localhost:8080/api/animal
	@PostMapping("/animal")
	public ResponseEntity insert(@RequestBody Animal animal) {
		service.insert(animal);
		return new ResponseEntity(HttpStatus.OK);
	}
	
	// 전체보기 -> GET : http://localhost:8080/api/animal
	@GetMapping("/animal")
	public ResponseEntity select() {
		List<Animal> list = service.select();
		return new ResponseEntity(list, HttpStatus.OK);
	}
	
	// 하나 보기 -> GET : http://localhost:8080/api/animalView?no=1
	// --> GET : http://localhost:8080/api/animal/1
//	@GetMapping("/animalView")
//	public ResponseEntity select(@RequestParam int no) {
	
	@GetMapping("/animal/{no}")
	public ResponseEntity select(@PathVariable int no) {
		Animal vo = service.select(no);
		if(vo!=null) {
			return new ResponseEntity(vo, HttpStatus.OK);
		} else {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		}
		
	}
	
	// 수정 -> PUT : http://localhost:8080/api/animal
	@PutMapping("/animal")
	public ResponseEntity update(@RequestBody Animal animal) {
		service.update(animal);
		return new ResponseEntity(animal, HttpStatus.OK);
	}
	
	// 삭제 -> DELETE : http://localhost:8080/api/animal/1
	@DeleteMapping("/animal/{no}")
	public ResponseEntity delete(@PathVariable int no) {
		service.delete(no);
		return new ResponseEntity(HttpStatus.OK);
	}
}
