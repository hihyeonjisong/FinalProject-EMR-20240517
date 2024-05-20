package kr.or.ddit.controller.nurse;

import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.NurseScheduleVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ExcelUpload {
	
	public static List<NurseScheduleVO> getExcelList(MultipartFile file) {
		List<NurseScheduleVO> exList = new ArrayList<NurseScheduleVO>();
		
		try {
			exList = readExcel(file.getInputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return exList;
		
	}
	
	public static List<NurseScheduleVO> readExcel(InputStream inputStream) throws IOException {
	    List<NurseScheduleVO> dataList = new ArrayList<>();
	    XSSFWorkbook workbook = null;

	    try {
	        workbook = new XSSFWorkbook(inputStream);

	        Sheet sheet = workbook.getSheetAt(0); // 첫 번째 시트를 읽음

	        Iterator<Row> rowIterator = sheet.iterator();
	        int month = 0;
	        while (rowIterator.hasNext()) {
	            Row row = rowIterator.next();

	            // 헤더 행 스킵
	            // 여기서 스킵할 행 조절하기
	            if (row.getRowNum() == 0) {
					Cell monthCell = row.getCell(0);
					String monthString = monthCell.getStringCellValue();
					log.info("title : " + monthString);
					String monthNum = monthString.split("월")[0];
					log.info("monthNum : " + monthNum);
					month = Integer.parseInt(monthNum);
					continue;
				}
	            
	            if (row.getRowNum() == 1) {
	                continue;
	            }

	            // 엑셀 데이터를 읽어서 ExcelVO 객체에 매핑
	            
	            NurseScheduleVO nurseScheduleVO = new NurseScheduleVO();
	            Cell noCell = row.getCell(0);

	            if (noCell.getCellTypeEnum() == CellType.NUMERIC) {
	                nurseScheduleVO.setEmpNo((int) noCell.getNumericCellValue());
	            } else if (noCell.getCellTypeEnum() == CellType.STRING) {
	            	nurseScheduleVO.setEmpNo(Integer.parseInt(noCell.getStringCellValue()));
	            }
	            
	            nurseScheduleVO.setMemName(row.getCell(1).getStringCellValue());
	            
	            log.info("empNo : " + nurseScheduleVO.getEmpNo());
	            log.info("empName : " + nurseScheduleVO.getMemName());
	            
	            nurseScheduleVO.setMemName(row.getCell(1).getStringCellValue());
	            int day = 1;
	            int countDay = 0;
	            int countEvening = 0;
	            int countNight = 0;
	            int countOff = 0;
	            Map<Integer, String> dutyMap = new HashMap<Integer, String>();
	            
	            // 달마다 for문 끝나는 index 조정하기
	            int startIndex = 2;
	            int endIndex = 33;
	            
	            final int finalMonth = month;
	            
	            int[] months = {4, 6, 9, 11};
	            boolean isExist = Arrays.stream(months).anyMatch(num -> num == finalMonth);
	            
	            LocalDate localDate = LocalDate.now();
	            int year = localDate.getYear();
	            
	            GregorianCalendar gc = new GregorianCalendar();
	            
	            log.info("isExist : " + isExist);
	            log.info("year : " + year);
	            log.info("isLeapYear : " + gc.isLeapYear(year));
	            
	            if (isExist) {
					endIndex = 32;
				}
	            
	            if (month == 2) {
	            	if (gc.isLeapYear(year)) {
	            		endIndex = 31;
					}
	            	endIndex = 30;
				}
	            
	            
	            for (int i = startIndex; i < endIndex; i++) {
	            	String duty = row.getCell(i).getStringCellValue();
	            	dutyMap.put(day, duty);
	            	log.info("day : " + day);
	            	log.info("i : " + i);
	            	log.info("duty : " + duty);
	            	if (duty.equals("D")) {
						countDay++;
					}
	            	if (duty.equals("E")) {
	            		countEvening++;
	            	}
	            	if (duty.equals("N")) {
	            		countNight++;
	            	}
	            	if (duty.equals("O")) {
	            		countOff++;
	            	}
	            	day++;
	            }
	            nurseScheduleVO.setScheduleList(dutyMap);
	            
	            nurseScheduleVO.setMonth(month);
	            
	            log.info("day : " + countDay);
	            log.info("evening : " + countEvening);
	            log.info("night : " + countNight);
	            log.info("off : " + countOff);
	            
	            nurseScheduleVO.setDayCount(countDay);
	            nurseScheduleVO.setEveningCount(countEvening);
	            nurseScheduleVO.setNightCount(countNight);
	            nurseScheduleVO.setOffCount(countOff);
	            
	            dataList.add(nurseScheduleVO);
	        }
	    } finally {
	        if (workbook != null) {
	            workbook.close();
	        }
	    }

	    return dataList;
	}
}
