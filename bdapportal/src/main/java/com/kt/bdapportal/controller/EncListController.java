package com.kt.bdapportal.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.channels.FileChannel;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kt.bdapportal.common.util.BbsConstant;
import com.kt.bdapportal.common.util.NdapApiWrapper;
import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.BdapCol;
import com.kt.bdapportal.domain.BdapCrypto;
import com.kt.bdapportal.domain.BdapCryptoCol;
import com.kt.bdapportal.domain.BdapFile;
import com.kt.bdapportal.domain.BdapTbl;
import com.kt.bdapportal.domain.MgmtTblStat;
import com.kt.bdapportal.service.BdapColService;
import com.kt.bdapportal.service.BdapCryptoColService;
import com.kt.bdapportal.service.BdapCryptoService;
import com.kt.bdapportal.service.FileService;
import com.kt.bdapportal.service.MgmtTblStatService;
import com.kt.bdapportal.service.TblService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class EncListController {

	@Autowired
	private BdapCryptoService bdapCryptoService;

	@Autowired
	private BdapCryptoColService bdapCryptoColService;

	@Autowired
	private MgmtTblStatService mgmtTblStatService;

	@Autowired
	private TblService tblService;

	@Autowired
	private BdapColService colService;

	@Autowired
	private FileService fileService;

	private NdapApiWrapper ndapApiWrapper;
	
	@RequestMapping("/encList.do")
	public ModelAndView tableManagementList(HttpServletRequest request, HttpServletResponse response,
			@PageableDefault(sort = { "BBS_REG_DT" }, direction = Direction.DESC, size = 15) Pageable pageable) {

		ModelAndView mav = new ModelAndView("/list/encList");

		try {

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}

		return mav;
	}

	@RequestMapping("/getEncList.do")
	public void getEncList(HttpServletRequest request, HttpServletResponse response) {

		try {

			request.setCharacterEncoding("UTF-8");
			HttpSession session = request.getSession();
			String userId = (String) session.getAttribute("USER_ID");

			JSONObject jsonObj = new JSONObject();

			int page = Integer.parseInt((String) request.getParameter("page"));
			jsonObj.put("page", String.valueOf(page));
			int rows = Integer.parseInt((String) request.getParameter("rows"));

			int startnum = (page - 1) * rows;

			JSONArray jsonArray = new JSONArray();

			List<BdapCrypto> bdapCryptoList = bdapCryptoService.getEncDecList(userId, 'E', startnum, rows);

			/*
			 * String bdapCryptoIdList = "";
			 * 
			 * for(int i = 0; i < bdapCryptoList.size(); i++){ BdapCrypto
			 * bdapCrypto = bdapCryptoList.get(i); bdapCryptoIdList +=
			 * "'"+bdapCrypto.getCrtId()+"'"+","; }
			 * 
			 * bdapCryptoIdList = bdapCryptoIdList.substring(0,
			 * bdapCryptoIdList.length()-1);
			 * 
			 * List<BdapFile> bdapFileList =
			 * fileService.getFileListbyParentIdArr(bdapCryptoIdList);
			 */

			Long bdapCryptoListCount = bdapCryptoService.getEncDecListCount(userId, 'E');

			for (int i = 0; i < bdapCryptoList.size(); i++) {
				BdapCrypto bdapCrypto = bdapCryptoList.get(i);
				JSONObject jsonObj1 = new JSONObject();
				List<BdapFile> bdapFileList = fileService.getFileListbyParentId(bdapCrypto.getCrtId());
				String fileName = "";
				if (bdapFileList.size() > 0) {
					String fileStorePath = BbsConstant.FILE_STORE_PATH + File.separator;
					String fileTempPath = BbsConstant.FILE_TEMP_PATH + File.separator + userId;

					File directory = new File(fileTempPath);
					if (directory.exists() == false) {
						directory.mkdirs();
					}
					try {
					for (int j = 0; j < bdapFileList.size(); j++) {
						BdapFile bdapFile = bdapFileList.get(j);

						FileInputStream inputStream = new FileInputStream(fileStorePath + bdapFile.getFleStroNm());
						FileOutputStream outputStream = new FileOutputStream(
								fileTempPath + File.separator + bdapFile.getFleDisplayNm());

						FileChannel fcin = inputStream.getChannel();
						FileChannel fcout = outputStream.getChannel();

						long size = fcin.size();
						fcin.transferTo(0, size, fcout);

						fcout.close();
						fcin.close();

						outputStream.close();
						inputStream.close();

						fileName += bdapFile.getFleDisplayNm() + "*";
					}

					} catch (Exception e) {
						
					}
				}
				String reqDt = (bdapCrypto.getCrtReqDt() != null && !bdapCrypto.getCrtReqDt().equals(""))
						? bdapCrypto.getCrtReqDt().toString().substring(0, 19) : "";
				String processDt = (bdapCrypto.getCrtResDt() != null && !bdapCrypto.getCrtResDt().equals(""))
						? bdapCrypto.getCrtResDt().toString().substring(0, 19) : "";
				String validateDt = (bdapCrypto.getCrtEndDate() != null && !bdapCrypto.getCrtEndDate().equals(""))
						? bdapCrypto.getCrtEndDate().toString().substring(0, 10) : "";
				String status = "";
				if (bdapCrypto.getCrtStatus().equals("REQ")) {
					status = "요청됨";
				} else if (bdapCrypto.getCrtStatus().equals("SUC")) {
					status = "승인";
				} else if (bdapCrypto.getCrtStatus().equals("FAL")) {
					status = "반려";
				}
				jsonObj1.put("separation", "암호화");
				jsonObj1.put("reqDt", reqDt);
				jsonObj1.put("projectNm", bdapCrypto.getCrtPrjNm());
				jsonObj1.put("reason", bdapCrypto.getCrtReqReason());
				jsonObj1.put("schema", bdapCrypto.getCrtSrcDbNm());
				jsonObj1.put("table", bdapCrypto.getCrtSrcTblNm());
				jsonObj1.put("column", bdapCrypto.getCrtDocNum());
				jsonObj1.put("status", status);
				jsonObj1.put("download", fileName);
				jsonObj1.put("processDt", processDt);
				jsonObj1.put("validateDate", validateDt);
				jsonObj1.put("cryptoId", bdapCrypto.getCrtId());

				jsonArray.add(jsonObj1);
			}

			int forLastPage = (bdapCryptoListCount % rows > 0) ? 1 : 0;
			jsonObj.put("records", bdapCryptoListCount);
			jsonObj.put("total", (bdapCryptoListCount / rows) + forLastPage);
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

	@RequestMapping("/encdec.do")
	public ModelAndView encdec(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("encdec");

		String type = (String) request.getParameter("type");
		mav.addObject("type", type);

		String searchWord = (String) request.getParameter("searchWord"); // searchWord

		SearchVO searchVO = new SearchVO();

		searchWord = searchVO.nullTrim(searchWord);
		searchVO.setSearchWord(searchWord);
		mav.addObject("searchVO", searchVO);

		List<MgmtTblStat> mgmtTblStatDbList = mgmtTblStatService.getMgmtTblDbList();
		mav.addObject("mgmtTblStatDbList", mgmtTblStatDbList);

		return mav;
	}

	@RequestMapping("/getTableList.do")
	public void getTableList(HttpServletRequest request, HttpServletResponse response) {

		try {

			String schema = (String) request.getParameter("schema");

			List<BdapTbl> tblList = tblService.getTableList(schema);

			JSONObject jsonObj = new JSONObject();

			jsonObj.put("tblList", tblList);
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// selectcolumn.do?colTblId=2
	@RequestMapping("/selectcolumn.do")
	public ModelAndView selectcolumn(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("selectcolumn");

		try {

			String colTblId = (String) request.getParameter("colTblId");

			List<BdapCol> colList = colService.getBdapColListByTblId(colTblId);

			mav.addObject("colList", colList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;

	}

	@RequestMapping("/encDecinsert.do")
	public void encDecinsert(HttpServletRequest request, HttpServletResponse response) {

		try {

			HttpSession session = request.getSession();

			String userId = (String) session.getAttribute("USER_ID");
			request.setCharacterEncoding("UTF-8");

			SearchVO searchVO = new SearchVO();

			String type = searchVO.nullTrim(request.getParameter("type"));
			String schema = searchVO.nullTrim(request.getParameter("schema"));
			// String tableList =
			// searchVO.nullTrim(request.getParameter("tableList"));
			String tableList = searchVO.nullTrim(request.getParameter("colTblNm"));
			String lawReview = searchVO.nullTrim(request.getParameter("lawReview"));
			String fileListArr = searchVO.nullTrim(request.getParameter("fileList"));
			String validateDate = searchVO.nullTrim(request.getParameter("validateDate"));
			if (!validateDate.equals("")) {
				validateDate = validateDate.replaceAll("/", "-") + " 00:00:00";
			}

			char yn;
			if (lawReview.equals("Y")) {
				yn = 'Y';
			} else {
				yn = 'N';
			}

			String selectedColumn = (String) request.getParameter("selectedColumn");
			String tableNm = (String) request.getParameter("tableNm");

			if (tableNm == null) {
				tableNm = "";
			}

			// String colTblId = (String)request.getParameter("colTblId");
			String prjNm = (String) request.getParameter("prjNm");
			String reason = (String) request.getParameter("reason");
			String docNumber = (String) request.getParameter("docNumber");
			String rtnUrl = "";

			BdapCrypto bdapCrypto = new BdapCrypto();

			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Calendar cal = Calendar.getInstance();
			String today = "";
			today = formatter.format(cal.getTime());
			Timestamp ts = Timestamp.valueOf(today);

			if (type.equals("enc")) {
				bdapCrypto.setCrtType('E');
				rtnUrl = "encList.do";
			} else if (type.equals("dec")) {
				bdapCrypto.setCrtType('D');
				rtnUrl = "decList.do";
			}

			bdapCrypto.setCrtStatus("REQ");
			bdapCrypto.setCrtPrjNm(prjNm);
			bdapCrypto.setCrtReqReason(reason);
			bdapCrypto.setCrtReqDt(ts);
			bdapCrypto.setCrtIsChkRaw(yn);
			// bdapCrypto.setCrtStartDate(ts); //관리자가 승인한 일시가 되야함
			bdapCrypto.setCrtEndDate(ts);
			// bdapCrypto.setCrtResDt(ts);
			bdapCrypto.setCrtDocNum(docNumber);
			bdapCrypto.setCrtCreateTblNm(tableNm);
			bdapCrypto.setCrtOwnerId(userId);
			bdapCrypto.setCrtSrcDbNm(schema);
			bdapCrypto.setCrtSrcTblNm(tableList);
			bdapCrypto.setCrtEndDate(formatter.parse(validateDate));

			bdapCrypto = bdapCryptoService.encDecInsert(bdapCrypto);

			String[] fileList = fileListArr.split("\\*");

			if (fileList.length != 0 && fileList.equals("")) {

				String fileTempPath = BbsConstant.FILE_TEMP_PATH + File.separator + userId;
				String filePath = BbsConstant.FILE_STORE_PATH + File.separator;

				File directory = new File(filePath);
				if (directory.exists() == false) {
					directory.mkdirs();
				}

				for (int i = 0; i < fileList.length; i++) {
					BdapFile bdapFile = new BdapFile();
					String fileStrNm = UUID.randomUUID().toString().replaceAll("\\-", "");

					FileInputStream inputStream = new FileInputStream(fileTempPath + File.separator + fileList[i]);
					FileOutputStream outputStream = new FileOutputStream(filePath + fileStrNm);

					FileChannel fcin = inputStream.getChannel();
					FileChannel fcout = outputStream.getChannel();

					long size = fcin.size();
					fcin.transferTo(0, size, fcout);

					fcout.close();
					fcin.close();

					outputStream.close();
					inputStream.close();

					bdapFile.setFleStroNm(fileStrNm);
					bdapFile.setFleDisplayNm(fileList[i]);
					bdapFile.setFleRegDt(ts);
					bdapFile.setFleExtNm(fileList[i].substring(fileList[i].lastIndexOf(".")));
					bdapFile.setFleParentId(bdapCrypto.getCrtId());
					bdapFile.setFleType('C');
					bdapFile = fileService.fileInsert(bdapFile);
				}
			}

			String[] columnArr = selectedColumn.split("\\,");

			for (int i = 0; i < columnArr.length; i++) {
				BdapCryptoCol bdapCryptoCol = new BdapCryptoCol();
				bdapCryptoCol.setCrtParentId(bdapCrypto.getCrtId());
				bdapCryptoCol.setCrtColNm(columnArr[i]);
				bdapCryptoColService.encDecInsert(bdapCryptoCol);
			}

			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("window.opener.location.href = '" + rtnUrl + "';");
			out.println("window.close();");
			out.println("</script>");
			out.flush();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping("/encDecProcess.do")
	public String encDecProcess(HttpServletRequest request, HttpServletResponse response) {

		String rtnStr = "";

		String cryptoId = (String) request.getParameter("cryptoId");
		String processType = (String) request.getParameter("processType");
		String type = (String) request.getParameter("type");

		BdapCrypto bdapCrypto = new BdapCrypto();

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		String today = "";
		today = formatter.format(cal.getTime());
		Timestamp ts = Timestamp.valueOf(today);

		bdapCrypto = bdapCryptoService.getBdapCryptoByCryptoId(cryptoId);

		if (type.equals("enc")) {
			rtnStr = "redirect:/encList.do";
		} else {
			rtnStr = "redirect:/decList.do";
		}
		boolean isProcessed = true;
		String result = "";
		if(processType.equals("SUC")) {
			try{
				result = NdapApiWrapper.getInstance().encTable(bdapCrypto);
			}catch(Exception e){
				isProcessed = false;
				e.printStackTrace();
			}
		}else if(processType.equals("FAL")) {
			//none
		}
		
		bdapCrypto.setCrtStatus(processType);
		bdapCrypto.setCrtResDt(ts);
		bdapCrypto = bdapCryptoService.encDecInsert(bdapCrypto);
		
		if(type.equals("enc") && ((!isProcessed || result.equals("")) || !result.contains("value"))){
			response.setCharacterEncoding("UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('처리 요청을 실패하였습니다.');");
				out.println("</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		return rtnStr;

	}

	@RequestMapping("/reapplicationProcess.do")
	public String reapplicationProcess(HttpServletRequest request, HttpServletResponse response) {

		String rtnStr = "";

		String cryptoId = (String) request.getParameter("cryptoId");
		String type = (String) request.getParameter("type");

		if (type.equals("enc")) {
			rtnStr = "redirect:/encList.do";
		} else {
			rtnStr = "redirect:/decList.do";
		}
		BdapCrypto bdapCrypto = new BdapCrypto();

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		String today = "";
		today = formatter.format(cal.getTime());
		Timestamp ts = Timestamp.valueOf(today);

		bdapCrypto = bdapCryptoService.getBdapCryptoByCryptoId(cryptoId);
		bdapCrypto.setCrtStatus("REQ");
		bdapCrypto.setCrtReqDt(ts);
		bdapCrypto = bdapCryptoService.encDecInsert(bdapCrypto);

		return rtnStr;

	}

}
