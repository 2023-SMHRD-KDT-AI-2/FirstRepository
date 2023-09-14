package playwithme.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CctvDTO {
	private int cctv_num; // 카메라 번호
	private String x; // 경도
	private String y; // 위도
	

}
