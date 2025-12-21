package common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class CommonUtil {

	// 생년월일 yyyy-MM-dd
	public static String birthForm(String birth) {
		try {
			SimpleDateFormat ymd = new SimpleDateFormat("yyyyMMdd");
			Date date = ymd.parse(birth);
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");

			birth = sd.format(date);
			return birth;

		} catch (ParseException e) {
			e.printStackTrace();
			return null; // 에러 처리
		}
	}

	// 오늘날짜 yyyy-MM-dd
	public static String getToday() {
		Date date = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");

		String today = sd.format(date);
		return today;
	}

	// 오늘날짜 시분초 yyyy-MM-dd HH:mm:ss
	public static String getTodayTime() {
		Date date = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		String today = sd.format(date);
		return today;
	}

	// 비밀번호 암호화
	public String encryptSHA256(String value) throws NoSuchAlgorithmException {
		String encryptData = "";

		MessageDigest sha = MessageDigest.getInstance("SHA-256");
		sha.update(value.getBytes());

		byte[] digest = sha.digest();
		for (int i = 0; i < digest.length; i++) {
			encryptData += Integer.toHexString(digest[i] & 0xFF).toUpperCase();
		}

		return encryptData;
	}

//	DB에 저장할때 escapeHtml 적용해서 저장. 
//	수정 저장할 땐 CommonUtil.escapeHtml(CommonUtil.unescapeHtml(String content))하기.
	public static String escapeHtml(String str) {
	    if (str == null) return "";
	    return str.replace("&", "&amp;")
	    		  .replace("<", "&lt;")
	    		  .replace(">", "&gt;")
	              .replace("\"", "&quot;")
	              .replace("'", "&#39;")
	              .replace("/", "&#x2F;")
	    		  .replace("\r\n", "<br>")  // 1. Windows 줄바꿈(\r\n) 처리
	    		  .replace("\n", "<br>");   // 2. Unix/Mac 줄바꿈(\n) 처리
	}
	
	public static String unescapeHtml(String str) {
	    if (str == null) return "";
	    return str.replaceAll("(?i)<br\\s*/?>", "\n")
	    		  .replace("&amp;", "&")
	              .replace("&lt;", "<")
	              .replace("&gt;", ">")
	              .replace("&quot;", "\"")
	              .replace("&#39;", "'")
	              .replace("&#x2F;", "/");
	}
	
	
//	페이징 메소드
	public static String getPageSetting(int current_page,int total_page, int pageNumber_count){
		int pagenumber;    //화면에 보여질 페이지 인덱스수
		int startpage;     //화면에 보여질 시작 페이지 번호
		int endpage;       //화면에 보여질 마지막 페이지 번호
		int curpage;       //이동하고자 하는 페이지 번호
		
		String strList=""; //리턴될 페이지 인덱스 리스트

		pagenumber = pageNumber_count;   //한 화면의 페이지 인덱스수
		
		//시작 페이지 번호 구하기
		startpage = ((current_page - 1)/ pagenumber) * pagenumber + 1;
		//마지막 페이지 번호 구하기
		endpage = (((startpage -1) + pagenumber) / pagenumber)*pagenumber;
		//총페이지수가 계산된 마지막 페이지 번호보다 작을 경우
		//총페이지수가 마지막 페이지 번호가 됨
		
		if(total_page <= endpage)  endpage = total_page;
					
		//첫번째 페이지 인덱스 화면이 아닌경우
		if(current_page > pagenumber){
			curpage = startpage -1;  //시작페이지 번호보다 1적은 페이지로 이동
			strList = strList +"<a href=javascript:goListPage('"+curpage+"') ><i class='fa fa-angle-double-left'></i></a>";
		}
						
		//시작페이지 번호부터 마지막 페이지 번호까지 화면에 표시
		curpage = startpage;
		while(curpage <= endpage){
			if(curpage == current_page){
				strList = strList +"<a class='active'>"+current_page+"</a>";
			} else {
				strList = strList +"<a href=javascript:goListPage('"+curpage+"')>"+curpage+"</a>";
			}
			curpage++;
		}
		//뒤에 페이지가 더 있는 경우
		if(total_page > endpage){
			curpage = endpage+1;
			strList = strList + "<a href=javascript:goListPage('"+curpage+"') ><i class='fa fa-angle-double-right'></i></a>";
		}
		return strList;
	}
	
//	Notice의 첨부파일 경로 리턴
	public static String getNoticeDir(HttpServletRequest request) {
		String attachDir = request.getServletContext().getRealPath("/attach/notice/");
		System.out.println(attachDir);
		return attachDir;
	   }	
//	Review 첨부파일 경로 리턴
	public static String getProductDir(HttpServletRequest request) {
		String attachDir = request.getServletContext().getRealPath("/attach/review/");
		System.out.println(attachDir);
		return attachDir;
	   }	
	
	
	
	
	
//	아이디 가져오기
	public static String getSessionInfo(HttpServletRequest request) {
	      
	      HttpSession session = request.getSession();
	      String value= (String)session.getAttribute("sessionId");
	      
	      return value;
	   }
	
}
