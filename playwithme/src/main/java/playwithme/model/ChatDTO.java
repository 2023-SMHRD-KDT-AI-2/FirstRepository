package playwithme.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatDTO {
   
   private String room; //채팅방번호
   private String senderName; //참여자ID
   private String message; //작성내용

   

}
