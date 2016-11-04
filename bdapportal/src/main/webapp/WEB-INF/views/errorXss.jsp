<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script type="text/javascript">
alert("cross site scripting이 감지 되었습니다. 현재 세션을 무효화 하고 로그인 페이지로 이동합니다.");
document.location.href = '<%=request.getContextPath()%>/logout.do';
</script>
