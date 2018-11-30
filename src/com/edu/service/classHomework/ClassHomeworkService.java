package com.edu.service.classHomework;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;

import com.edu.service.email.EmailService;
import com.edu.service.email.EmailTools;
import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.PageData;
import com.fh.util.UuidUtil;

@Service("classHomeworkService")
public class ClassHomeworkService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Resource(name="emailService")
	private EmailService emailService;
//
//	/*
//	 * 新增
//	 */
//	public void save(PageData pd) throws Exception {
//		dao.save("HomeworkMapper.save", pd);
//	}
//
//	/*
//	 * 删除
//	 */
//	public void delete(PageData pd) throws Exception {
//		dao.delete("HomeworkMapper.delete", pd);
//	}
//
//	/*
//	 * 修改
//	 */
//	public void edit(PageData pd) throws Exception {
//		dao.update("HomeworkMapper.edit", pd);
//	}

	/*
	 * 列表
	 */
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>) dao.findForList("HomeworkMapper.datalistPage",
				page);
	}

	/*
	 * 列表作业详细
	 */
	public List<PageData> HomeworkDetailed(PageData pd) throws Exception {
		List<PageData> list = (List<PageData>) dao.findForList(
				"ClassHomeworkMapper.class_ids", pd);
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

	/*
	 * 查看作业列表
	 */
	public Map<String, Object> listHomework(Page page) throws Exception {
		Map map = new HashMap();

		List classList = (List<PageData>) dao.findForList(
				"ClassHomeworkMapper.classHomeworklistPage", page);
		for (Object obj : classList) {
			PageData tempPd = (PageData) obj;
			String class_homework_Id = tempPd.getString("ID");
			PageData paraPd = new PageData();
			paraPd.put("CH_ID", class_homework_Id);
			// paraPd.put("CLASS_ID", class_id);
			Object count = ((List) dao.findForList(
					"StudentHomeworkMapper.show_homework", paraPd)).get(0);
			tempPd.put("COUNT", ((PageData) count).get("COUNT(*)"));

			List<PageData> nameList = ((List<PageData>) dao.findForList(
					"StudentHomeworkMapper.show_studnetname", paraPd));
			tempPd.put("NAMELIST", nameList);
		}

		map.put("classList", classList);
		return map;

	}

	/*
	 * 列表(全部)
	 */
	public List<PageData> listAll(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("ClassHomeworkMapper.listAll", pd);
	}

	/*
	 * 通过id获取数据
	 */
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("ClassHomeworkMapper.findById", pd);
	}

	/*
	 * 批量删除
	 */
	public void deleteAll(String[] ArrayDATA_IDS) throws Exception {
		dao.delete("ClassHomeworkMapper.deleteAll", ArrayDATA_IDS);
	}

	/*
	 * 批量删除homework
	 */
	public void deleteAlls(String[] ArrayDATA_IDS) throws Exception {
		if(ArrayDATA_IDS!=null){
			for(String id:ArrayDATA_IDS){
				int row=(Integer) dao.delete("StudentHomeworkMapper.deleteByChid", id);
				System.out.println("row==========="+row);
			}
		}
		dao.delete("ClassHomeworkMapper.deleteAlls", ArrayDATA_IDS);
	}

	/*
	 * 查班级人数
	 */
	public PageData queryStudentCountByClass(PageData pd) throws Exception {
		return (PageData) dao.findForObject("ClassHomeworkMapper.queryStudentCountByClass", pd);
	}

	
	/*
	* 新增
	*/
	public void saveHomeworkToStudent(PageData pd)throws Exception{
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		
		dao.save("ClassHomeworkMapper.saveHomeworkToClass",pd);
		String classHomeworkId=pd.getString("ID");
		
		
		PageData paraPd=new PageData();
		paraPd.put("JR_CLASS", pd.get("CLASS_ID"));
		List<PageData> stuList=(List<PageData>)dao.findForList("StudentMapper.listAll", paraPd);
		
		String JR_CLASS_NAME=pd.getString("CLASS_NAME");
		String JR_CLASS=pd.getString("CLASS_ID");
		String HOMEWORKS=pd.getString("HOMEWORKS");
		pd.put("CLASS_ID", JR_CLASS);
		pd.put("CLASS_NAME", JR_CLASS_NAME);
		pd.put("HOMEWORKS",HOMEWORKS);
		pd.put("END_TIME", pd.getString("END_TIME"));
		
		for(int i=0;i<stuList.size();i++){
			String STUDENT_ID=stuList.get(i).getString("ID");
			String STUDENT_NAME=stuList.get(i).getString("NAME");
			PageData tempPd=new PageData();
			tempPd.put("ID", UuidUtil.get32UUID());
			tempPd.put("CH_ID",classHomeworkId);
			tempPd.put("STUDENT_ID", STUDENT_ID);
			tempPd.put("STUDENT_NAME", STUDENT_NAME);
			tempPd.put("TITLE", pd.getString("TITLE"));
			tempPd.put("END_TIME", pd.getString("END_TIME"));
			tempPd.put("HOMEWORKS",HOMEWORKS);
			tempPd.put("HOMEWORKS2",pd.getString("HOMEWORKS2"));
			tempPd.put("CREATOR", user.getUSER_ID());
			tempPd.put("CREATOR_NAME", user.getUSERNAME());
			tempPd.put("CREATE_TIME", DateUtil.getTime());
			tempPd.put("STATUS", 0);
			tempPd.put("CLASS_ID", JR_CLASS);
			tempPd.put("CLASS_NAME", JR_CLASS_NAME);
			
			tempPd.put("HOMEWORK_CREATE_TIME", DateUtil.getTime());
			dao.save("StudentHomeworkMapper.saveHomeworkToStudent", tempPd);
		}
		
		PageData paraEmailPd=new PageData();
		paraEmailPd.put("ID", pd.getString("emailTempId"));
		PageData emailPd=emailService.findById(paraEmailPd);
		String emailcontent=emailPd.getString("EMAILCONTENT");
		List emailList=new ArrayList();
		List nameList=new ArrayList();
		for(int i=0;i<stuList.size();i++){
			PageData stdPd=stuList.get(i);
			emailList.add(stdPd.getString("EMAIL"));
			nameList.add(stdPd.getString("NAME"));
		}
		String[] emailArray=new String[emailList.size()];
		emailList.toArray(emailArray);
		String[] nameArray=new String[nameList.size()];
		nameList.toArray(nameArray);
		Map map=new HashMap();
		PageData resultpd=EmailTools.sendEmail(emailArray,nameArray , (String)pd.get("TITLE"), emailcontent, "1", "yes", map);
		
	}
	
	/*
	*查询列表模板
	*/
	public List<PageData> templetList(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("HomeworkTempletMapper.findById", pd);
	}
	/*
	*查询题目
	*/
	public List<PageData> findByHomeworkIds(String[] homework_ids)throws Exception{
		return (List<PageData>)dao.findForList("HomeworkMapper.selectByIds", homework_ids);
	}
}
