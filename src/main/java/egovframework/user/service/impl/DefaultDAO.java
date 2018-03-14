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

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

import org.springframework.stereotype.Repository;

/**
 * @Class Name : DefaultDAO.java
 * @Description : DefaultDAO Class
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

@Repository("defaultDAO")
public class DefaultDAO extends EgovAbstractDAO {

	private String getSqlId(Map map) {
		return (String)map.get("sqlId");
	}
	
	/**
	 * 생성
	 * @param vo - 등록할 정보가 담긴 EgovMap
	 * @return 등록 결과
	 * @exception Exception
	 */
	public String insert(Map map) throws Exception {
		return (String) insert(getSqlId(map), map);
	}

	/**
	 * 수정
	 * @param vo - 수정할 정보가 담긴 EgovMap
	 * @return void형
	 * @exception Exception
	 */
	public void update(Map map) throws Exception {
		update(getSqlId(map), map);
	}

	/**
	 * 삭제
	 * @param vo - 삭제할 정보가 담긴 EgovMap
	 * @return void형
	 * @exception Exception
	 */
	public void delete(Map map) throws Exception {
		delete(getSqlId(map), map);
	}

	/**
	 * 조회
	 * @param vo - 조회할 정보가 EgovMap
	 * @return 조회한 글
	 * @exception Exception
	 */
	public EgovMap select(Map map) throws Exception {
		return (EgovMap) select(getSqlId(map), map);
	}

	/**
	 * 글 목록 조회
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<EgovMap> selectList(Map map) throws Exception {
		return (List<EgovMap>)list(getSqlId(map), map);
	}

	/**
	 * 개수 조회
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return 글 총 갯수
	 * @exception
	 */
	public int selectListTotCnt(Map map) {
		return (Integer) select(getSqlId(map), map);
	}

}
