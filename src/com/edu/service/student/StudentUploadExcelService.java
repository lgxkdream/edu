package com.edu.service.student;

import java.io.InputStream;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;

import com.edu.Dic;
import com.edu.service.BaseService;
import com.fh.entity.system.User;
import com.fh.service.system.user.UserService;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.PageData;
import common.utils.UUIDTool;
@Service("studentUploadExcelService")
public class StudentUploadExcelService extends BaseService {
	@Resource(name="studentService")
	private StudentService studentService;
	
	@Resource(name="userService")
	private UserService userService;
	
	public PageData executReadExcel(InputStream is, int startrow, int startcol, int sheetnum) throws Exception{
//		List<Object> varList = new ArrayList<Object>();

		try {
			HSSFWorkbook wb = new HSSFWorkbook(is);
			HSSFSheet sheet = wb.getSheetAt(sheetnum); 					//sheet 从0开始
			int rowNum = sheet.getLastRowNum() + 1; 					//取得最后一行的行号

			for (int i = startrow; i < rowNum; i++) {					//行循环开始
				
				PageData varpd = new PageData();
				HSSFRow row = sheet.getRow(i); 							//行
				int cellNum = row.getLastCellNum(); 					//每行的最后一个单元格位置

				for (int j = startcol; j < cellNum; j++) {				//列循环开始
					
					HSSFCell cell = row.getCell(Short.parseShort(j + ""));
					String cellValue = null;
					if (null != cell) {
						switch (cell.getCellType()) { 					// 判断excel单元格内容的格式，并对其进行转换，以便插入数据库
						case 0:
							cellValue = String.valueOf((int) cell.getNumericCellValue());
							break;
						case 1:
							cellValue = cell.getStringCellValue();
							break;
						case 2:
							cellValue = cell.getNumericCellValue() + "";
							// cellValue = String.valueOf(cell.getDateCellValue());
							break;
						case 3:
							cellValue = "";
							break;
						case 4:
							cellValue = String.valueOf(cell.getBooleanCellValue());
							break;
						case 5:
							cellValue = String.valueOf(cell.getErrorCellValue());
							break;
						}
					} else {
						cellValue = "";
					}
					
					varpd.put("var"+j, cellValue);
					
				}
//				varList.add(varpd);
				try{
					save(varpd,i);
				}catch(Exception e){
					e.printStackTrace();
					if(e instanceof StudentUploadExcelException){
						throw e;
					}else{
						varpd.put("row_num", i);
						throw new StudentUploadExcelException(varpd);
					}
				}
			}

		} catch (Exception e) {
			throw e;
		}
		
		return null;
	}
	
	private void save(PageData pd ,int row) throws Exception{
		row++;//行数从0开始，所以要+1
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		
//		String std_num=studentService.buildStdNum();
		String name=(String)pd.get("var0");
		String gender=(String)pd.get("var1");
		String sfzh=(String)pd.get("var2");
		String school=(String)pd.get("var3");
		Object school_id=Dic.getIdByText(Dic.dic_school_list, school);
		String school_year=(String)pd.get("var4");
		String speciality=(String)pd.get("var5");
		Object speciality_id=Dic.getIdByText(Dic.dic_speciality_list, speciality);
		String clasz=(String)pd.get("var6");
		String room_num=(String)pd.get("var7");
		String phone=(String)pd.get("var8");
		String email=(String)pd.get("var9");
		String qq=(String)pd.get("var10");
		String statusName=(String)pd.get("var11");
		
		
		int statusId=0;
		String stdNum=null;
		//如果状态时空，就默认为意向学员
		if(statusName==null || "".equals(statusName)){
			statusName=Dic.getNameById(Dic.dic_std_status_list, Dic.STD_STATUS_YIXIANG);
			statusId=Dic.STD_STATUS_YIXIANG;
		}else if("正式学员".equals(statusName)){
			statusId=Dic.STD_STATUS_ZHENGSHI;
			stdNum=studentService.buildStdNum();
		}else if("意向学员".equals(statusName)){
			statusId=Dic.STD_STATUS_YIXIANG;
		}else if("预备学员".equals(statusName)){
			statusId=Dic.STD_STATUS_YUBEI;
		}else if("毕业学员".equals(statusName)){
			statusId=Dic.STD_STATUS_BIYEXUEYUAN;
		}
		
		if(name==null || "".equals(name)){
			StudentUploadExcelException e=new StudentUploadExcelException(null);
			e.type=1;
			e.msg="第"+row+"行记录的姓名不能为空！";
			throw e;
		}
		if(email==null || "".equals(email)){
			StudentUploadExcelException e=new StudentUploadExcelException(null);
			e.type=1;
			e.msg="第"+row+"行记录的邮箱地址不能为空！";
			throw e;
		}
		
		PageData paraUserPd=new PageData();
		paraUserPd.put("USERNAME", email);
		if(null != userService.findByUId(paraUserPd)){
			StudentUploadExcelException e=new StudentUploadExcelException(null);
			e.type=1;
			e.msg="第"+row+"行记录的登录账户【"+email+"】重复";
			throw e; 
		}
		
		PageData savePd=new PageData();
		savePd.put("STD_NUM", stdNum);
		savePd.put("ID", UUIDTool.getUUID());
//		savePd.put("STD_NUM", std_num);
		savePd.put("NAME", name);
//		Dic.getIdByText(Dic., id)(list, id)
		if("男".equals(gender)){
			savePd.put("GENDER", 1);
		}else{
			savePd.put("GENDER", 2);
		}
		savePd.put("STATUS", statusId+"");//由于调用studentService.reg(savePd);方法，所以此处应传入字符串型
		savePd.put("STATUS_NAME",statusName );
		savePd.put("SCHOOL", school_id);
		savePd.put("SCHOOL_NAME", school);
		savePd.put("SCHOOL_YEAR", school_year);
		savePd.put("CLASS", clasz);
		savePd.put("ROOM_NUM", room_num);
		savePd.put("PHONE", phone);
		savePd.put("SPECIALITY", speciality_id);
		savePd.put("SPECIALITY_NAME", speciality);
		savePd.put("EMAIL", email);
		savePd.put("QQ", qq);
		savePd.put("SFZH", sfzh);
		savePd.put("DELETED", 0);
		savePd.put("CREATOR", user.getUSER_ID());
		savePd.put("CREATOR_NAME", user.getUSERNAME());
		savePd.put("CREATE_TIME", DateUtil.getTime());
		studentService.save(savePd);
		
		//如果是正式学员，就注册
		if(statusId==Dic.STD_STATUS_ZHENGSHI){
			studentService.reg(savePd);
		}
		
	}
	public class StudentUploadExcelException extends Exception{
		private PageData pd=null;
		/**
		 * type=1，异常提示在msg中
		 */
		public int type=0;
		public String msg=null;
		public PageData getPd() {
			return pd;
		}
		public void setPd(PageData pd) {
			this.pd = pd;
		}
		public StudentUploadExcelException(PageData pd){
			this.pd=pd;
		}
	}
}
