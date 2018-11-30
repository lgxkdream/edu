package com.edu.service.test;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;

@Service("testStudentService")
public class TestStudentService {

	@Resource(name="daoSupport")
	private DaoSupport dao;
	
//	public List showList(PageData pd) throws Exception{
//		System.out.println("TestStudentService.showList");
//		//查询数据库
//		List list=(List)dao.findForList("TestStudentMapper.select", pd);
//		return list;
//	}
	public List showList(Page page) throws Exception{
		System.out.println("TestStudentService.showList");
		//查询数据库
		List list=(List)dao.findForList("TestStudentMapper.datalistPage", page);
		return list;
	}
	
	public void save(PageData pd) throws Exception{
		int i=(Integer)dao.save("TestStudentMapper.save", pd);
		System.out.println("插入"+i+"条记录！");
	}
	public PageData findById(PageData pd) throws Exception{
		return (PageData)dao.findForObject("TestStudentMapper.select", pd);
	}
	
	public void edit(PageData pd) throws Exception{
		
		int i=(Integer)dao.update("TestStudentMapper.edit", pd);
		System.out.println("更新"+i+"条记录");
	}
	public int delete(PageData pd) throws Exception{
		return (Integer)dao.delete("TestStudentMapper.deleteById", pd);
	}
}
