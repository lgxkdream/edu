package com.edu.ctrls.classctr;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.edu.service.classctr.Student_attendanceService;
import com.fh.controller.base.BaseController;
import com.fh.util.PageData;

@Controller
@RequestMapping(value="/showClassAttendance")
public class ShowClassAttendanceController extends BaseController {
	@Resource(name="student_attendanceService")
	private Student_attendanceService student_attendanceService;
	@RequestMapping(value="/showDetail")
	public ModelAndView showDetail(){
		PageData pd = this.getPageData();
		List<PageData> studentList =null;
		try {
			studentList = student_attendanceService.listAll(pd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView mv =this.getModelAndView();
		mv.setViewName("edu/classctr/showDetail");
		mv.addObject("varList",studentList);
		return mv;
	}
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(){
		ModelAndView mv = this.getModelAndView();
		PageData pageDate = getPageData();
		PageData stuPd = new PageData();
		stuPd.put("ID", pageDate.get("STUDENT_ATTENDANCE_ID"));
		try {
			PageData pd = student_attendanceService.findById1(stuPd);
			mv.addObject("pd", pd);
			mv.addObject("msg", "edit");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.setViewName("edu/student_attendance/student_attendance_edit");
		return mv;
	}
	@RequestMapping(value="/edit")
	public ModelAndView edit(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = getPageData();
		pd.put("ID", pd.get("STUDENT_ATTENDANCE_ID"));
		try {
			student_attendanceService.editType(pd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.setViewName("save_result");
		return mv;
	}
	
}
