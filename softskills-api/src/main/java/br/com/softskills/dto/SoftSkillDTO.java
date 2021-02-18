package br.com.softskills.dto;

import lombok.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PACKAGE)
public class SoftSkillDTO {

    private Long id;
    private String name;
    private String cargo;
    private String project;
    private String skills;
}
