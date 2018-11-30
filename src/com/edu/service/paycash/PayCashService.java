package com.edu.service.paycash;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.edu.Dic;
import com.edu.service.email.EmailService;
import com.edu.service.email.EmailTools;
import com.edu.service.student.StudentService;
import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import common.been.ResultHashMap;


@Service("paycashService")
public class PayCashService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	@Resource(name="studentService")
	private StudentService studentService;
	
	@Resource(name="emailService")
	private EmailService emailService;
	
	/**
	 * 登记缴费
	 * @param pd
	 * @throws Exception
	 */
	public void executPayCash(PageData pd) throws Exception{
		
		dao.save("PayCashMapper.save", pd);
		//分配学生号
		String stdNum=studentService.buildStdNum();
		
		PageData stdPd=new PageData();
		stdPd.put("STATUS", Dic.STD_STATUS_ZHENGSHI);
		stdPd.put("STATUS_NAME", Dic.getNameById(Dic.dic_std_status_list, Dic.STD_STATUS_ZHENGSHI));
		stdPd.put("ID", pd.get("STD_ID"));
		stdPd.put("STD_NUM", stdNum);
		studentService.edit(stdPd);
		
		//注册登录用户
		stdPd=new PageData();
		String stdId=(String)pd.get("STD_ID");
		stdPd.put("ID", stdId);
		PageData resultPd=studentService.findById(stdPd);
		studentService.reg(resultPd);
	}
	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		String payType=pd.getString("PAY_TYPE");
		int payTypeInt=Integer.parseInt(payType);
		String emailTempId=EmailTools.JIAO_FEI;
		Object money=pd.get("MONEY");
		double moneyDouble=0;
		if(money!=null){
			try{
				moneyDouble=Double.parseDouble(money.toString());
			}catch(Exception e){
				e.printStackTrace();
			}
			//退费
			if(Dic.DIC_PAY_TYPE_TUIFEI==payTypeInt){
				pd.put("MONEY", -moneyDouble);
				emailTempId=EmailTools.TUI_FEI;
			}
		}
		//保存缴费金额
		dao.save("PayCashMapper.save", pd);
		//更新学生缴费的金额
		Object STD_ID=pd.get("STD_ID");
		updateStudentPay((String)STD_ID);
		
		
		/*
		 * 如果是报名费，将人员状态更改为预备学员
		 */
		if(payTypeInt==Dic.DIC_PAY_TYPE_BAOMINGFEI){
			PageData paraPd=new PageData();
			paraPd.put("ID", STD_ID);
			paraPd.put("STATUS", Dic.STD_STATUS_YUBEI);
			studentService.edit(paraPd);
		}else if(payTypeInt==Dic.DIC_PAY_TYPE_QITA){
			PageData paraPd=new PageData();
			paraPd.put("ID", STD_ID);
			studentService.executeSubmitStudent(paraPd);
		}
		
		
		//=============================准备发送邮件===============================
		String SEND=pd.getString("SEND");
		if(SEND!=null && "1".equals(SEND)){
			PageData paraStdPd=new PageData();
			paraStdPd.put("ID", STD_ID);
			PageData stdPd=studentService.findById(paraStdPd);
			String name=stdPd.getString("NAME");
			String email=stdPd.getString("EMAIL");
			
			PageData paraEmailPd=new PageData();
			paraEmailPd.put("ID", emailTempId);
			PageData emailPd=emailService.findById(paraEmailPd);
			String emailname=emailPd.getString("EMAILNAME");
			String emailcontent=emailPd.getString("EMAILCONTENT");
			
			Map map=new HashMap();
			map.put("[money]", moneyDouble+"");
			EmailTools.sendEmail(new String[]{email}, new String[]{name}, emailname, emailcontent, "1", "yes", map);
		}
		//=============================准备发送邮件===============================
		
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		PageData payCashPd=findById(pd);
		Object STD_ID=payCashPd.get("STD_ID");
		
		dao.delete("PayCashMapper.delete", pd);
		
		updateStudentPay((String)STD_ID);
		
		
	}
	
	/**
	 * 根据Student表id，更新student表的pay字段
	 * @param stdId
	 * @throws Exception 
	 */
	public void updateStudentPay(String stdId) throws Exception{
		PageData paraPayCashPd=new PageData();
		paraPayCashPd.put("STD_ID", stdId);
		
		PageData sumPd=(PageData)dao.findForObject("PayCashMapper.SumByStdId", paraPayCashPd);
		double sumDouble=0;
		if(sumPd!=null && !sumPd.isEmpty()){
			Object sum=sumPd.get("SUM");
			try{
				sumDouble=Double.parseDouble(sum.toString());
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		sumDouble= new BigDecimal(sumDouble).setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue();


		PageData paraStdPd=new PageData();
		paraStdPd.put("ID", stdId);
		paraStdPd.put("PAY", sumDouble);
		studentService.edit(paraStdPd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("PayCashMapper.edit", pd);
	}
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("PayCashMapper.datalistPage", page);
	}
	public int numIsRepeated(PageData pd) throws Exception{
		ResultHashMap rhm=new ResultHashMap();
		int c=(Integer)dao.findForObject("PayCashMapper.select_count", pd);
		return c;
	}
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PayCashMapper.listAll", pd);
	}
	
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PayCashMapper.findById", pd);
	}
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		PageData paraPd=new PageData();
		paraPd.put("ID", ArrayDATA_IDS[0]);
		PageData payCashPd=findById(paraPd);
		Object STD_ID=payCashPd.get("STD_ID");
		
		dao.delete("PayCashMapper.deleteAll", ArrayDATA_IDS);
		
		updateStudentPay((String)STD_ID);
	}
	
}

