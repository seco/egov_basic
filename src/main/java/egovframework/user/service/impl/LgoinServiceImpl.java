/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.user.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.user.service.LoginService;

/**
 * @Class Name : LoginServiceImpl.java
 * @Description : Login Business Implement Class
 * @Modification Information
 * @
 * @  수정일      			수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.03.06      김재문			      최초생성
 *
 * @author 김재문
 * @since 2018. 03.06
 * @version 1.0
 * @see
 *
 */

@Service("loginService")
public class LgoinServiceImpl extends EgovAbstractServiceImpl implements LoginService {

	private static final Logger LOGGER = LoggerFactory.getLogger(LgoinServiceImpl.class);

	/** SampleDAO */
	// TODO ibatis 사용
	@Resource(name = "defaultDAO")
	private DefaultDAO defaultDAO;
	
	// TODO mybatis 사용
	//  @Resource(name="sampleMapper")
	//	private SampleMapper sampleDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	
	/**
	 * 로그인 이력 등록
	 * @param vo - 등록할 정보가 담긴 EgovMap
	 * @return 등록 결과
	 * @exception Exception
	 */
	@Transactional	
	@Override
	public String Login(Map map) throws Exception {
		//login
		map.put("sqlId", "userLogin.Login");
		map.put("id", egovIdGnrService.getNextStringId());
		LOGGER.debug(map.toString());
		return defaultDAO.insert(map);
	}
	
	/**
	 * 로그인 이력 수정
	 * @param vo - 수정할 정보가 담긴 EgovMap
	 * @return void형
	 * @exception Exception
	 */
	@Transactional
	@Override
	public void Logout(Map map) throws Exception {
		map.put("sqlId", "userLogin.Logout");
		 defaultDAO.update(map);
	}

	/**
	 * 로그인 이력 삭제
	 * @param vo - 삭제할 정보가 담긴 EgovMap
	 * @return void형
	 * @exception Exception
	 */
	@Transactional
	@Override
	public void deleteHistory(Map map) throws Exception {
		String type = (String) map.get("type");
		if(type.equals("one")){  // javascript 부터 / controller 에서 분기 하도록 변경
			map.put("sqlId", "userLogin.deleteOne");
		}else{
			map.put("sqlId", "userLogin.deleteAll");
		}
		defaultDAO.delete(map);
	}

	/**
	 * 글을 조회한다.
	 * @param vo - 조회할 정보가 담긴 SampleVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	@Transactional(readOnly=true)
	@Override
	public EgovMap selectOne(Map map) throws Exception {
		map.put("sqlId", "userLogin.selectOne");
		EgovMap result = defaultDAO.select(map);
		if (result == null)
			throw processException("info.nodata.msg");
		return result;
	}

	/**
	 * 글 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	@Transactional(readOnly=true)
	@Override
	public List<EgovMap> selectList(Map map) throws Exception {
		map.put("sqlId", "userLogin.selectList");
		return defaultDAO.selectList(map);
	}

	/**
	 * 글 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	@Transactional(readOnly=true)
	@Override
	public int selectListTotCnt(Map map) {
		map.put("sqlId", "userLogin.selectListTotCnt");
		return defaultDAO.selectListTotCnt(map);
	}

}
