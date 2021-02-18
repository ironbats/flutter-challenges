package br.com.softskills.service;

import br.com.softskills.dto.SoftSkillDTO;
import br.com.softskills.dto.SoftSkillListDTO;
import br.com.softskills.model.SoftSkillModel;
import br.com.softskills.repository.SoftSkillRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
public class DefaultSoftSkillSerice {


    @Autowired
    private SoftSkillRepository softSkillRepository;

    public void save(SoftSkillDTO dto) {

        SoftSkillModel softSkillModel =
                SoftSkillModel.builder()
                        .name(dto.getName())
                        .cargo(dto.getCargo())
                        .project(dto.getProject())
                        .skills(dto.getSkills()).build();

        try {
            softSkillRepository.save(softSkillModel);
        } catch (Exception cause) {
            log.error("Failure to save " + cause.getMessage());
        }

    }

    public SoftSkillListDTO listAllSkills() {
        List<SoftSkillModel> allSoftSKills = softSkillRepository.findAll();

        SoftSkillListDTO softSkillListDTO = new SoftSkillListDTO();
        List<SoftSkillDTO> dtoList = new ArrayList<>();

        allSoftSKills.forEach(model -> {
            SoftSkillDTO dto = SoftSkillDTO.builder()
                    .cargo(model.getCargo())
                    .name(model.getName())
                    .skills(model.getSkills())
                    .project(model.getProject()).build();
            dtoList.add(dto);

        });

        softSkillListDTO.setDto(dtoList);

        return softSkillListDTO;
    }
}
