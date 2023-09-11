package playwithme.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardDTO {
	private int boardNum;   // 게시판 번호
	private String member_Id; // 아이디
	private String title; // 제목
	private String b_Content; // 내용
	private String b_Date; // 작성시간
	private String place; // 모임장소
	private Double longitude; // 경도
	private Double latitude; // 위도
	private String meetTime; // 모임시간
	private int numPeople; // 모임 인원 수

}
