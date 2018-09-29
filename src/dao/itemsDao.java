package dao;

import java.util.List;
import java.util.Map;





public interface itemsDao {
	
	 public int del(Integer[] ids);
	 public List<Map<String, Object>> query(Integer id,String item_no);

}
