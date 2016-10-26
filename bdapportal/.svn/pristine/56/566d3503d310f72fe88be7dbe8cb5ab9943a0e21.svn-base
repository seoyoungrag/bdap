package com.kt.bdapportal;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Locale;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {

	private static final Logger LOGGER = LoggerFactory.getLogger(MainController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		LOGGER.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	@RequestMapping("/move.do")
	public ModelAndView move(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("list");

		return mav;
	}

	@RequestMapping("/nopermission.do")
	public ModelAndView nopermission(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("nopermission");

		return mav;
	}

	@RequestMapping("/list.do")
	public void list(HttpServletRequest request, HttpServletResponse response) {

		try {

			JSONObject jsonObj = new JSONObject();
			int page = Integer.parseInt((String) request.getParameter("page"));
			jsonObj.put("page", String.valueOf(page));
			int count = 0;
			int rows = Integer.parseInt((String) request.getParameter("rows"));

			File originalFilePath = new File("C:\\Users\\sourcream\\Desktop\\요구사항\\image"); // was의
																							// temp경로쯤?
			File files[] = originalFilePath.listFiles(); // temp경로의 파일을 가져온다.
			int filesLen = files.length;
			JSONArray jsonArray = new JSONArray();

			for (int i = 0; i < filesLen; i++) {

				String fileFullName = files[i].getName(); // 확장자 포함 파일 이름
				String fileName = fileFullName.substring(0, fileFullName.lastIndexOf(".")); // 확장자
																							// 제거
																							// 파일
																							// 이름
				String fileExt = fileFullName.substring(fileFullName.lastIndexOf(".") + 1); // 확장자

				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

				String filelastModDate = sdf.format(files[i].lastModified()); // 파일
																				// 최종
																				// 수정일
				long fileSize = files[i].length(); // 파일 사이즈

				File originalFileNm = new File("C:\\Users\\sourcream\\Desktop\\요구사항\\image\\" + fileFullName);

				if (!(fileName.indexOf("thumbNail") > 0)) { // 이미 만들어진 썸네일 이미지가
															// 있다면 반복해서 만들지 않는댜.
					count++;

					int startnum = (page - 1) * rows + 1;
					int endnum = startnum + rows - 1;

					if (count >= startnum && count <= endnum) { // 페이징 처리
						String makeFileName = fileName + "_thumbNail." + fileExt; // 만들어질
																					// 파일
																					// 이름(확장자
																					// 제거
																					// 파일
																					// 이름_thumbNail.확장자)
						File thumbnailFileNm = new File("C:\\Users\\sourcream\\Desktop\\요구사항\\image\\" + makeFileName);
						int width = 70;
						int height = 70;
						BufferedImage originalImg = ImageIO.read(originalFileNm);
						BufferedImage thumbnailImg = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
						Graphics2D g = thumbnailImg.createGraphics();
						g.drawImage(originalImg, 0, 0, width, height, null);
						ImageIO.write(thumbnailImg, "jpg", thumbnailFileNm);
						JSONObject jsonObj1 = new JSONObject();
						jsonObj1.put("count", count);
						jsonObj1.put("image", makeFileName);
						jsonObj1.put("fileName", fileName + "." + fileExt);
						jsonObj1.put("create_date", filelastModDate);
						jsonObj1.put("size", (fileSize / 1024) + "kb");
						jsonObj1.put("creatorid", "sourcream");
						jsonObj1.put("hitnum", "1");
						jsonObj1.put("page", (String) request.getParameter("page"));
						jsonArray.add(jsonObj1);
					}

				}

			}

			int forLastPage = (count % rows > 0) ? 1 : 0;

			jsonObj.put("records", count);
			jsonObj.put("total", (count / rows) + forLastPage);
			jsonObj.put("rows", jsonArray);

			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping("/thumbnailFileDel.do") // 만들어진 썸네일 이미지를 화면이 닫히기 전에 삭제 한다.
	public void thumbnailFileDel(HttpServletRequest request, HttpServletResponse response) {

		try {
			File originalFilePath = new File("C:\\Users\\sourcream\\Desktop\\요구사항\\image");
			File files[] = originalFilePath.listFiles();
			int filesLen = files.length;

			for (int i = 0; i < filesLen; i++) {

				String fileFullName = files[i].getName(); // 확장자 포함 파일 이름
				String fileName = fileFullName.substring(0, fileFullName.lastIndexOf(".")); // 확장자
																							// 제거
																							// 파일
																							// 이름
				String fileExt = fileFullName.substring(fileFullName.lastIndexOf(".") + 1); // 확장자

				if (fileFullName.indexOf("thumbNail") > 0) { // 썸네일 파일이면
					File originalFileNm = new File("C:\\Users\\sourcream\\Desktop\\요구사항\\image\\" + fileFullName);
					originalFileNm.delete();
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping("/uploadPage.do") // 만들어진 썸네일 이미지를 화면이 닫히기 전에 삭제 한다.
	public ModelAndView uploadPage(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("fileUpload");

		mav.addObject("test", "qwer");

		return mav;

	}

	@RequestMapping("/fileUpload.do") // 만들어진 썸네일 이미지를 화면이 닫히기 전에 삭제 한다.
	public ModelAndView fileUpload(HttpServletRequest request, HttpServletResponse response)
			throws IllegalStateException, IOException {

		ModelAndView mav = new ModelAndView("fileUpload");
		try {

			MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
			Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

			MultipartFile multipartFile = null;
			String originalFileName = null;
			String originalFileExtension = null;
			String storedFileName = null;

			String filePath = "C:\\Users\\sourcream\\Desktop\\요구사항\\image\\";
			File file = new File(filePath);
			if (file.exists() == false) {
				file.mkdirs();
			}

			while (iterator.hasNext()) {
				multipartFile = multipartHttpServletRequest.getFile(iterator.next());
				if (multipartFile.isEmpty() == false) {
					originalFileName = multipartFile.getOriginalFilename();
					originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
					storedFileName = originalFileName + "testtest" + originalFileExtension;

					file = new File(filePath + storedFileName);
					multipartFile.transferTo(file);

				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;

	}

	@RequestMapping("/ktMainPage.do") // 메인 페이지1
	public ModelAndView ktMainPage(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("ktMainPage");

		return mav;

	}

	@RequestMapping("/ktMainPageSub1.do") // 메인 페이지 서브1
	public ModelAndView ktMainPageSub1(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("ktMainPageSub1");

		return mav;

	}

	@RequestMapping("/bdapPortalMain.do") // 메인 페이지 서브2
	public ModelAndView ktMainPageSub2(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("bdapPortalMain");

		return mav;

	}

	@RequestMapping("/ktMainPageSub3.do") // 메인 페이지 서브2
	public ModelAndView ktMainPageSub3(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("ktMainPageSub3");

		return mav;

	}

	@RequestMapping("/ktMainPageSub4.do") // 메인 페이지 서브4 (그래프 변경)
	public ModelAndView ktMainPageSub4(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("ktMainPageSub4");

		return mav;

	}

	@RequestMapping("/ktMainPageSecond.do") // 메인 페이지 kt 요구 시안
	public ModelAndView ktMainPageSecond(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("ktMainPageSecond");

		return mav;

	}

	@RequestMapping("/common.do") // 메인 페이지2
	public ModelAndView common(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("common");

		return mav;

	}

	@RequestMapping("/testpage.do") // 테스트 페이지
	public ModelAndView testpage(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("testpage");

		return mav;

	}

	@RequestMapping("/ktMainPage2.do") // 메인 페이지2
	public ModelAndView ktMainPage2(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("ktMainPage2");

		return mav;

	}

	@RequestMapping("/ktMainPage3.do")
	public ModelAndView ktMainPage3(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("ktMainPage3");

		return mav;

	}

	@RequestMapping("/ktMainPage5.do") // data meta system 적재현황 조회
	public ModelAndView ktMainPage5(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("ktMainPage5");

		return mav;

	}

	@RequestMapping("/ktMainPage6.do") // table management
	public ModelAndView ktMainPage6(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("ktMainPage6");

		return mav;

	}

	@RequestMapping("/ktMainPage7.do") // user query management
	public ModelAndView ktMainPage7(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("ktMainPage7");

		return mav;

	}

	@RequestMapping("/statistics.do") // 통계
	public ModelAndView statistics(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("statistics");

		return mav;

	}

	/*
	 * @RequestMapping("/ktMainPage8.do") //자료실 public ModelAndView
	 * ktMainPage8(HttpServletRequest request, HttpServletResponse response) {
	 * 
	 * ModelAndView mav = new ModelAndView("ktMainPage8");
	 * 
	 * return mav;
	 * 
	 * }
	 */

	/*
	 * @RequestMapping("/ktMainPage9.do") //Q & A public ModelAndView
	 * ktMainPage9(HttpServletRequest request, HttpServletResponse response) {
	 * 
	 * ModelAndView mav = new ModelAndView("ktMainPage9");
	 * 
	 * return mav;
	 * 
	 * }
	 */

	/*
	 * @RequestMapping("/ktMainPage10.do") // 공지사항 public ModelAndView
	 * ktMainPage10(HttpServletRequest request, HttpServletResponse response) {
	 * 
	 * ModelAndView mav = new ModelAndView("ktMainPage10");
	 * 
	 * return mav;
	 * 
	 * }
	 */

	@RequestMapping("/ktMainPage11.do") // 암/복호화
	public ModelAndView ktMainPage11(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("ktMainPage11");

		return mav;

	}

	/*
	 * @RequestMapping("/ktMainPage12.do") // 비정기자료 연동 진행 현황 public ModelAndView
	 * ktMainPage12(HttpServletRequest request, HttpServletResponse response) {
	 * 
	 * ModelAndView mav = new ModelAndView("ktMainPage12");
	 * 
	 * return mav;
	 * 
	 * }
	 * 
	 * 
	 * @RequestMapping("/ktMainPage13.do") // 개발 요청 진행 현황 public ModelAndView
	 * ktMainPage13(HttpServletRequest request, HttpServletResponse response) {
	 * 
	 * ModelAndView mav = new ModelAndView("ktMainPage13");
	 * 
	 * return mav;
	 * 
	 * }
	 */

	@RequestMapping("/ktMainPage14.do")
	public ModelAndView ktMainPage14(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("ktMainPage14");

		return mav;

	}

	@RequestMapping("/ktMainPage15.do") // 복호화 신청 및 현황 조회
	public ModelAndView ktMainPage15(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("ktMainPage15");

		return mav;

	}

	@RequestMapping("/ktMainPage16.do") // 복호화 권한 조회
	public ModelAndView ktMainPage16(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("ktMainPage16");

		return mav;

	}

	@RequestMapping("/ktlist.do")
	public void ktlist(HttpServletRequest request, HttpServletResponse response) {

		try {

			JSONObject jsonObj = new JSONObject();
			int page = Integer.parseInt((String) request.getParameter("page"));
			jsonObj.put("page", String.valueOf(page));
			int count = 0;
			int rows = Integer.parseInt((String) request.getParameter("rows"));

			JSONArray jsonArray = new JSONArray();

			String[] obj = { "row", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11" };
			String[] sourcream = { "1", "BDAP", "KDAP2_DW", "TRD_CDR_SGI", "TRD_CDR_SGI", "SVC_CONT_ID", "test", "test",
					"VAR CHAR", "test", "test", "0000002", "", "", "", "", "", "", "", "", "", "", "" };

			for (int i = 0; i < sourcream.length; i++) {
				JSONObject jsonObj1 = new JSONObject();
				for (int j = 0; j < obj.length; j++) {
					jsonObj1.put(obj[j], sourcream[j]);
				}
				jsonArray.add(jsonObj1);
			}

			jsonObj.put("rows", jsonArray);

			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping("/ktlist2.do")
	public void ktlist2(HttpServletRequest request, HttpServletResponse response) {

		try {

			JSONObject jsonObj = new JSONObject();
			int page = Integer.parseInt((String) request.getParameter("page"));
			jsonObj.put("page", String.valueOf(page));
			int count = 0;
			int rows = Integer.parseInt((String) request.getParameter("rows"));

			JSONArray jsonArray = new JSONArray();

			String test = (String) request.getParameter("test");
			int testlen = Integer.parseInt(test);

			String[] obj = { "row", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11" };
			String[] sourcream = { "1", "trd_cdr_vc", "22,850", "1,019", "22,850", "1,019", "22,850", "1,019",
					"VAR CHAR", "test", "test", "0000002", "", "", "", "", "", "", "", "", "", "", "" };

			for (int i = 0; i < 100; i++) {
				JSONObject jsonObj1 = new JSONObject();
				for (int j = 0; j < testlen; j++) {
					jsonObj1.put(String.valueOf(j), sourcream[1]);
				}
				jsonArray.add(jsonObj1);
			}

			jsonObj.put("rows", jsonArray);

			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping("/ktlist3.do")
	public void ktlist3(HttpServletRequest request, HttpServletResponse response) {

		try {

			JSONObject jsonObj = new JSONObject();
			int page = Integer.parseInt((String) request.getParameter("page"));
			jsonObj.put("page", String.valueOf(page));
			int count = 0;
			int rows = Integer.parseInt((String) request.getParameter("rows"));

			JSONArray jsonArray = new JSONArray();

			String[] obj = { "row", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11" };
			String[] sourcream = { "1", "admin", "select", "TRD_CDR_SGI", "TRD_CDR_SGI", "SVC_CONT_ID", "test", "test",
					"VAR CHAR", "test", "test", "0000002", "", "", "", "", "", "", "", "", "", "", "" };

			for (int i = 0; i < sourcream.length; i++) {
				JSONObject jsonObj1 = new JSONObject();
				for (int j = 0; j < obj.length; j++) {
					jsonObj1.put(obj[j], sourcream[j]);
				}
				jsonArray.add(jsonObj1);
			}

			jsonObj.put("rows", jsonArray);

			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping("/ktlist4.do")
	public void ktlist4(HttpServletRequest request, HttpServletResponse response) {

		try {

			JSONObject jsonObj = new JSONObject();
			int page = Integer.parseInt((String) request.getParameter("page"));
			jsonObj.put("page", String.valueOf(page));
			int count = 0;
			int rows = Integer.parseInt((String) request.getParameter("rows"));

			JSONArray jsonArray = new JSONArray();

			String[] obj = { "row", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11" };
			String[] sourcream = { "1", "기능", "[비정형메뉴얼](실적)DFAM내역 업무 적용 공지", "2016-06-16", "15", "SVC_CONT_ID", "test",
					"test", "VAR CHAR", "test", "test", "0000002", "", "", "", "", "", "", "", "", "", "", "" };

			for (int i = 0; i < sourcream.length; i++) {
				JSONObject jsonObj1 = new JSONObject();
				for (int j = 0; j < obj.length; j++) {
					jsonObj1.put(obj[j], sourcream[j]);
				}
				jsonArray.add(jsonObj1);
			}

			jsonObj.put("rows", jsonArray);
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping("/ktlist5.do")
	public void ktlist5(HttpServletRequest request, HttpServletResponse response) {

		try {

			JSONObject jsonObj = new JSONObject();
			int page = Integer.parseInt((String) request.getParameter("page"));
			jsonObj.put("page", String.valueOf(page));
			int count = 0;
			int rows = Integer.parseInt((String) request.getParameter("rows"));

			JSONArray jsonArray = new JSONArray();

			String[] obj = { "row", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11" };
			String[] sourcream = { "1", "BIDW", "유선안심센터 검증 미비건수 마감일 문의(0)", "처리중", "계약", "", "관리자", "BI/DW운영팀",
					"2016-06-11", "test", "test", "0000002", "", "", "", "", "", "", "", "", "", "", "" };

			for (int i = 0; i < sourcream.length; i++) {
				JSONObject jsonObj1 = new JSONObject();
				for (int j = 0; j < obj.length; j++) {
					jsonObj1.put(obj[j], sourcream[j]);
				}
				jsonArray.add(jsonObj1);
			}

			jsonObj.put("rows", jsonArray);
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/*
	 * @RequestMapping("/ktlist6.do") //공지사항리스트 public void
	 * ktlist6(HttpServletRequest request, HttpServletResponse response) {
	 * 
	 * try{
	 * 
	 * JSONObject jsonObj = new JSONObject(); int page =
	 * Integer.parseInt((String)request.getParameter("page"));
	 * jsonObj.put("page", String.valueOf(page)); int count = 0; int rows =
	 * Integer.parseInt((String)request.getParameter("rows"));
	 * 
	 * JSONArray jsonArray = new JSONArray();
	 * 
	 * String[] obj = {"row","1","2","3","4","5","6","7","8","9","10","11"};
	 * String[] sourcream =
	 * {"1","BIDW","추가개발","[BI/DW 긴급공지] 시스템 작업","예","2016-06-21","관리자",
	 * "BI/DW운영팀","2016-06-11","test","test","0000002","","","","","","","","",
	 * "","",""};
	 * 
	 * for(int i = 0; i < sourcream.length;i++){ JSONObject jsonObj1 = new
	 * JSONObject(); for(int j = 0; j < obj.length; j++){ jsonObj1.put(obj[j],
	 * sourcream[j]); } jsonArray.add(jsonObj1); }
	 * 
	 * jsonObj.put("rows", jsonArray); response.setCharacterEncoding("UTF-8");
	 * PrintWriter pw = response.getWriter(); pw.print(jsonObj); pw.flush();
	 * pw.close();
	 * 
	 * }catch(Exception e){ e.printStackTrace(); }
	 * 
	 * }
	 */

	@RequestMapping("/ktlist7.do") // 암복호화 리스트
	public void ktlist7(HttpServletRequest request, HttpServletResponse response) {

		try {

			JSONObject jsonObj = new JSONObject();
			int page = Integer.parseInt((String) request.getParameter("page"));
			jsonObj.put("page", String.valueOf(page));
			int count = 0;
			int rows = Integer.parseInt((String) request.getParameter("rows"));

			JSONArray jsonArray = new JSONArray();

			String[] obj = { "row", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11" };
			String[] sourcream = { "암호화", "2016-06-11", "프로젝트", "신규개발", "schema", "table", "column", "진행중",
					"2016-06-11", "download", "재신청", "처리", "", "", "", "", "", "", "", "", "", "", "" };

			for (int i = 0; i < sourcream.length; i++) {
				JSONObject jsonObj1 = new JSONObject();
				for (int j = 0; j < obj.length; j++) {
					jsonObj1.put(obj[j], sourcream[j]);
				}
				jsonArray.add(jsonObj1);
			}

			jsonObj.put("rows", jsonArray);
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/*
	 * @RequestMapping("/referenceReg.do") //자료실 등록 페이지 public ModelAndView
	 * referenceReg(HttpServletRequest request, HttpServletResponse response) {
	 * 
	 * ModelAndView mav = new ModelAndView("referenceReg");
	 * 
	 * //String type= (String)request.getParameter("type");
	 * 
	 * return mav; }
	 * 
	 * @RequestMapping("/linkageReg.do") //비정기자료 연동 등록 페이지 public ModelAndView
	 * linkageReg(HttpServletRequest request, HttpServletResponse response) {
	 * 
	 * ModelAndView mav = new ModelAndView("linkageReg");
	 * 
	 * //String type= (String)request.getParameter("type");
	 * 
	 * return mav; }
	 */

	/*
	 * @RequestMapping("/devreqReg.do") //개발요청 등록 페이지 public ModelAndView
	 * devreqReg(HttpServletRequest request, HttpServletResponse response) {
	 * 
	 * ModelAndView mav = new ModelAndView("devreqReg");
	 * 
	 * //String type= (String)request.getParameter("type");
	 * 
	 * return mav; }
	 */

	/*
	 * @RequestMapping("/qnaReg.do") //Q & A 등록 페이지 public ModelAndView
	 * qnaReg(HttpServletRequest request, HttpServletResponse response) {
	 * 
	 * ModelAndView mav = new ModelAndView("qnaReg");
	 * 
	 * //String type= (String)request.getParameter("type");
	 * 
	 * return mav; }
	 */

	/*
	 * @RequestMapping("/qnaview.do") //Q & A 등록 페이지 public ModelAndView
	 * qnaview(HttpServletRequest request, HttpServletResponse response) {
	 * 
	 * ModelAndView mav = new ModelAndView("qnaview");
	 * 
	 * //String type= (String)request.getParameter("type");
	 * 
	 * return mav; }
	 */

	@RequestMapping("/columnpop.do") // 컬럼 정보 확인 팝업
	public ModelAndView columnpop(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("getcolumninfo");

		// String type= (String)request.getParameter("type");

		return mav;
	}

	@RequestMapping("/ktlist10.do")
	public void ktlist10(HttpServletRequest request, HttpServletResponse response) {

		try {

			JSONObject jsonObj = new JSONObject();
			int page = Integer.parseInt((String) request.getParameter("page"));
			jsonObj.put("page", String.valueOf(page));
			int count = 0;
			int rows = Integer.parseInt((String) request.getParameter("rows"));

			JSONArray jsonArray = new JSONArray();

			String[] obj = { "row", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11" };
			String[] sourcream = { "1", "BDAP", "KDAP2_DW", "2016-05-11", "20000", "55", "test", "test", "VAR CHAR",
					"test", "test", "0000002", "", "", "", "", "", "", "", "", "", "", "" };

			for (int i = 0; i < sourcream.length; i++) {
				JSONObject jsonObj1 = new JSONObject();
				for (int j = 0; j < obj.length; j++) {
					jsonObj1.put(obj[j], sourcream[j]);
				}
				jsonArray.add(jsonObj1);
			}

			jsonObj.put("rows", jsonArray);

			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping("/ktlist11.do") // setup list1
	public void ktlist11(HttpServletRequest request, HttpServletResponse response) {

		try {

			JSONObject jsonObj = new JSONObject();
			int page = Integer.parseInt((String) request.getParameter("page"));
			jsonObj.put("page", String.valueOf(page));
			int count = 0;
			int rows = Integer.parseInt((String) request.getParameter("rows"));

			JSONArray jsonArray = new JSONArray();

			String[] obj = { "row", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11" };
			String[] sourcream = { "ROLE_ADMIN", "권한 설명 입니다.", "SVC_CONT_ID", "2016-06-21", "2016-08-22", "false",
					"column", "진행중", "2016-06-11", "download", "재신청", "처리", "", "", "", "", "", "", "", "", "", "",
					"" };

			for (int i = 0; i < sourcream.length; i++) {
				JSONObject jsonObj1 = new JSONObject();
				for (int j = 0; j < obj.length; j++) {
					jsonObj1.put(obj[j], sourcream[j]);
				}
				jsonArray.add(jsonObj1);
			}

			jsonObj.put("rows", jsonArray);
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping("/schemalist.do") // setup list2
	public void schemalist(HttpServletRequest request, HttpServletResponse response) {

		try {

			JSONObject jsonObj = new JSONObject();
			int page = Integer.parseInt((String) request.getParameter("page"));
			jsonObj.put("page", String.valueOf(page));
			int count = 0;
			int rows = Integer.parseInt((String) request.getParameter("rows"));

			JSONArray jsonArray = new JSONArray();

			String[] obj = { "row", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11" };
			String[] sourcream = { "DW", "SVC_CONT_ID", "abd@kt.com", "2016-06-21", "2016-08-22", "false", "column",
					"진행중", "2016-06-11", "download", "재신청", "처리", "", "", "", "", "", "", "", "", "", "", "" };

			for (int i = 0; i < sourcream.length; i++) {
				JSONObject jsonObj1 = new JSONObject();
				for (int j = 0; j < obj.length; j++) {
					jsonObj1.put(obj[j], sourcream[j]);
				}
				jsonArray.add(jsonObj1);
			}

			jsonObj.put("rows", jsonArray);
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping("/getcolumninfo.do") // setup list2
	public void getcolumninfo(HttpServletRequest request, HttpServletResponse response) {

		try {

			JSONObject jsonObj = new JSONObject();
			int page = Integer.parseInt((String) request.getParameter("page"));
			jsonObj.put("page", String.valueOf(page));
			int count = 0;
			int rows = Integer.parseInt((String) request.getParameter("rows"));

			JSONArray jsonArray = new JSONArray();

			String[] obj = { "row", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11" };
			String[] sourcream = { "COL1", "STRING", "컬럼에 관한 설명", "true", "true", "true", "column", "진행중", "2016-06-11",
					"download", "재신청", "처리", "", "", "", "", "", "", "", "", "", "", "" };

			for (int i = 0; i < sourcream.length; i++) {
				JSONObject jsonObj1 = new JSONObject();
				for (int j = 0; j < obj.length; j++) {
					jsonObj1.put(obj[j], sourcream[j]);
				}
				jsonArray.add(jsonObj1);
			}

			jsonObj.put("rows", jsonArray);
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
