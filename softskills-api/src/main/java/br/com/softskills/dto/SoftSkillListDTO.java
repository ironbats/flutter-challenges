package br.com.softskills.dto;

import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PACKAGE)
public class SoftSkillListDTO {

    private List<SoftSkillDTO> dto = new ArrayList<>();
}
