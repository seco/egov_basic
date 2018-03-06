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
package egovframework.user.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @Class Name : LoginService.java
 * @Description : LoginService Class
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
public interface LoginService {

	/**
	 * 로그인 이력 생성
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	String Login(EgovMap map) throws Exception;

	/**
	 * 로그아웃 시간 업데이트
	 * @param vo - 수정할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	void Logout(EgovMap map) throws Exception;

	/**
	 * 접속 이력 삭제
	 * @param vo - 삭제할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	void deleteHistory(EgovMap map) throws Exception;

	/**
	 * 한 건 조회
	 * @param vo - 조회할 정보가 담긴 EgovMap
	 * @return 조회한 글
	 * @exception Exception
	 */
	EgovMap selectOne(EgovMap map) throws Exception;

	/**
	 * 목록 조회
	 * @param EgovMap - 조회할 정보가 담긴 map
	 * @return 글 목록
	 * @exception Exception
	 */
	List<EgovMap> selectList(EgovMap EgovMap) throws Exception;

	/**
	 * 글 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	int selectListTotCnt(EgovMap EgovMap);

}
