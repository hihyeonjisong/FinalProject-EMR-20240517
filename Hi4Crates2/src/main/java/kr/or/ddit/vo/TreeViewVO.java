package kr.or.ddit.vo;

import lombok.Data;

@Data
public class TreeViewVO {
	
	private int level;
	private int id;
	private String empDepartment;
	private int leaf;
	private String empJob;
	private String text;
	private String parent;
	private String superiorName;
	private String icon = "bi bi-hospital";
}
