package com.edu.ctrls.classctr;


import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.edu.service.classctr.ClassAttendanceService;
import com.edu.service.classctr.Student_attendanceService;
import com.edu.service.student.StudentService;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.Const;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;

/** 
 * 类名称：ClassAttendanceController
 * 创建人：FH 
 * 创建时间：2015-09-25
 */
@Controller
@RequestMapping(value="/classattendance")
public class ClassAttendanceController extends BaseController {
	
	@Resource(name="classattendanceService")
	private ClassAttendanceService classattendanceService;
	@Resource(name="studentService")
	private StudentService studentService;
	@Resource(name="student_attendanceService")
	private Student_attendanceService student_attendanceService;
	
	/**
	 * 新增列表
	 */
	@RequestMapping(value="/saveList")
	public void saveList(PrintWriter out){
		logBefore(logger, "新增ClassAttendance");
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData pdData = this.getPageData();
		pdData.put("CLASS_ID", pd.getString("ID"));
		int leave = 0;
		int absent = 0;
		int total = 0;
		int class_number = 0;
		String data = pd.getString("data");
		String[] dataArr = data.split(",");
		total = dataArr.length;
		try {
			PageData page = classattendanceService.getClassId(pdData);
			class_number = new Integer(page.get("NUM") + "") + 1;
			for(String s : dataArr){
				String[] sArr = s.split("=");
				if("a".equals(sArr[1])){
					absent++;
				}else if("l".equals(sArr[1])){
					leave++;
				}
				PageData pdStudent = new PageData();
				pdStudent.put("CLASS_ID", pd.getString("ID"));
				pdStudent.put("CLASS_NO", class_number);
				pdStudent.put("TYPE", sArr[1]);
				pdStudent.put("STUDENT_ID", sArr[0]);
				if(sArr.length == 2){
					pdStudent.put("INPUT_TIME", "");
				}else{
					pdStudent.put("INPUT_TIME", sArr[2]);
				}
				pdStudent.put("ID", this.get32UUID());	//主键
				student_attendanceService.save(pdStudent);
				
			}
			pd.put("CLASS_ID", pd.getString("ID"));
			pd.put("ID", this.get32UUID());	//主键
			pd.put("LEAVE_NUMBER", leave);
			pd.put("ABSENT_NUMBER", absent);
			pd.put("TOTAL_NUMBER", total);
			pd.put("CLASS_NUMBER", class_number);
			classattendanceService.save(pd);
			out.write("1");
		} catch (Exception e) {
			e.printStackTrace();
			out.write("0");
		}
	}
	
	/**
	 * session超时问题
	 */
	@RequestMapping(value="/sessionCon")
	public void sessionCon(){
		System.out.println("防止session失效！");
	}
	
	/**
	 * 查询考勤详情
	 */
//	@RequestMapping(value="/selectDetail")
//	public ModelAndView selectDetail(){
//		logBefore(logger, "查询考勤详情");
//		PageData pd = new PageData();
//		pd = this.getPageData();
//		String class_id = pd.getString("id");
//		String class_no = pd.getString("classNo");
//		PageData pdStu = new PageData();
//		pdStu.put("CLASS_ID", class_id);
//		pdStu.put("CLASS_NO", class_no);
//		List<PageData> resultList = new ArrayList<PageData>();
//		try {
//			List<PageData> studentList = student_attendanceService.listAll(pdStu);
//			if(studentList != null && studentList.size() > 0){
//				for(PageData p : studentList){
//					PageData r = new PageData();
//					r.put("NAME", p.get("NAME"));
//					r.put("CARD_NO", p.get("STUDENT_ID"));
//					r.put("ID", p.get("ID"));
//					r.put("TYPE", p.get("TYPE"));
//					resultList.add(r);
//				}
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		JSONArray result = JSONArray.fromObject(resultList);
//		pd.put("varList", result.toString());
//		ModelAndView mv = this.getModelAndView();
//		mv.addObject("msg","success");
//		mv.addObject("pd", pd);
//		mv.setViewName("edu/classctr/classctrattendance_view");
//		return mv;
//	}
	
	/**
	 * 进入考勤录入页面
	 * @return
	 */
	@RequestMapping(value="/attendanceAdd")
	public ModelAndView attendance(){
		logBefore(logger, "进入考勤录入页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String clasz=pd.getString("JR_CLASS");
		String[] claszArray=clasz.split("_");
		String classId=claszArray[0];
		PageData pagepd = new PageData();
		pagepd = this.getPageData();
		pagepd.put("JR_CLASS", classId);
		
		try {
			List<PageData> varList = studentService.listAll(pagepd);
			List<PageData> resultList = new ArrayList<PageData>();
			if(varList != null && varList.size() > 0){
				for(PageData p : varList){
					String nameValue = p.getString("NAME");
					String cardNoValue = p.getString("CARD_NO");
					String idValue = p.getString("ID");
					PageData r = new PageData();
					r.put("NAME", nameValue);
					r.put("CARD_NO", cardNoValue);
					r.put("ID", idValue);
					resultList.add(r);
				}
			}
			JSONArray result = JSONArray.fromObject(resultList);
			mv.setViewName("edu/classctr/classctrattendance_edit");
			mv.addObject("msg", "save");
			pd.put("varList", result.toString());
			pd.put("ID", classId);
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, "列表ClassAttendance");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = classattendanceService.list(page);	//列出ClassAttendance列表
			if(varList != null && varList.size() > 0){
				for(PageData p : varList){
					double p_leave_number = new Double(p.get("LEAVE_NUMBER") + "");
					double p_absent_number = new Double(p.get("ABSENT_NUMBER") + "");
					double p_total_number = new Double(p.get("TOTAL_NUMBER") + "");
					double attendance = (p_total_number - p_absent_number - p_leave_number) / p_total_number;
					NumberFormat fmt = NumberFormat.getPercentInstance();
			        fmt.setMaximumFractionDigits(2);//最多两位百分小数，如25.23%
			        p.put("ATTENDANCE", fmt.format(attendance));
				}
			}
			mv.setViewName("edu/classctr/classattendance_list");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX,this.getHC());	//按钮权限
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	 /**
	 * 考勤
	 */
	@RequestMapping(value="/attendance")
	public ModelAndView attendance(Page page){
		logBefore(logger, "去修改ClassCtr考勤页面");
		ModelAndView mv = this.getModelAndView();
		Object value = this.getPageData().get("ID");
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.clear();
		pd.put("JR_CLASS", value);
		try {
			List<PageData> varOList = studentService.listClassStudent(pd);	//根据ID读取
			pd.put("student_list", varOList);
			mv.setViewName("edu/classctr/classattendance_list");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**
	 * 进入考勤录入页面
	 * @return
	 */
	@RequestMapping(value="/addAttendance")
	public ModelAndView attendanceAdd(){
		logBefore(logger, "去新增ClassCtr页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		List<PageData> pageDataList = new ArrayList<PageData>();
		int leave_number = 0;
		int absent_number = 0;
		int total_number = 0;
		int class_number = new Integer(pd.get("CLASS_NUMBER") + "") + 1;
		try {
			if(pageDataList != null && pageDataList.size() > 0){
				total_number = pageDataList.size();
				for(PageData p : pageDataList){
					PageData studentAttendance = new PageData();
					if("".equals(p.get("TYPE"))){
						leave_number++;
					}else{
						absent_number++;
					}
					studentAttendance.put("CLASS_ID", pd.get(""));
					studentAttendance.put("CLASS_NO", class_number);
					studentAttendance.put("TYPE", p.get("TYPE"));
					studentAttendance.put("STUDENT_ID", p.get("STUDENT_ID"));
					studentAttendance.put("ID", this.get32UUID());
					student_attendanceService.save(studentAttendance);
				}
				pd.put("LEAVE_NUMBER", leave_number);
				pd.put("ABSENT_NUMBER", absent_number);
				pd.put("TOTAL_NUMBER", total_number);
				pd.put("ID", this.get32UUID());
				pd.put("CLASS_NUMBER", class_number);
				classattendanceService.save(pd);
			}
			mv.addObject("msg","success");
			mv.setViewName("save_result");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/*
	 * 导出到excel
	 * @return
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel(){
		logBefore(logger, "导出ClassAttendance到excel");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("班级主键");	//1
			titles.add("请假人数");	//2
			titles.add("缺席人数");	//3
			titles.add("总人数");	//4
			titles.add("课程节数");	//5
			dataMap.put("titles", titles);
			List<PageData> varOList = classattendanceService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("CLASS_ID"));	//1
				vpd.put("var2", varOList.get(i).get("LEAVE_NUMBER").toString());	//2
				vpd.put("var3", varOList.get(i).get("ABSENT_NUMBER").toString());	//3
				vpd.put("var4", varOList.get(i).get("TOTAL_NUMBER").toString());	//4
				vpd.put("var5", varOList.get(i).get("CLASS_NUMBER").toString());	//5
				varList.add(vpd);
			}
			dataMap.put("varList", varList);
			ObjectExcelView erv = new ObjectExcelView();
			mv = new ModelAndView(erv,dataMap);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/* ===============================权限================================== */
	@SuppressWarnings("unchecked")
	public Map<String, String> getHC(){
		Subject currentUser = SecurityUtils.getSubject();  //shiro管理的session
		Session session = currentUser.getSession();
		return (Map<String, String>)session.getAttribute(Const.SESSION_QX);
	}
	/* ===============================权限================================== */
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
