package com.edu.service.email;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.fh.util.Const;
import com.fh.util.PageData;
import com.fh.util.Tools;
import com.fh.util.mail.SimpleMailSender;

public class EmailTools {
	/**
	 * 退费
	 */
	public static final String TUI_FEI="1";
	/**
	 * 缴费
	 */
	public static final String JIAO_FEI="0e5752fdaedc4907ac5c6bfe3e98bf5d";
	/**
	 * 发送电子邮件
	 * @param emailArray
	 * @param nameArray
	 * @param title
	 * @param content
	 * @param type 是1
	 * @param isTemp 是否启用模板，yes/no
	 * @param paraMap
	 * @return
	 */
	public static PageData sendEmail(String[] emailArray,String[] nameArray,String title,String content,String type,String isTemp,Map paraMap){
		String msg = "ok";		//发送状态
		int count = 0;			//统计发送成功条数
		int zcount = 0;			//理论条数
		
		String strEMAIL = Tools.readTxtFile(Const.EMAIL);		//读取邮件配置
		
		
		if(null != strEMAIL && !"".equals(strEMAIL)){
			String strEM[] = strEMAIL.split(",fh,");
			if(strEM.length == 4){
				if("yes".endsWith(isTemp)){
					//使用模版发送邮件
					zcount = emailArray.length;
					try {
						for(int i=0;i<emailArray.length;i++){
							if(Tools.checkEmail(emailArray[i])){		//邮箱格式不对就跳过
								//SimpleMailSender.sendEmail(strEM[0], strEM[1], strEM[2], strEM[3], arrTITLE[i], mb_TITLE, mb_CONTENT,TYPE);//调用发送邮件函数
								//System.out.println("333 "+CONTENT.replace("[Stuname]", arrStu[i]));
								String s=content;
								if(s!=null){
									Iterator it=paraMap.keySet().iterator();
									while(it.hasNext()){
										String key=(String)it.next();
										String value=(String)paraMap.get(key);
										s=s.replace(key, value);
									}
									if(s.indexOf("[Stuname]")>=0){
										s=s.replace("[Stuname]", nameArray[i]);
									}
								}
								SimpleMailSender.sendEmail(strEM[0], strEM[1], strEM[2], strEM[3], emailArray[i], title,s , type);//调用发送邮件函数
								count++;
							}else{
								continue;
							}
						}
						msg = "ok";
					} catch (Exception e) {
						e.printStackTrace();
						msg = "error";
					} 
					
				}else{
					zcount = emailArray.length;
					try {
						for(int i=0;i<emailArray.length;i++){
							if(Tools.checkEmail(emailArray[i])){		//邮箱格式不对就跳过
								SimpleMailSender.sendEmail(strEM[0], strEM[1], strEM[2], strEM[3], emailArray[i], title, content, type);//调用发送邮件函数
								count++;
							}else{
								continue;
							}
						}
						msg = "ok";
					} catch (Exception e) {
						e.printStackTrace();
						msg = "error";
					} 
				}	
			}else{
				msg = "error";
			}
		}else{
			msg = "error";
		}
		PageData pd=new PageData();
		pd.put("msg", msg);
		pd.put("count", count);						//成功数
		pd.put("ecount", zcount-count);				//失败数
		return pd;
	}
}
