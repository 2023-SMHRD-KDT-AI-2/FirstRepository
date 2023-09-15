package playwithme.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class GetChatDTO {
	int chatting_num;
	int chatting_room_num;
	String member_id;
	String ch_content;
	String ch_date;
	

}
