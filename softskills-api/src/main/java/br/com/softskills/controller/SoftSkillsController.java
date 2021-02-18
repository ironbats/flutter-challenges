package br.com.softskills.controller;

import br.com.softskills.dto.SoftSkillDTO;
import br.com.softskills.dto.SoftSkillListDTO;
import br.com.softskills.service.DefaultSoftSkillSerice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/flutter")
public class SoftSkillsController {

    @Autowired
    private DefaultSoftSkillSerice defaultSoftSkillService;

    @PostMapping(value = "/save")
    public void saveSoftSkills(@RequestBody SoftSkillDTO softSkillDTO) {
        defaultSoftSkillService.save(softSkillDTO);
    }

    @GetMapping(value = "/get-all-skills")
    public List<SoftSkillDTO> getAllSoftSKills(){
        SoftSkillListDTO dto =   defaultSoftSkillService.listAllSkills();
        return dto.getDto();
    }

}
