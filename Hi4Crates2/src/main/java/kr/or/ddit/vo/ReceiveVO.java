package kr.or.ddit.vo;

import lombok.Data;

@Data
public class ReceiveVO {
	
	public int receiveNo;          // 접수 번호
    public String receiveDate;       // 접수 날짜
    public int receiveCash;       // 현금 결제 여부_
    public int receiveCard;      // 카드 결제 여부_
    public String receiveType;       // 접수 유형 > 컨트롤러에서 하기
    public int receiveCost;        // 접수 비용_
    public int receiveCostSum;     // 접수 비용 합계
    public int empNo;             // 직원 번호 > .jsp 임시로 10000번넣음
    public int receiptNo;        // 영수증 번호_
    public String receiveResult;      // 접수 결과 >컨트롤러에서하기  남은금액이 0이면 Y 넣기
    
    public int leftCost; // 남은금액 - 결제하기 모달에서 입력한 금액_
    public String codeName; // 결제방식
    
    public int mriPrice;
    public int xrayPrice;
    public int mulliPrice;
    public int hpPrice;
    public int surgeryPrice;
}
