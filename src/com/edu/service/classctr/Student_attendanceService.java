package com.edu.service.classctr;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;


@Service("student_attendanceService")
public class Student_attendanceService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		dao.save("Student_attendanceMapper.save", pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("Student_attendanceMapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("Student_attendanceMapper.edit", pd);
	}
	/*
	 * 修改状态
	 */
	public void editType(PageData pd)throws Exception{
		dao.update("Student_attendanceMapper.editType", pd);
	}
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("Student_attendanceMapper.datalistPage", page);
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("Student_attendanceMapper.listAll", pd);
	}
	
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("Student_attendanceMapper.findById", pd);
	}
	/*
	 * 通过id获取数据,NAME从学生表查询
	 */
	public PageData findById1(PageData pd)throws Exception{
		return (PageData)dao.findForObject("Student_attendanceMapper.findById1", pd);
	}
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("Student_attendanceMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

