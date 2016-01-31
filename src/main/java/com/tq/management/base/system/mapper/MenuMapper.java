package com.tq.management.base.system.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.tq.management.base.system.entity.Menu;

public interface MenuMapper {
	
	public void insert(Menu menu);
    
    public void update(Menu menu);

    public void delete(Menu menu);
    
    public void batchDelete(Map<String, Object> map);

	public Menu get(int id);

	public int count(Map<String, Object> map);
     
    public List<Menu> getPages(Map<String, Object> map);  
    
    public List<Menu> getAll();
    
    public List<Menu> getOneLevel();
    
    public List<Menu> getTwoLevel(Integer parentId);

	public void updateSort(@Param(value="id") Integer id, @Param(value="orderId") int i);
}
