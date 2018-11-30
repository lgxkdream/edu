package com.edu.ctrls.test;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.edu.service.test.TestStudentService;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.PageData;
import common.utils.UUIDTool;

@Controller
@RequestMapping(value="/testStudent")
public class TestStudentController extends BaseController{

	@Resource(name="testStudentService")
	private TestStudentService testStudentService ;
	
//	@RequestMapping(value="/showList")
//	public ModelAndView showList(){
//		System.out.println("/testStudentController/showList");
//		PageData pd=getPageData();
//		ModelAndView mv=new ModelAndView("edu/test/list");
//		try {
//			List list=testStudentService.showList(pd);
//			//相当于request.setAtrribut()
//			mv.addObject("varList", list);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return mv;
//	}
	@RequestMapping(value="/showList")
	public ModelAndView showList(Page page){
		System.out.println("/testStudentController/showList");
		PageData pd=getPageData();
		page.setPd(pd);
		ModelAndView mv=new ModelAndView("edu/test/list");
		try {
			List list=testStudentService.showList(page);
			//相当于request.setAtrribut()
			mv.addObject("varList", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
	
	
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd(){
		ModelAndView mv=new ModelAndView("edu/test/edit");
		mv.addObject("msg", "save");
		return mv;
	}
	@RequestMapping(value="/save")
	public ModelAndView save(){
		ModelAndView mv=new ModelAndView();
		PageData pd=getPageData();
		try {
			pd.put("ID", UUIDTool.getUUID());
			pd.put("SCHOOL", "1");
			pd.put("ENGLISH", "0");
			pd.put("SPECIALITY", "0");
			pd.put("YIXIANG", "0");
			pd.put("DELETED", "0");
			pd.put("STATUS", "10");
			testStudentService.save(pd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.setViewName("save_result");
		mv.addObject("msg","success");
		return mv;
	}
	@RequestMapping(value="goEdit")
	public ModelAndView goEdit(){
		ModelAndView mv=new ModelAndView("edu/test/edit");
		mv.addObject("msg", "edit");
		PageData pd=getPageData();
		try {
			PageData resultPd=testStudentService.findById(pd);
			mv.addObject("pd", resultPd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
	@RequestMapping(value="edit")
	public ModelAndView edit(){
		ModelAndView mv=new ModelAndView("save_result");
		PageData pd=getPageData();
		try {
			pd.put("SCHOOL", "1");
			pd.put("ENGLISH", "0");
			pd.put("SPECIALITY", "0");
			pd.put("YIXIANG", "0");
			pd.put("DELETED", "0");
			pd.put("STATUS", "10");
			testStudentService.edit(pd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
	@ResponseBody
	@RequestMapping(value="/delete")
	public Object delete(){
		PageData pd=getPageData();
		try {
			int i=testStudentService.delete(pd);
			System.out.println("删除"+i+"条记录");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Map map=new HashMap();
		map.put("user", 1);
		return JSONObject.fromObject(map);
	}
}
