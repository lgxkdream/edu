package com.edu.service.lesson;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.edu.Dic;
import com.edu.service.BaseService;
import com.fh.util.PageData;
import common.utils.UUIDTool;
@Service("lessonService")
public class LessonService extends BaseService{
	public void unitLesson(PageData pd) throws Exception {
		String campusId = pd.getString("CAMPUS_ID");
		String campusName = Dic.getNameById(Dic.dic_campus_list,Integer.parseInt(campusId));
		String startDate = pd.getString("START_DATE");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String endDate =(String)pd.get("END_DATE");
		List<PageData> classroom = (List<PageData>) dao.findForList("dic_classroom.select_info", pd); 
		List<Map> time = Dic.dic_lesson_time_list; 
		List<Map> unitInfo = null;
		if (classroom!=null&&classroom.size()>0&&time!=null&&time.size()>0) {
			unitInfo = new ArrayList<Map>();
			for (Map room:classroom) {
				for(Map t:time){
					PageData info = new PageData();
					info.put("ID", UUIDTool.getUUID());
					info.put("CAMPUS_ID", campusId);
					info.put("CAMPUS_NAME", campusName);
					info.put("CLASSROOM_NAME", room.get("NAME"));
					info.put("CLASSROOM_ID", room.get("ID"));
					info.put("START_DATE", startDate);
					info.put("END_DATE", endDate);
					info.put("TIME_ID", t.get("ID"));
					info.put("TIME", t.get("TIME"));
					unitInfo.add(info);
				}
			}
		}
		dao.batchSave("LessonMapper.batchAdd",unitInfo);
	}
	public List<PageData> list(PageData pd) throws Exception {
		List<PageData> result =(List<PageData>) dao.findForList("LessonMapper.list",pd);
		if (result!=null && result.size()>0) {
			return result;
		}
		return null;
	}
	public void edit(List<PageData> updateList) throws Exception {
		dao.batchUpdate("LessonMapper.batchUpdate", updateList);
	}
}
