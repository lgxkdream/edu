package com.edu.ctrls.homework;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.edu.Dic;
import com.edu.service.homework.StudentHomeworkService;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.FileUpload;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.PathUtil;

import common.utils.DateTool;
import common.utils.PathTools;

/*
 * 类名称:HomeworkController
 * 创建人:ZXP
 * 创建时间:2015-08-15
 */
@Controller
@RequestMapping(value = "/studentHomework")
public class StudentHomeworkController extends BaseController {
	@Resource(name = "studentHomeworkService")
	private StudentHomeworkService studentHomeworkService;

	/**
	 *编辑,提交作业
	 */
	@RequestMapping(value = "/edit")
	public ModelAndView edit() {
		logBefore(logger, "学生提交作业");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			studentHomeworkService.edit(pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 学生查看我的作业
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Page page) {
		logBefore(logger, "列表studentHomework");
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		PageData paraPd = new PageData();
		paraPd.putAll(pd);
		String title = paraPd.getString("TITLE");
		if (title != null && !"".equals(title)) {
			paraPd.put("TITLE", title);
		}
		String CREATE_TIME_START = paraPd.getString("CREATE_TIME_START");
		if (CREATE_TIME_START != null && !"".equals(CREATE_TIME_START)) {
			paraPd.put("CREATE_TIME_START", CREATE_TIME_START + " 00:00:00");
		}
		String CREATE_TIME_END = paraPd.getString("CREATE_TIME_END");
		if (CREATE_TIME_END != null && !"".equals(CREATE_TIME_END)) {
			paraPd.put("CREATE_TIME_END", CREATE_TIME_END + " 23:59:59");
		}
		paraPd.put("STUDENT_ID", user.getUSER_ID());
		try {
			page.setPd(paraPd);
			List<PageData> varList = studentHomeworkService.list(page); // 列出homeworkServiceCtr列表
			mv.setViewName("edu/studentHomework/student_homework_list");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX, this.getHC());
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * 删除单个文件
	 * 
	 * @param sPath
	 *            被删除文件的文件名
	 * @return 单个文件删除成功返回true，否则返回false
	 */
	public boolean deleteFile(String path) {
		logBefore(logger, "删除文件");

		boolean flag = false;
		File webRootPath = PathTools.getWebRootPath();
		File file = new File(webRootPath, path);
		// 路径为文件且不为空则进行删除
		if (file.isFile() && file.exists()) {
			if (file.delete()) {
				flag = true;
			}
		} else {
			flag = true;
		}
		return flag;
	}

	/**
	 * Edit页_刪除
	 */
	@RequestMapping(value = "/deleteFileEdit")
	public void deleteFileEdit() {
		logBefore(logger, "根据ID删除文件");
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			PageData resultPd = studentHomeworkService.findById(pd);
			if (this.deleteFile(resultPd.getString("ANSWER_PATH"))) {
				studentHomeworkService.deleteAnswer(pd);
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
	}

	/*
	 * 列表
	 * 
	 * @RequestMapping(value = "/listAll") public ModelAndView listAll(PageData
	 * pd) { logBefore(logger, "列表studentHomework"); ModelAndView mv =
	 * this.getModelAndView(); PageData pd1 = new PageData(); try { pd =
	 * this.getPageData(); String KEYW = pd.getString("keyword"); if (null !=
	 * KEYW && !"".equals(KEYW)) { KEYW = KEYW.trim(); pd.put("KEYW", KEYW); }
	 * //pd.setPd(pd); List<PageData> varList =
	 * studentHomeworkService.listAll(pd); // 列出homeworkServiceCtr列表
	 * 
	 * varList = studentHomeworkService.listAll(pd);
	 * mv.setViewName("edu/homeworkctr/student_homeworkctr_list");
	 * mv.addObject("varList", varList); mv.addObject("pd", pd);
	 * mv.addObject(Const.SESSION_QX, this.getHC()); } catch (Exception e) { //
	 * TODO Auto-generated catch block e.printStackTrace(); }
	 * 
	 * return mv; }
	 */
	/**
	 * 去查看页面
	 */
	@RequestMapping(value = "/goCheckHomework")
	public ModelAndView goCheckHomework() {
		logBefore(logger, "去查看studentHomeworkCtr页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			List<PageData> resultpd = studentHomeworkService.listAll(pd);

			mv.setViewName("edu/studentHomework/student_homework_check");
			mv.addObject("msg", "listAll");
			mv.addObject("pd", resultpd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * 去提交页面
	 */
	@RequestMapping(value = "/goSubmitHomework")
	public ModelAndView goSubmitHomework() {
		logBefore(logger, "去studentHomeworkCtrSubmit页面");
		ModelAndView mv = this.getModelAndView();
		try {
			PageData pd = this.getPageData();
			PageData resultPd = studentHomeworkService.findById(pd);
			String answer_path = resultPd.getString("ANSWER_PATH");
			if (!"".equals(answer_path) && answer_path != null) {
				resultPd.put("ANSWER_NAME", "作业."
						+ answer_path
								.substring(answer_path.lastIndexOf(".") + 1));
			}
			mv.setViewName("edu/studentHomework/student_homework_submit");
			mv.addObject("msg", "submitHomework");
			mv.addObject("pd", resultPd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	@RequestMapping(value = "/submitHomework")
	public ModelAndView submitHomework(
			@RequestParam(value = "fujian", required = false) MultipartFile file,
			HttpServletRequest request, ModelMap model) throws Exception {
		logBefore(logger, "提交作业");
		PageData pd = new PageData(request);
		ModelAndView mv = this.getModelAndView();
		//查询截止时间
		String id=pd.getString("ID");
		PageData paraStdHomeworkPd=new PageData();
		paraStdHomeworkPd.put("ID", id);
		PageData stdHomeworkPd=studentHomeworkService.findById(paraStdHomeworkPd);
		String endTime=stdHomeworkPd.getString("END_TIME");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date endTimeDate=sdf.parse(endTime);
		Date currentDate=new Date();
		if(currentDate.after(endTimeDate)){
			mv.addObject("msg", "已到截止时间，不允许提交！");
			mv.setViewName("save_fails");
			return mv;
		}
		
		
		String filePath = null;
		String ffile = DateUtil.getDays();
		String fileName = null;
		String path = null;
		String suffix = null;
		String originalFilename = null;
		if (null != file && !file.isEmpty()) {
			if(file.getSize()>Const.MAX_ZUOYE_SIZE){
				mv.addObject("msg", "文件大小不能超过"+(Const.MAX_ZUOYE_SIZE/1024)+"k");
				mv.setViewName("save_fails");
				return mv;
			}
			originalFilename = file.getOriginalFilename();
			suffix = originalFilename.substring(
					originalFilename.lastIndexOf(".") + 1).toUpperCase();
			if (Dic.NOT_SUFFIX.contains(suffix)) {
				mv.addObject("msg", "请不要上传格式为【" + Dic.NOT_SUFFIX + "】的附件！");
				mv.setViewName("save_fails");
				return mv;
			}
			filePath = PathUtil.getClasspath() + Const.HOMEWORD_FILEPATHFILE + ffile; // 文件上传路径
			fileName = FileUpload.fileUp(file, filePath, this.get32UUID()); // 执行上传
			path = Const.HOMEWORD_FILEPATHFILE + ffile + "/" + fileName;
		}
		pd.put("STATUS", 1);
		pd.put("ANSWER_PATH", path);
		pd.put("ANSWER_NAME", "作业" + "." + suffix);
		pd.put("SUBMIT_TIME", DateUtil.getTime());
		studentHomeworkService.edit(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	@RequestMapping("download")
	public ResponseEntity<byte[]> download() {
		logBefore(logger, "下载附件");
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			PageData resultPd = studentHomeworkService.findById(pd);
			if (resultPd != null && !resultPd.isEmpty()) {
				String filename = resultPd.getString("TITLE");
				String path = (String) resultPd.get("ANSWER_PATH");
				filename=filename+ path.substring(path.lastIndexOf("."));
				File webRootPath = PathTools.getWebRootPath();
				File file = new File(webRootPath, path);
				HttpHeaders headers = new HttpHeaders();
				String fileName = new String(filename.getBytes("UTF-8"),
						"iso-8859-1");// 为了解决中文名称乱码问题
				String suffix = file.getName().substring(
						file.getName().lastIndexOf(".") + 1).toUpperCase();
				filename = filename + "." + suffix;
				headers.setContentDispositionFormData("attachment", fileName);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				return new ResponseEntity<byte[]>(FileUtils
						.readFileToByteArray(file), headers, HttpStatus.CREATED);
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return null;
	}
	
	/**
	 * 列表作业详细
	 */
	@RequestMapping(value = "/homeworkDetailed")
	public ModelAndView HomeworkDetailed(Page page) {
		logBefore(logger, "列表Homework");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			page.setPd(pd);
			
			PageData para_pd = new PageData();
			para_pd.put("JR_CLASS_ID", pd.get("HOMEWORK_ID"));
			List<PageData> varList = studentHomeworkService.homeworkDetailed(pd); // 列出Homework列表
			mv.setViewName("edu/studentHomework/homeworkDetailed");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX, this.getHC()); // 按钮权限
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/*
	 * 导出到excel
	 * 
	 * @return
	 */
	@RequestMapping(value = "/excel")
	public ModelAndView exportExcel() {
		logBefore(logger, "导出Homework到excel");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			Map<String, Object> dataMap = new HashMap<String, Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("布置时间"); // 1
			titles.add("作业名称"); // 2
			titles.add("状态"); // 3
			titles.add("截止日期");// 4
			titles.add("分数");// 5
			titles.add("提交时间");// 6
			titles.add("答案文本");// 7
			dataMap.put("titles", titles);
			List<PageData> varOList = studentHomeworkService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for (int i = 0; i < varOList.size(); i++) {
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString(
						"HOMEWORK_CREATE_TIME")); // 1
				vpd.put("var2", varOList.get(i).getString("TITLE")); // 2
				String status = varOList.get(i).getString("STATUS");
				if ("0".equals(status)) {
					status = "未提交";
				}
				if ("1".equals(status)) {
					status = "已提交";
				}
				if ("2".equals(status)) {
					status = "需要重新提交";
				}
				if ("".equals(status) || status == null) {
					status = "";
				}
				String score = varOList.get(i).getString("SCORE");
				if ("".equals(score) || score == null) {
					score = "未提交";
				}
				vpd.put("var3", status); // 3
				vpd.put("var4", varOList.get(i).getString("END_TIME"));
				vpd.put("var5", score);
				vpd.put("var6", varOList.get(i).getString("SUBMIT_TIME"));
				vpd.put("var7", varOList.get(i).getString("ANSWER"));
				varList.add(vpd);
			}
			dataMap.put("varList", varList);
			ObjectExcelView erv = new ObjectExcelView();
			mv = new ModelAndView(erv, dataMap);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/* ======================权限====================== */
	@SuppressWarnings("unchecked")
	private Map<String, String> getHC() {
		// TODO Auto-generated method stub
		Subject currentUser = SecurityUtils.getSubject();// shiro管理的session
		Session session = currentUser.getSession();
		return (Map<String, String>) session.getAttribute(Const.SESSION_QX);
	}
	/* ======================权限====================== */
}
