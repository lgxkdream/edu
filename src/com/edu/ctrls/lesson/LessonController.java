package com.edu.ctrls.lesson;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.edu.Dic;
import com.edu.service.lesson.LessonService;
import com.fh.controller.base.BaseController;
import com.fh.util.PageData;

/*
 * 课表管理controller
 */
@Controller()
@RequestMapping(value = "/lesson")
public class LessonController extends BaseController {
	@Resource(name = "lessonService")
	private LessonService lessonService;

	@RequestMapping(value = "/list")
	/*
	 * 查询一个校区一周的课表
	 */
	public ModelAndView list() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		List<PageData> result = null;
		try {
			if (pd.getString("START_DATE") == null) {
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				pd.put("START_DATE", format.format(new Date()));
			}
			if (pd.getString("CAMPUS_ID") == null) {
				pd.put("CAMPUS_ID", 20);
			}
			result = lessonService.list(pd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (result != null && result.size() != 0) {
			PageData p1 = result.get(0);
			String startDate = p1.getString("START_DATE");
			String endDate = p1.getString("END_DATE");
			String campus_name = p1.getString("CAMPUS_NAME");
			Integer campus_id = (Integer) p1.get("CAMPUS_ID");
			PageData pd1 = new PageData();
			pd1.put("START_DATE", startDate);
			pd1.put("END_DATE", endDate);
			pd1.put("CAMPUS_ID", campus_id);
			pd1.put("CAMPUS_NAME", campus_name);
			mv.addObject("pd", pd1);
			mv.addObject("varList", result);
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			try {
				Date d = format.parse(startDate);
				Calendar cal = Calendar.getInstance();
				cal.setTime(d);
				pd1.put("MON", format.format(cal.getTime()));
				cal.add(Calendar.DATE, 1);
				pd1.put("TUE", format.format(cal.getTime()));
				cal.add(Calendar.DATE, 1);
				pd1.put("WED", format.format(cal.getTime()));
				cal.add(Calendar.DATE, 1);
				pd1.put("THU", format.format(cal.getTime()));
				cal.add(Calendar.DATE, 1);
				pd1.put("FRI", format.format(cal.getTime()));
				cal.add(Calendar.DATE, 1);
				pd1.put("SAT", format.format(cal.getTime()));
				cal.add(Calendar.DATE, 1);
				pd1.put("SUN", format.format(cal.getTime()));
				mv.addObject("DIC_TIME", Dic.dic_lesson_time_list);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			PageData p1 = new PageData();
			p1.put("CAMPUS_ID", pd.get("CAMPUS_ID"));
			p1.put("START_DATE", pd.get("START_DATE"));
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date start_date = null;
			try {
				start_date = format.parse(pd.getString("START_DATE"));
				Calendar cal = Calendar.getInstance();
				cal.setTime(start_date);
				cal.add(Calendar.DAY_OF_YEAR, 6);
				p1.put("END_DATE", format.format(cal.getTime()));
				mv.addObject("pd", p1);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		mv.addObject("DIC_CAMPUS", Dic.dic_campus_list);
		mv.setViewName("/edu/lesson/lesson_list");
		return mv;
	}

	/*
	 * 添加课表,在数据库插入一张空课表,跳转到编辑页面
	 */
	@RequestMapping(value = "/add")
	public ModelAndView add() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		if (list().isEmpty()) {

		}
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date start_date = format.parse(pd.getString("START_DATE"));
			Calendar cal = Calendar.getInstance();
			cal.setTime(start_date);
			cal.add(Calendar.DAY_OF_YEAR, 6);
			pd.put("END_DATE", format.format(cal.getTime()));
			lessonService.unitLesson(pd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv = list();
		mv.addObject("DIC_CLASS", Dic.dic_class_list);
		mv.setViewName("/edu/lesson/lesson_edit");
		return mv;
	}

	/*
	 * 跳转到edit页面
	 */
	@RequestMapping(value = "/goEdit")
	public ModelAndView goEdit() {
		ModelAndView mv = this.getModelAndView();
		mv = list();
		mv.addObject("DIC_CLASS", Dic.dic_class_list);
		mv.setViewName("/edu/lesson/lesson_edit");
		return mv;
	}

	/*
	 * edit
	 */
	@RequestMapping(value = "/edit")
	public ModelAndView edit() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String[] id = pd.getString("ID").split(",");
		String[] mon_class = pd.getString("MON_CLASS").split(",");
		String[] tue_class = pd.getString("TUE_CLASS").split(",");
		String[] wed_class = pd.getString("WED_CLASS").split(",");
		String[] thu_class = pd.getString("THU_CLASS").split(",");
		String[] fri_class = pd.getString("FRI_CLASS").split(",");
		String[] sat_class = pd.getString("SAT_CLASS").split(",");
		String[] sun_class = pd.getString("SUN_CLASS").split(",");
		List<PageData> updateList = new ArrayList<PageData>();
		for (int i = 0; i < id.length; i++) {
			PageData updateInfo = new PageData();
			updateInfo.put("ID", id[i]);
			updateInfo.put("MON_CLASS_ID", mon_class[i].equals("null") ? null
					: mon_class[i].split("@")[0]);
			updateInfo.put("MON_CLASS_NAME", mon_class[i].equals("null") ? null
					: mon_class[i].split("@")[1]);
			updateInfo.put("TUE_CLASS_ID", tue_class[i].equals("null") ? null
					: tue_class[i].split("@")[0]);
			updateInfo.put("TUE_CLASS_NAME", tue_class[i].equals("null") ? null
					: tue_class[i].split("@")[1]);
			updateInfo.put("WED_CLASS_ID", wed_class[i].equals("null") ? null
					: wed_class[i].split("@")[0]);
			updateInfo.put("WED_CLASS_NAME", wed_class[i].equals("null") ? null
					: wed_class[i].split("@")[1]);
			updateInfo.put("THU_CLASS_ID", thu_class[i].equals("null") ? null
					: thu_class[i].split("@")[0]);
			updateInfo.put("THU_CLASS_NAME", thu_class[i].equals("null") ? null
					: thu_class[i].split("@")[1]);
			updateInfo.put("FRI_CLASS_ID", fri_class[i].equals("null") ? null
					: fri_class[i].split("@")[0]);
			updateInfo.put("FRI_CLASS_NAME", fri_class[i].equals("null") ? null
					: fri_class[i].split("@")[1]);
			updateInfo.put("SAT_CLASS_ID", sat_class[i].equals("null") ? null
					: sat_class[i].split("@")[0]);
			updateInfo.put("SAT_CLASS_NAME", sat_class[i].equals("null") ? null
					: sat_class[i].split("@")[1]);
			updateInfo.put("SUN_CLASS_ID", sun_class[i].equals("null") ? null
					: sun_class[i].split("@")[0]);
			updateInfo.put("SUN_CLASS_NAME", sun_class[i].equals("null") ? null
					: sun_class[i].split("@")[1]);
			updateList.add(updateInfo);
		}
		try {
			lessonService.edit(updateList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv = list();
		mv.addObject("DIC_CLASS", Dic.dic_class_list);
		mv.setViewName("/edu/lesson/lesson_edit");
		return mv;
	}
}
