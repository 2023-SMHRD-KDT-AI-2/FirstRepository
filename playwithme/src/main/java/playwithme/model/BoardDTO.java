package playwithme.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardDTO {

	private int board_Num;   // 게시판 번호
	private String member_Id; // 아이디
	private String title; // 제목
	private String b_Content; // 내용
	private String b_Date; // 작성시간
	private String place; // 모임장소
	private Double longitude; // 위도
	private Double latitude; // 경도
	private String meet_Time; // 모임시간
	private int num_People; // 모임 인원 수
	private String chat_room_num; //게시판 연동 채팅방번호
	private String m_Profile; // 내 프로필 사진
	private String m_Name; // 사용자 닉네임
	private int temper; // 사용자 온도
	private int parti_num; // 참여자 인원


}
