package br.com.softskills.repository;

import br.com.softskills.model.SoftSkillModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SoftSkillRepository extends JpaRepository<SoftSkillModel, Long> {
}
