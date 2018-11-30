package com.edu;

import java.util.List;
import java.util.Map;

public class Dic {

	/**
	 * 默认密码
	 */
	public static final String PASSWORD="123456";
	/**
	 * 正式学员
	 */
	public static final int STD_STATUS_ZHENGSHI=10;
	/**
	 * 意向学员
	 */
	public static final int STD_STATUS_YIXIANG=100;
	/**
	 * 预备学员
	 */
	public static final int STD_STATUS_YUBEI=110;
	/**
	 * 毕业学员
	 */
	public static final int STD_STATUS_BIYEXUEYUAN=120;
	
	/**
	 * 报名费
	 */
	public static final int DIC_PAY_TYPE_BAOMINGFEI=10;
	/**
	 * 其他费用
	 */
	public static final int DIC_PAY_TYPE_QITA=30;
	/**
	 * 退费
	 */
	public static final int DIC_PAY_TYPE_TUIFEI=100;
	
	/**
	 * 图片后缀
	 */
	public static final String IMAGE_SUFFIX="JPG,JPE,JPEG,PNG,BMP,GIF";
	/**
	 * 不允许上传的格式
	 */
	public static final String NOT_SUFFIX="EXE";
	
	/**
	 * 英语等级字典
	 */
	public static List<Map> dic_english_list;
	/**
	 * 学校数据字典
	 */
	public static List<Map> dic_school_list;
	/**
	 * 职务数据字典
	 */
	public static List<Map> dic_job_list;
	/**
	 * 专业数据字典
	 */
	public static List<Map> dic_speciality_list;
	/**
	 * 学生状态数据字典
	 */
	public static List<Map> dic_std_status_list;
	/**
	 * 缴费类型
	 */
	public static List<Map> dic_pay_type_list;
	/**
	 * 政治面貌
	 * */
	public static List<Map> dic_zzmm_list;
	/**
	 * 民族
	 * */
	public static List<Map> dic_minzu_list;
	/**
	 * 教程
	 * */
	public static List<Map> dic_subject_list;
	/**
	 * 学历
	 * */
	public static List<Map> dic_edu_list;
	/**
	 * 员工状态
	 */
	public static List<Map> dic_stff_status_list;
	/**
	 * 作业题库分类
	 */
	public static List<Map> dic_homework_type_list;
	/**
	 * 邮件模版
	 */
	public static List<Map> dic_emailmodel_list;
	/**
	 * 上课时间数据字典
	 */
	public static List<Map> dic_lesson_time_list;
	/**
	 * 校区数据字典
	 */
	public static List<Map> dic_campus_list;
	/**
	 * 教室数据字典
	 */
	public static List<Map> dic_classroom_list;
	/**
	 * 班级数据字典
	 */
	public static List<Map> dic_class_list;
	/**
	 * 根据id值返回对应的map
	 * @param list
	 * @param id
	 * @return
	 */
	public static Map getById(List<Map> list,int id){
		return getById(list,"ID",id);
	}
	public static String getNameById(List<Map> list,int id){
		return (String)getById(list,"ID",id).get("NAME");
	}
	public static Map getById(List<Map> list,String column,int value){
		for(Map map:list){
			int valueTemp=(Integer)map.get(column);
			if(value==valueTemp){
				return map;
			}
		}
		return null;
	}

	public static Object getIdByText(List<Map> list,String text){
		Map map=getByText(list,"NAME",text);
		Object id=null;
		if(map==null){
			System.out.println("没找到匹配的值："+list.get(0).get("NAME")+"----"+text);
		}else{
			id=map.get("ID");
		}
		return id;
	}
	public static Map getByText(List<Map> list,String key,String text){
		for(Map map:list){
			String valueTemp=(String)map.get(key);
			if(text.equals(valueTemp)){
				return map;
			}
		}
		return null;
	}
}
