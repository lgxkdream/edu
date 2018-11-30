package com.edu.ctrls.track;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.edu.Dic;
import com.edu.service.track.TrackService;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.FileUpload;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.PathUtil;
import com.fh.util.Watermark;

/** 
 * 类名称：TrackController
 * 创建人：FH 
 * 创建时间：2015-06-17
 */
@Controller
@RequestMapping(value="/track")
public class TrackController extends BaseController {
	
	@Resource(name="trackService")
	private TrackService trackService;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(@RequestParam(value="IMG_PATH", required = false) MultipartFile[] mfArray, HttpServletRequest request) throws Exception{
		logBefore(logger, "新增Track");
		ModelAndView mv = this.getModelAndView();
		
		StringBuilder img_path=new StringBuilder();
        String  ffile = DateUtil.getDays();
		if(mfArray!=null){
			for(MultipartFile file:mfArray){
				if (null != file && !file.isEmpty()) {
					String name=file.getOriginalFilename();
					String suffix=name.substring(name.lastIndexOf(".")+1).toUpperCase();
					if(!Dic.IMAGE_SUFFIX.contains(suffix)){
						mv.addObject("msg", "请上传格式为【"+Dic.IMAGE_SUFFIX+"】的图片！");
						mv.setViewName("save_fails");
						return mv;
					}
					String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG + ffile;		//文件上传路径
					String fileName = FileUpload.fileUp(file, filePath, this.get32UUID());				//执行上传
					img_path.append(Const.FILEPATHIMG+ffile + "/" + fileName+",");
				}else{
//					mv.addObject("msg", "上传失败");
//					mv.setViewName("save_fails");
//					return mv;
				}
				
			}
		}
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		
		PageData pd = new PageData(request);
		pd.put("ID", this.get32UUID());	//主键
		pd.put("IMG_PATH", img_path.toString());
		pd.put("CREATOR", user.getUSER_ID());
		pd.put("CREATOR_NAME", user.getUSERNAME());
		pd.put("CREATE_TIME", DateUtil.getTime());
		
		trackService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger, "删除Track");
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			trackService.delete(pd);
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(@RequestParam(value="IMG_PATH", required = false) MultipartFile[] mfArray, HttpServletRequest request) throws Exception{
		logBefore(logger, "修改Track");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData(request);
		
		StringBuilder img_path=new StringBuilder();
        String  ffile = DateUtil.getDays();
        if(mfArray!=null){
			for(MultipartFile file:mfArray){
				if (null != file && !file.isEmpty()) {
					if(file.getSize()>Const.MAX_IMG_SIZE){
						mv.addObject("msg", "文件大小超过"+(Const.MAX_IMG_SIZE/1024)+"k");
						mv.setViewName("save_fails");
						return mv;
					}
					String name=file.getOriginalFilename();
					String suffix=name.substring(name.lastIndexOf(".")+1).toUpperCase();
					if(!Dic.IMAGE_SUFFIX.contains(suffix)){
						mv.addObject("msg", "请上传格式为【"+Dic.IMAGE_SUFFIX+"】的图片！");
						mv.setViewName("save_fails");
						return mv;
					}
					String filePath = PathUtil.getClasspath() + Const.TRACK_FILEPATHIMG + ffile;		//文件上传路径
					String fileName = FileUpload.fileUp(file, filePath, this.get32UUID());				//执行上传
					img_path.append(Const.TRACK_FILEPATHIMG+ffile + "/" + fileName+",");
				}else{
//					mv.addObject("msg", "上传失败");
//					mv.setViewName("save_fails");
//					return mv;
				}
			}
		}
        
        String old_img_path=pd.getString("OLD_IMG_PATH");
		String imgPath="";
		if(!"".equals(old_img_path)){
			if(",".equals(old_img_path.substring(old_img_path.length()-1))){
				imgPath=old_img_path+img_path.toString();
			}else{
				imgPath=old_img_path+","+img_path.toString();
			}
		}else{
			imgPath=img_path.toString();
		}
		pd.put("IMG_PATH", imgPath);
		
		trackService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, "列表Track");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = trackService.list(page);	//列出Track列表
			mv.setViewName("edu/track/track_list");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX,this.getHC());	//按钮权限
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd(){
		logBefore(logger, "去新增Track页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("edu/track/track_edit");
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(){
		logBefore(logger, "去修改Track页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = trackService.findById(pd);	//根据ID读取
			mv.setViewName("edu/track/track_edit");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 批量删除
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() {
		logBefore(logger, "批量删除Track");
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				trackService.deleteAll(ArrayDATA_IDS);
				pd.put("msg", "ok");
			}else{
				pd.put("msg", "no");
			}
			pdList.add(pd);
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}
	
	/*
	 * 导出到excel
	 * @return
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel(){
		logBefore(logger, "导出Track到excel");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("意向");	//1
			titles.add("备注");	//2
			titles.add("创建人ID");	//3
			titles.add("创建人姓名");	//4
			titles.add("创建时间");	//5
			dataMap.put("titles", titles);
			List<PageData> varOList = trackService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).get("YIXIANG").toString());	//1
				vpd.put("var2", varOList.get(i).getString("REMARK"));	//2
				vpd.put("var3", varOList.get(i).getString("CREATOR"));	//3
				vpd.put("var4", varOList.get(i).getString("CREATOR_NAME"));	//4
				vpd.put("var5", varOList.get(i).getString("CREATE_TIME"));	//5
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
