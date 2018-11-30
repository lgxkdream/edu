package com.edu.service.homework;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;

@Service("studentHomeworkService")
public class StudentHomeworkService {
	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/*
	 * 新增
	 */
	public void save(PageData pd) throws Exception {
		dao.save("StudentHomeworkMapper.save", pd);
	}

	/*
	 * 删除
	 */
	public void delete(PageData pd) throws Exception {
		dao.save("StudentHomeworkMapper.delete", pd);
	}

	/*
	 * 修改
	 */
	public void edit(PageData pd) throws Exception {
		dao.save("StudentHomeworkMapper.edit", pd);
	}

	/*
	 * 列表
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>) dao.findForList(
				"StudentHomeworkMapper.datalistPage", page);
	}

	/*
	 * 列表(全部)
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList(
				"StudentHomeworkMapper.listAll", pd);
	}
	public List<PageData> showStudentHomeworkByCHID(PageData pd) throws Exception {
		pd.put("STATUS", "1");
		List list= (List<PageData>) dao.findForList(
				"StudentHomeworkMapper.showStudentHomework", pd);
		pd.remove("STATUS");
		pd.put("UNEQUAL_STATUS", "1");
		List list2= (List<PageData>) dao.findForList(
				"StudentHomeworkMapper.showStudentHomework", pd);
		list.addAll(list2);
		return list;
	}

	/*
	 * 通过id获取数据
	 */
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("StudentHomeworkMapper.findById",
				pd);
	}

	/*
	 * 批量删除
	 */
	public void deleteAll(String[] ArrayDATA_IDS) throws Exception {
		dao.delete("StudentHomeworkMapper.deleteAll", ArrayDATA_IDS);
	}

	/**
	 * 删除题目附件
	 */
	public void deleteAnswer(PageData pd) throws Exception {
		dao.update("StudentHomeworkMapper.deleteAnswer", pd);
	}
	/*
	 * 列表作业详细
	 */
	public List<PageData> homeworkDetailed(PageData pd) throws Exception {
		List<PageData> list = (List<PageData>) dao.findForList(
				"StudentHomeworkMapper.findById", pd);
		List<PageData> relist=null;
		if(list!=null && !list.isEmpty()){
			String homeworks = (String) list.get(0).get("HOMEWORKS");
			if(homeworks!=null && !"".equals(homeworks)){
				String Array_ID[] = homeworks.split(",");
				relist=(List<PageData>) dao.findForList(
						"ClassHomeworkMapper.HomeworkDetailed", Array_ID);
			}
		}

		return relist;

	}
}
