package com.edu.service.sysconfig;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;


@Service("sysConfigService")
public class SysConfigService {

	public static String TOTAL_AMOUNT="total_amount";
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		dao.save("sys_config.insert", pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("sys_config.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("sys_config.update", pd);
	}
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("sys_config.select_info", page);
	}
	public PageData findByName(String name)throws Exception{
		PageData pd=new PageData();
		pd.put("NAME", name);
		return (PageData)dao.findForObject("sys_config.select_info", pd);
	}
	
}

