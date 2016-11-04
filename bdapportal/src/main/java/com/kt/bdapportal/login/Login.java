package com.kt.bdapportal.login;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kt.bdapportal.common.util.NdapApiWrapper;
import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.common.util.auth.NdapAuthentication;
import com.kt.bdapportal.common.util.auth.NdapUser;
import com.kt.bdapportal.domain.BdapAcl;
import com.kt.bdapportal.domain.BdapRole;
import com.kt.bdapportal.domain.BdapRoleUser;
import com.kt.bdapportal.domain.BdapUser;
import com.kt.bdapportal.service.BdapAclService;
import com.kt.bdapportal.service.BdapRoleUserService;
import com.kt.bdapportal.service.BdapUserAclService;
import com.kt.bdapportal.service.BdapUserService;

import net.sf.json.JSONObject;

@Controller
public class Login {
	@Autowired
	private BdapUserService bdapUserService;
	@Autowired
	private BdapUserAclService bdapUserAclService;
	@Autowired
	private BdapRoleUserService bdapRoleUserService;
	@Autowired
	private BdapAclService bdapAclService;
	
	
	
	public enum RoleEnum {
        ROLE_ALL,ROLE_NOTICE_ADMIN
    }
	
	public enum AnalysisRole{
		ANALYSISROLE_ALL,NDAP, RSTUDIO, JUPYTER, SAS, TABLEAU, PMS
	}
	
	private NdapAuthentication ndapAuthentication;
	
	public Login(){
		this.ndapAuthentication = null;
	}
	
	@RequestMapping("/loginpage.do")
	public ModelAndView loginpage(HttpServletRequest request, HttpServletResponse response) {
				
		ModelAndView mav = new ModelAndView("login");
		
		return mav;
	}
	
	@RequestMapping("/login.do")
	public void loginProcess(HttpServletRequest request, HttpServletResponse response){
		try{
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("result", "1"); // 로그인 성공 status
			
			String userId = (String)request.getParameter("loginId");
			String userPassWord =  request.getParameter("loginPassword") == null ? "" : request.getParameter("loginPassword");
			String analysis = "";
			HttpSession session = request.getSession();
			try{
				this.ndapAuthentication = new NdapAuthentication(userId, userPassWord);
				
				// 인증키가 어떤 형식인지 알아야 할것 같은데?? 일단 NDAP인증키가 존재하면 내부 로그인 세션을 생성한다.
				if(this.ndapAuthentication != null && !this.ndapAuthentication.getAuthKey().equals("")){
					try{
						SearchVO searchVO = new SearchVO();
						searchVO.setUserId(searchVO.nullTrim(userId));
						
						BdapUser bdapUser = bdapUserService.getBdapUser(searchVO);
						
						// 회원 정보를 입력해야 한다.
						if(bdapUser==null){
							NdapApiWrapper ndapApiWrapper = NdapApiWrapper.getInstance();
							NdapUser ndapUser = ndapApiWrapper.userInfo(userId);
							
							bdapUser = new BdapUser();
							bdapUser.setUserInfo(ndapUser);
							
							bdapUserService.insert(bdapUser);
							
							//신규 회원의 기본 권한은 ETC로 한다.
							BdapRole bdapRole = new BdapRole();
							bdapRole.setRoleId("ETC");
							
							BdapRoleUser bdapRoleUser = new BdapRoleUser();
							bdapRoleUser.setRoleId(bdapRole);
							bdapRoleUser.setUserId(bdapUser);
							
							this.bdapRoleUserService.insert(bdapRoleUser);
						}
						
						session.setAttribute("bdapUser", bdapUser);
						
						// 사용자의 권한과 acl을 조회하여 세션에 담는다.
						List<String> bdapUserAclList = this.bdapUserAclService.aclListByUserId(bdapUser.getUserId());
						session.setAttribute("bdapUserAclList", bdapUserAclList);
						
						// ACL에 등록되어있는 전체 페이지를 조회한다. 모든 페이지가 ACL에 등록된게 아닌 리스트 페이지만 등록이 되어있으므로 해당 리스트로 ACL 체크 여부를 결정한다.
						List<BdapAcl> allAclList = this.bdapAclService.getAllAclList();
						session.setAttribute("allAclList", allAclList);
						
						BdapRoleUser bdapRoleUser = bdapRoleUserService.getRoleIdByUserId(bdapUser);
						session.setAttribute("bdapRoleUser", bdapRoleUser);
						
						String userRollId = bdapRoleUser.getRoleId().getRoleId();
						
						if(userRollId.contains("ADMIN") || userRollId.contains("ITO")){
							analysis =  AnalysisRole.ANALYSISROLE_ALL.toString();
						}
						
						session.setAttribute("ANALYSIS_ROLE", analysis);
					}catch(Exception e){
						e.printStackTrace();
						jsonObj.put("result", "-3"); // 내부 세션정보 획득 실패
					}
				}else{
					jsonObj.put("result", "-2"); // 비어있는 NDAP 인증 키
				}
			}catch(Exception e){
				e.printStackTrace();
 				jsonObj.put("result", "-1"); // NDAP 인증 실패
			}
			
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		session.invalidate();
		
		ModelAndView mav = new ModelAndView("login");
		return mav;
	}
}
