package com.kt.bdapportal.login;

import java.io.PrintWriter;

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

import com.kt.bdapportal.common.util.SearchVO;
import com.kt.bdapportal.common.util.auth.NdapAuthentication;
import com.kt.bdapportal.domain.BdapUser;
import com.kt.bdapportal.domain.MgmtNodeStat;
import com.kt.bdapportal.service.BdapUserService;

import net.sf.json.JSONObject;

@Controller
public class Login {
	@Autowired
	private BdapUserService bdapUserService;
	
	public enum AclPageEnum {
        ACL_ALL,SCHEMA_SELECT_PAGE, LOADSTATUS_SELECT_PAGE,DAILYLOADSTATUS_SELECT_PAGE
        ,TABLE_MANAGEMENT_PAGE
        ,ENCRYPTION_SELECT_PAGE,DECRYPTION_SELECT_PAGE, ENCRYPTION_PROCESS_SELECT_PAGE,DECRYPTION_PROCESS_SELECT_PAGE
        ,NOTICE_PAGE,QNA_PAGE,REFERENCE_PAGE,LINKAGE_PAGE,DEVREQ_PAGE
        ,USER_QUERY_MANAGEMENT_PAGE,STATISTICS_PAGE,SETUP_PAGE
        
    }
	
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
			
			String userId = (String)request.getParameter("loginId");
			String userPassWord =  request.getParameter("loginPassword") == null ? "" : request.getParameter("loginPassword");
			
			String role = "";
			String acl = "";
			String analysis = "";
			
			HttpSession session = request.getSession();
			String userIp = request.getRemoteAddr();
			
			try{
				this.ndapAuthentication = new NdapAuthentication(userId, userPassWord);
				
				// 인증키가 어떤 형식인지 알아야 할것 같은데?? 일단 NDAP인증키가 존재하면 내부 로그인 세션을 생성한다.
				if(this.ndapAuthentication != null && !this.ndapAuthentication.getAuthKey().equals("")){
					try{
						SearchVO searchVO = new SearchVO();
						searchVO.setUserId(searchVO.nullTrim(userId));
						
						BdapUser bdapUser = bdapUserService.getBdapUser(searchVO);
						// 아니 왜 세션에 vo를 안담아놓고 .... 
						session.setAttribute("USER_ID", bdapUser.getUserId());
						session.setAttribute("USER_NM", bdapUser.getUserNm());
						session.setAttribute("USER_MAIL", bdapUser.getUserEmail());
						session.setAttribute("USER_IP", userIp);
						
						// 사용자 아이디가 admin이 아니라 권한으로 체크해야지....
						if(userId.equals("admin")){
							acl = AclPageEnum.ACL_ALL.toString();
							role = RoleEnum.ROLE_ALL.toString();
							session.setAttribute("USER_ACL", acl);
							session.setAttribute("USER_ROLE", role);
						}else{
							/*role = RoleEnum.ROLE_ALL.toString();*/
							acl = AclPageEnum.SCHEMA_SELECT_PAGE.toString()+","
							+AclPageEnum.LOADSTATUS_SELECT_PAGE.toString()+","
							+AclPageEnum.DAILYLOADSTATUS_SELECT_PAGE.toString()
							+AclPageEnum.NOTICE_PAGE.toString()+","
							+AclPageEnum.REFERENCE_PAGE.toString()+","
							+AclPageEnum.LINKAGE_PAGE.toString()+","
							+AclPageEnum.DEVREQ_PAGE.toString()+","
							+AclPageEnum.QNA_PAGE.toString();
							//role = RoleEnum.ROLE_NOTICE_ADMIN.toString();
							session.setAttribute("USER_ACL", acl);
							session.setAttribute("USER_ROLE", role);
						}
						
						analysis = AnalysisRole.NDAP.toString()+","
								+AnalysisRole.JUPYTER.toString()+","
								+ AnalysisRole.PMS.toString();
						session.setAttribute("ANALYSIS_ROLE", analysis);
					}catch(Exception e){
						jsonObj.put("result", "-3"); // 내부 세션정보 획득 실패
					}
				}else{
					jsonObj.put("result", "-2"); // 비어있는 NDAP 인증 키
				}
			}catch(Exception e){
 				jsonObj.put("result", "-1"); // NDAP 인증 실패
			}
			
			jsonObj.put("result", "1"); // 로그인 성공
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();
			pw.print(jsonObj);
			pw.flush();
			pw.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
