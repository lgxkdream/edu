package com.edu.service.staffSrvImpl;


import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.service.system.user.UserService;
import com.fh.util.PageData;
import common.been.RegResult;


@Service("staffService")
public class StaffService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	@Resource(name="userService")
	private UserService userService;
	
	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		dao.save("StaffMapper.save", pd);
		
		reg(pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("StaffMapper.delete", pd);
		
		dao.delete("UserMapper.deleteById", pd.getString("ID"));
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("StaffMapper.edit", pd);
	}
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("StaffMapper.datalistPage", page);
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("StaffMapper.listAll", pd);
	}
	
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("StaffMapper.findById", pd);
	}
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("StaffMapper.deleteAll", ArrayDATA_IDS);
	}
	
	public RegResult reg(PageData pd) throws Exception{
//		String std_num=(String)pd.get("STD_NUM");
		String password="123456";
		String role_id=null;
		String job=pd.getString("JOB");
		int jobInt=Integer.parseInt(job);
		if(jobInt==10){//市场角色
			role_id="93727d9e08b74bd18a267f3f918f583b";
		}else if(jobInt==20){//教师
			role_id="c1b07d3650eb4b37b5c650083ed00b01";
		}else if(jobInt==30){//教务主任
			role_id="d7ddbd9e30da49ac85f5e32f3c5384dd";
		}else if(jobInt==40){//班主任
			role_id="769b12caf5db44659c89ec5624b3a252";
		}
		String username=pd.getString("USERNAME");
		PageData paraPd=new PageData();
		paraPd.put("USER_ID", pd.get("ID"));	//ID
		paraPd.put("USERNAME",username );	//登录名
		paraPd.put("NAME", pd.get("NAME"));			//用户名
		paraPd.put("RIGHTS", "");					//权限
		paraPd.put("ROLE_ID", role_id);				//角色
		paraPd.put("LAST_LOGIN", "");				//最后登录时间
		paraPd.put("IP", "");						//IP
		paraPd.put("STATUS", "0");					//状态
		paraPd.put("SKIN", "default");				//默认皮肤
		paraPd.put("EMAIL", pd.get("EMAIL"));		//email
		paraPd.put("PHONE", pd.get("PHONE"));		//phone
		paraPd.put("NUMBER","" );		//phone
		
		paraPd.put("PASSWORD", new SimpleHash("SHA-1", username, password).toString());
		
		RegResult rr=new RegResult();
		rr.userPd=paraPd;
		if(null == userService.findByUId(paraPd)){
			userService.saveU(paraPd);
			rr.result=true;
		}else{
			rr.result=false;
		}
		return rr;
	}
	
}

