package playwithme.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class IdProfileDTO {
   private String member_id;
   private String m_profile;
   private String m_name;

}
