package playwithme.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class ChattingListDTO {
	private String chatting_Room_num;
	private String chatting_Room_title;
	private String member_Id;

}
