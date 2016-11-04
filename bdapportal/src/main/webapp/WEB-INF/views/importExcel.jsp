<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
int result = (Integer)request.getAttribute("result");
%> 
<script type="text/javascript">
var result = '<%=result%>'

if(result==1){
	alert("업로드 하신 엑셀파일의 내용이 정상 반영 되었습니다.");
}else{
	alert("엑셀 임포트작업 진행 중 오류가 발생했습니다. 오류코드 : " + result);
} 

self.close();
</script>
