package playwithme.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberDTO {
	
	private String memberid;
	private String pw;
	private int age;
	private	String mName;
	private String gender;
	private int temper;
	private String mProfile;
	private String MBTI;
}