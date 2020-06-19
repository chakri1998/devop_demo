package com.mindtree.app.repo;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.mindtree.app.entity.Employee;

@Repository
public interface EmployeeRepo extends JpaRepository<Employee, String> {

	@Transactional
	@Modifying
	@Query("update Employee e set e.rating = :rating where e.mId=:id")
	int updateFeedback(@Param("rating") float rating,@Param("id") String id);

}
