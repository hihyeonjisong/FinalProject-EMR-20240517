package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class GroupOrderDetailVO {

	private int groupOrderDetailKey;
	private String groupOrderDetailContent;
	private String groupOrderDetailCategory;
	private int groupOrderNo;
	
	
	private List<DiseaseVO> secondaryDiseaseList;
	private List<MedicineVO> medicineList;
	private String disNameKr;
	private String disNo;
	private String mdcinName;
	private String mdcinNo;
	
}
