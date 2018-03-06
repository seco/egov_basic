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

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

import org.springframework.stereotype.Repository;

/**
 * @Class Name : LoginDAO.java
 * @Description : LoginDAO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.03.06           최초생성
 *
 * @author 김재문
 * @since 2018. 03.06
 * @version 1.0
 * @see
 *
 */

@Repository("LoginDAO")
public class LoginDAO extends EgovAbstractDAO {

	/**
	 * 로그인 이력 생성
	 * @param vo - 등록할 정보가 담긴 EgovMap
	 * @return 등록 결과
	 * @exception Exception
	 */
	public String Login(EgovMap map) throws Exception {
		return (String) insert("userLogin.Login", map);
	}

	/**
	 * 로그아웃 이력 업데이트
	 * @param vo - 수정할 정보가 담긴 EgovMap
	 * @return void형
	 * @exception Exception
	 */
	public void Logout(EgovMap map) throws Exception {
		update("userLogin.Logout", map);
	}

	/**
	 * 이력 1건 삭제
	 * @param vo - 삭제할 정보가 담긴 EgovMap
	 * @return void형
	 * @exception Exception
	 */
	public void deleteSample(EgovMap map) throws Exception {
		delete("userLogin.deleteOne", map);
	}

	/**
	 * 글을 조회한다.
	 * @param vo - 조회할 정보가 담긴 SampleVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	public EgovMap selectSample(EgovMap map) throws Exception {
		return (EgovMap) select("loginDAO.selectSample", map);
	}

	/**
	 * 글 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<?> selectSampleList(EgovMap map) throws Exception {
		return list("loginDAO.selectSampleList", map);
	}

	/**
	 * 글 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return 글 총 갯수
	 * @exception
	 */
	public int selectSampleListTotCnt(EgovMap map) {
		return (Integer) select("loginDAO.selectSampleListTotCnt", map);
	}

}
