package com.tq.management.base.system.mapper;

import java.util.List;
import java.util.Map;

import com.tq.management.base.system.entity.User;

public interface UserMapper {
	
	public void insert(User user);
    
    public void update(User user);

    public void delete(User user);
    
    public void batchDelete(Map<String, Object> map);

	public User get(int id);

	public int count(Map<String, Object> map);
     
    public List<User> getPages(Map<String, Object> map);  
}
