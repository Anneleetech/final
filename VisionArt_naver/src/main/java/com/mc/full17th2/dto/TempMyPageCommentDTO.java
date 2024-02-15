package com.mc.full17th2.dto;

import java.time.LocalDate;
import java.time.LocalTime;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class TempMyPageCommentDTO {
    int commentId;
    int memberId;
    int postId;
    LocalDate commentDate;
    LocalTime commentTime;
    String commentContent;
    String postTitle;
    int postFieldId;
    String postFieldName;
}
