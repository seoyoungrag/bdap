package com.kt.bdapportal.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kt.bdapportal.common.util.ExcelService;
import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.domain.BdapAcl;
import com.kt.bdapportal.domain.BdapCol;
import com.kt.bdapportal.domain.BdapRole;
import com.kt.bdapportal.domain.BdapRoleAcl;
import com.kt.bdapportal.domain.BdapRoleUser;
import com.kt.bdapportal.domain.BdapTbl;
import com.kt.bdapportal.domain.BdapUser;
import com.kt.bdapportal.domain.BdapUserAcl;
import com.kt.bdapportal.repository.BdapColRepository;
import com.kt.bdapportal.repository.TblRepository;
import com.kt.bdapportal.service.BdapAclService;
import com.kt.bdapportal.service.BdapColService;
import com.kt.bdapportal.service.BdapRoleAclService;
import com.kt.bdapportal.service.BdapRoleService;
import com.kt.bdapportal.service.BdapRoleUserService;
import com.kt.bdapportal.service.BdapUserAclService;
import com.kt.bdapportal.service.BdapUserService;
import com.kt.bdapportal.service.TblService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class SetupController {

	@Autowired
	private BdapUserService bdapUserService;

	@Autowired
	private BdapUserAclService bdapUserAclService;

	@Autowired
	private BdapAclService bdapAclService;

	@Autowired
	private BdapRoleService bdapRoleService;

	@Autowired
	private BdapRoleAclService bdapRoleAclService;

	@Autowired
	private BdapRoleUserService bdapRoleUserService;

	@Autowired
	private TblService tblService;

	@Autowired
	private BdapColService colService;
	
	@Autowired
	private TblRepository tblRepository;
	
	@Autowired
	private BdapColRepository colRepository;

	@RequestMapping("/setup.do") // set up
	public ModelAndView setup(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("setup");
		List<BdapAcl> bdapAclList = bdapAclService.getBdapAclList();
		mav.addObject("bdapAclList", bdapAclList);
		List<BdapUser> bdapUserList = bdapUserService.getUserList(new SearchVO());
		mav.addObject("bdapUserList", bdapUserList);

		return mav;

	}

	@RequestMapping("/getUserList.do")
	public void getUserList(HttpServletRequest request, HttpServletResponse response) {

		SearchVO searchVO = new SearchVO();
		searchVO.setUserId(searchVO.nullTrim(request.getParameter("userId")));
		searchVO.setUserNm(searchVO.nullTrim(request.getParameter("userNm")));
		searchVO.setRoleId(searchVO.nullTrim(request.getParameter("roleId")));
		searchVO.setRoleId(searchVO.getRoleId().equals("ALL") ? "" : searchVO.getRoleId());
		JSONObject jsonObj = new JSONObject();
		List<BdapUser> bdapUserList = bdapUserService.getUserList(searchVO);
		JSONArray jsonArray = new JSONArray();
		for (int i = 0; i < bdapUserList.size(); i++) {
			BdapUser bdapUser = bdapUserList.get(i);
			JSONObject jsonObj1 = new JSONObject();
			jsonObj1.put("userNm", bdapUser.getUserNm());
			jsonObj1.put("id", bdapUser.getUserId());
			jsonObj1.put("email", bdapUser.getUserEmail());
			String createDt = bdapUser.getUserCreateDt().toString().substring(0,
					bdapUser.getUserCreateDt().toString().indexOf('.'));
			jsonObj1.put("createDt", createDt);
			jsonArray.add(jsonObj1);
		}

		jsonObj.put("rows", jsonArray);
		response.setCharacterEncoding("UTF-8");
		try {
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/getRoleList.do")
	public void getRoleList(HttpServletRequest request, HttpServletResponse response) {

		JSONObject jsonObj = new JSONObject();
		List<BdapRole> bdapRoleList = bdapRoleService.getBdapRoleList();
		JSONArray jsonArray = new JSONArray();
		for (int i = 0; i < bdapRoleList.size(); i++) {
			BdapRole bdapRole = bdapRoleList.get(i);
			JSONObject jsonObj1 = new JSONObject();

			jsonObj1.put("roleNm", bdapRole.getRoleNm());
			jsonObj1.put("id", bdapRole.getRoleId());
			jsonArray.add(jsonObj1);
		}
		jsonObj.put("rows", jsonArray);
		response.setCharacterEncoding("UTF-8");
		try {
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/getUserAclList.do")
	public void getAccessAclList(HttpServletRequest request, HttpServletResponse response) {

		SearchVO searchVO = new SearchVO();
		String userId = searchVO.nullTrim(request.getParameter("userId"));
		searchVO.setUserId(userId);
		JSONObject jsonObj = new JSONObject();
		List<BdapUserAcl> bdapUserAclList = bdapUserAclService.getBdapUserAcl(searchVO);
		JSONArray jsonArray = new JSONArray();
		if (!bdapUserAclList.isEmpty()) {
			for (BdapUserAcl acl : bdapUserAclList) {
				JSONObject jsonObj1 = new JSONObject();
				jsonObj1.put("aclList", acl.getAclId().getAclNm());
				jsonObj1.put("id", acl.getAclId().getAclId());
				jsonArray.add(jsonObj1);
			}
		}
		jsonObj.put("rows", jsonArray);
		response.setCharacterEncoding("UTF-8");
		try {
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/getRoleAclList.do")
	public void getRoleAclList(HttpServletRequest request, HttpServletResponse response) {

		try {
			SearchVO searchVO = new SearchVO();
			String roleId = searchVO.nullTrim(request.getParameter("roleId"));
			searchVO.setRoleId(roleId);
			JSONObject jsonObj = new JSONObject();
			List<BdapRoleAcl> bdapRoleAclList = bdapRoleAclService.getBdapRoleAclList(searchVO);
			JSONArray jsonArray = new JSONArray();
			if (!bdapRoleAclList.isEmpty()) {
				for (BdapRoleAcl role : bdapRoleAclList) {
					JSONObject jsonObj1 = new JSONObject();
					jsonObj1.put("aclList", role.getAclId().getAclNm());
					jsonObj1.put("id", role.getAclId().getAclId());
					jsonArray.add(jsonObj1);
				}
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

	@RequestMapping("/getRoleUserList.do")
	public void getRoleUserList(HttpServletRequest request, HttpServletResponse response) {
		try {
			SearchVO searchVO = new SearchVO();
			String roleId = searchVO.nullTrim(request.getParameter("roleId"));
			searchVO.setRoleId(roleId);
			JSONObject jsonObj = new JSONObject();
			List<BdapRoleUser> bdapRoleUserList = bdapRoleUserService.getBdapRoleUserList(searchVO);
			JSONArray jsonArray = new JSONArray();
			if (!bdapRoleUserList.isEmpty()) {
				for (BdapRoleUser role : bdapRoleUserList) {
					JSONObject jsonObj1 = new JSONObject();
					jsonObj1.put("userList", role.getUserId().getUserNm());
					jsonObj1.put("id", role.getUserId().getUserId());
					jsonArray.add(jsonObj1);
				}
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

	@RequestMapping(value = "/saveUserAcl.do", method = RequestMethod.POST)
	@ResponseBody
	public void saveUserAcl(@RequestBody BdapUserAcl bdapUserAcl, HttpServletRequest request,
			HttpServletResponse response) {
		String retVal = bdapUserAclService.updateUserAcl(bdapUserAcl).isEmpty() != true ? "수정되었습니다." : "실패하였습니다.";
		PrintWriter pw;
		try {
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("retVal", retVal);
			response.setCharacterEncoding("UTF-8");
			pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/saveRoleAcl.do", method = RequestMethod.POST)
	@ResponseBody
	public void saveRoleAcl(@RequestBody BdapRoleAcl bdapRoleAcl, HttpServletRequest request,
			HttpServletResponse response) {
		String retVal = bdapRoleAclService.updateRoleAcl(bdapRoleAcl).isEmpty() != true ? "수정되었습니다." : "실패하였습니다.";
		PrintWriter pw;
		try {
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("retVal", retVal);
			response.setCharacterEncoding("UTF-8");
			pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/saveRoleUser.do", method = RequestMethod.POST)
	@ResponseBody
	public void saveRoleUser(@RequestBody BdapRoleUser bdapRoleUser, HttpServletRequest request,
			HttpServletResponse response) {
		String retVal = bdapRoleUserService.updateRoleUser(bdapRoleUser).isEmpty() != true ? "수정되었습니다." : "실패하였습니다.";
		PrintWriter pw;
		try {
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("retVal", retVal);
			response.setCharacterEncoding("UTF-8");
			pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/getSchemaManageDbNmList.do")
	public void getSchemaManageDbNmList(HttpServletRequest request, HttpServletResponse response) {
		JSONObject jsonObj = new JSONObject();
		List<String> dbNmList = tblService.getDistinctSchemaNmList();
		JSONArray jsonArray = new JSONArray();
		if (!dbNmList.isEmpty()) {
			// for (BdapTbl tbl : dbNmList) {
			for (String tbl : dbNmList) {
				JSONObject jsonObj1 = new JSONObject();
				jsonObj1.put("dbNm", tbl);
				jsonArray.add(jsonObj1);
			}
		}
		jsonObj.put("rows", jsonArray);
		response.setCharacterEncoding("UTF-8");
		try {
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping("/getSchemaManageList.do")
	public void getSchemaManageList(HttpServletRequest request, HttpServletResponse response) {
		SearchVO searchVO = new SearchVO();
		searchVO.setSchemaNm(searchVO.nullTrim(request.getParameter("schemaNm")));
		searchVO.setTblNm(searchVO.nullTrim(request.getParameter("tblNm")));
		searchVO.setSchemaNm(searchVO.getSchemaNm().equals("ALL") ? "" : searchVO.getSchemaNm());
		JSONObject jsonObj = new JSONObject();
		List<BdapTbl> dbNmList = tblService.getSchemaWithTblList(searchVO);
		JSONArray jsonArray = new JSONArray();
		if (!dbNmList.isEmpty()) {
			for (BdapTbl tbl : dbNmList) {
				JSONObject jsonObj1 = new JSONObject();
				jsonObj1.put("id", tbl.getTblId());
				jsonObj1.put("schNm", tbl.getTblDbNm());
				jsonObj1.put("tblEngNm", tbl.getTblEngNM());
				jsonObj1.put("tblKorNm", tbl.getTblKorNm());
				jsonObj1.put("isManaged", tbl.getTblIsManaged());
				jsonObj1.put("isCheckNull", tbl.getTblIsChkNull());
				jsonObj1.put("isCehckRegex", tbl.getTblIsChkType());
				jsonArray.add(jsonObj1);
			}
		}
		jsonObj.put("rows", jsonArray);
		response.setCharacterEncoding("UTF-8");
		try {
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/popColumnByTblId.do", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getColumnByTblId(@RequestParam(value = "id") String tblId, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("getcolumninfo");
		mav.addObject("tblId", tblId);
		return mav;
	}

	@RequestMapping(value = "/getColumnByTblId.do", method = RequestMethod.GET)
	@ResponseBody
	public void getcolumninfo(@RequestParam(value = "id") String tblId, HttpServletRequest request,
			HttpServletResponse response) {

		BdapTbl bdapTbl = tblService.getBdapTblByTblId(tblId);
		List<BdapCol> bdapColList = new ArrayList<BdapCol>();
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		if (bdapTbl.getChild() != null && !bdapTbl.getChild().isEmpty()) {
			bdapColList.addAll(bdapTbl.getChild());
			for (BdapCol col : bdapColList) {
				JSONObject jsonObj1 = new JSONObject();
				jsonObj1.put("id", col.getColId());
				jsonObj1.put("colEngNm", col.getColEngNm());
				jsonObj1.put("colKorNm", col.getColKorNm());
				jsonObj1.put("dataType", col.getColDataType());
				jsonObj1.put("desc", col.getColDesc());
				jsonObj1.put("isEnc", col.getColIsEnc());
				jsonObj1.put("isChkNull", col.getColIsChkNull());
				jsonObj1.put("isChkType", col.getColIsChkType());
				jsonObj1.put("chkTypeFormat", col.getColRegex());
				jsonArray.add(jsonObj1);

			}
		}

		jsonObj.put("rows", jsonArray);
		response.setCharacterEncoding("UTF-8");
		try {
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/updateCellUserInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public String updateCellUserInfo(@RequestParam(value = "id") String id,
			@RequestParam(value = "cellName") String cellName, @RequestParam(value = "cellValue") String cellValue,
			HttpServletRequest request, HttpServletResponse response) {
		String retVal = bdapUserService.updateCellUserInfo(id, cellName, cellValue) != null ? "SUCCESS" : "FAIL";
		return retVal;
	}

	@RequestMapping(value = "/updateCellTblInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public String updateCellTblInfo(@RequestParam(value = "id") String id,
			@RequestParam(value = "cellName") String cellName, @RequestParam(value = "cellValue") String cellValue,
			HttpServletRequest request, HttpServletResponse response) {
		String retVal = tblService.updateCellTblInfo(id, cellName, cellValue) != null ? "SUCCESS" : "FAIL";
		return retVal;
	}

	@RequestMapping(value = "/updateCellColInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public String updateCellColInfo(@RequestParam(value = "id") String id,
			@RequestParam(value = "cellName") String cellName, @RequestParam(value = "cellValue") String cellValue,
			HttpServletRequest request, HttpServletResponse response) {
		String retVal = colService.updateCellColInfo(id, cellName, cellValue) != null ? "SUCCESS" : "FAIL";
		return retVal;
	}
	
	@RequestMapping("/uploadExcel.do")							
	public ModelAndView expirationDateModi(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("uploadExcel");
		return mav;
	}
	
	@RequestMapping("/importExcel.do")							
	public ModelAndView importExcel(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("importExcel");
		int result = 1;
		ExcelService excelService = new ExcelService(tblRepository, colRepository);
		
	    try{
	    	result = excelService.excelFileUpload(request);
	    } catch ( RuntimeException e){
	        e.printStackTrace();
	    }
		
	    mav.addObject("result", result);
		return mav;
	}
	
	
	
}
