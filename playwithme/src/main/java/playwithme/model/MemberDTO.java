package playwithme.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberDTO {
	
	private String member_Id;
	private String pw;
	private int age;
	private	String m_Name; // 사용자이름
	private String gender;
	private int temper;
	private String m_Profile;
	private String mbti;
}