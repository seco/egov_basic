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
 * @Class Name : defaultService.java
 * @Description : defaultService Class
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
public interface DefaultService {

	/**
	 * 등록
	 * @param vo - EgovMap
	 * @return 등록 결과
	 * @exception Exception
	 */
	String insert(EgovMap map) throws Exception;

	/**
	 * 수정
	 * @param vo - EgovMap
	 * @return void형
	 * @exception Exception
	 */
	void update(EgovMap map) throws Exception;

	/**
	 * 삭제
	 * @param vo - EgovMap
	 * @return void형
	 * @exception Exception
	 */
	void delete(EgovMap map) throws Exception;

	/**
	 * 한건 조회
	 * @param vo - EgovMap
	 * @return 조회한 글
	 * @exception Exception
	 */
	EgovMap select(EgovMap map) throws Exception;

	/**
	 * 목록조회
	 * @param EgovMap
	 * @return 글 목록
	 * @exception Exception
	 */
	List<EgovMap> selectList(EgovMap map) throws Exception;

	/**
	 * 총 갯수 조회
	 * @param EgovMap
	 * @return 글 총 갯수
	 * @exception
	 */
	int selectListTotCnt(EgovMap map);

}
