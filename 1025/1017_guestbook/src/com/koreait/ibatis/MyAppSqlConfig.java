package com.koreait.ibatis;

import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class MyAppSqlConfig {
	private static final SqlMapClient sqlMap;
	static {	// 초기화 블록
// 		final로 선언된 변수는 상수로 사용되므로 선언과 동시에 반드시 초기화되어야 한다.
// 		final로 선언된 변수를 초기화시키기 위해 두 줄 이상이 필요하다면 static { ~ } 내부에 적어준다.
		try {
//			데이터베이스 연결 정보와 실행할 sql 명령이 저장된 xml 파일의 경로가 지정된 xml 파일의 경로를 지정한다.
			String resource = "com/koreait/ibatis/SqlMapConfig.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMap = SqlMapClientBuilder.buildSqlMapClient(reader);
		} catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException ("Error : " + e);
		}
	}
	public static SqlMapClient getSqlMapInstance() {
		return sqlMap;
	}
}
