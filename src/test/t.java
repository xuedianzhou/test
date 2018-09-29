package test;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import dao.itemsDao;



public class t {

	 SqlSession sqlSession;
	 itemsDao item;
	@Before
public void getSession() throws IOException{
	   Reader read=Resources.getResourceAsReader("mybatis.cfg.xml");
	   SqlSessionFactory build=new SqlSessionFactoryBuilder().build(read);
	   sqlSession=build.openSession();
	   item=sqlSession.getMapper(itemsDao.class);
}
	@After
	public void clase(){
		sqlSession.commit();
		sqlSession.close();
	}
	
	
	@Test
	public void m1(){
		List<Map<String,Object>> list=item.query(4,"A-4");
		for(Map<String,Object> m:list){
			System.out.println(m.get("item_no"));
		}
	}
	
	
	@Test
	public void m2(){
		Integer[] id = { 8, 9 };
		int rs = item.del(id);
		System.out.println("rs:" + rs);
	}
}
