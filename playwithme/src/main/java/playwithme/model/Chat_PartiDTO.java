
/*
 * 최종 수정일 : 2023.09.15
 * 작성자 박기원
 * 목적 : 파티방에 있는 참여자 이름 및 방넘버
 */

package playwithme.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Chat_PartiDTO {
	private int chatting_Room_num;
	private String member_Id;
}
