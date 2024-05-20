package kr.or.ddit.service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.ProtectorVO;

public interface IProtectorService {

	ServiceResult insertProtector(ProtectorVO protector);

	ServiceResult modifyProtector(ProtectorVO protector);

}
