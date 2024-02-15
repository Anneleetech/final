package com.mc.full17th2.dto;

import java.time.LocalDate;
import java.time.LocalTime;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class TempMyPagePostDTO {
    int postId;
    int postFieldId;
    String postFieldName;
    int artFieldId;
    String artFieldName;
    LocalDate postDate;
    LocalTime postTime;
    String title;
}
