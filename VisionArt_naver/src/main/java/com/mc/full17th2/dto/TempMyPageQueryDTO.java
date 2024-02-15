package com.mc.full17th2.dto;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Component
@NoArgsConstructor
@AllArgsConstructor
public class TempMyPageQueryDTO {
    Integer memberId;   // 게시글 조회할 멤버
    Integer start;   // 조회를 시작할 페이지 수
    Integer limit;   // 가져올 데이터 수
}
