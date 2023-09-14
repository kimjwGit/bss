<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- 초과근무 등록할때 뜨는 모달화면  -->

<style>
.form-control {
	width: 100%;
}

</style>


<form:form modelAttribute="attendVO" action="${pageContext.request.contextPath }/mypage/overTimeInsert.do" method="post" id="overInsert">
<tr>
	<th>번호</th>
	<td><form:input readonly="true" class="form-control" type="number" path="atteNo" id="atteNo" />
		<form:errors class="error" path="atteNo" /></td>
</tr>
<tr>
	<th>이름</th>
	<td><form:input readonly="true" class="form-control" type="text" path="empName" />
		<form:errors class="error" path="empName" /></td>
</tr>
<tr>
	<th>사번</th>
	<td><form:input readonly="true" class="form-control" type="text" path="empCd" />
		<form:errors class="error" path="empCd" /></td>
</tr>
<tr>
	<th>부서</th>
	<td><form:input readonly="true" class="form-control" type="text" path="depName" />
		<form:errors class="error" path="depName" /></td>
</tr>
<tr>
	<th>출근시간</th>
	<td><form:input readonly="true"  class="form-control" type="datetime-local" path="atteStime" />
		<form:errors class="error" path="atteStime" /></td>
</tr>
<tr>
	<th>퇴근시간</th>
	<td><form:input readonly="true"  class="form-control" type="datetime-local" path="atteEnd" />
		<form:errors class="error" path="atteEnd" /></td>
</tr>
<tr>
	<th>출근일</th>
	<td><form:input readonly="true"  class="form-control" type="date"  path="atteDate" />
		<form:errors class="error" path="atteDate" /></td>
</tr>
	<c:choose>
        <c:when test="${not empty attendVO.atteDate}">
            <c:set var="fixedStartTime" value="${attendVO.atteDate}T18:00" />
            <c:set var="fixedEndTime" value="${attendVO.atteDate}T19:00" />
        </c:when>
        <c:otherwise>
            <c:set var="fixedStartTime" value="" />
            <c:set var="fixedEndTime" value="" />
        </c:otherwise>
    </c:choose>

    <tr>
        <th>초과근무 시작시간</th>
        <td>
            <form:input class="form-control" type="datetime-local" path="overStart" value="${fixedStartTime}" />
            <form:errors class="error" path="overStart" />
        </td>
    </tr>
    <tr>
        <th>초과근무 종료시간</th>
        <td>
            <form:input class="form-control" type="datetime-local" path="overEnd" value="${fixedEndTime}" />
            <form:errors class="error" path="overEnd" />
        </td>
    </tr>
	<tr>
		<th>초과근무 내용</th>
		<td><form:textarea class="form-control" path="overCont"></form:textarea>
			<form:errors class="error" path="overCont" /></td>
	</tr>
	<button type="button" class="btn btn-primary" id="over" >신청하기</button>
	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
</form:form>

<script>
//폼이 제출될 때의 이벤트 핸들러
$("#over").on('click', function (e) {
    e.preventDefault(); // 기본 폼 제출 동작을 막음
    
    var successMessage = "<%= request.getAttribute("message") %>";
    if (successMessage) {
       Swal.fire({
          title: '초과근무 등록이 완료되었습니다.',        
          icon: 'success',
          timer:50000
       }).then(function() {
          $('#overInsert').submit();
       });
    };
});
</script>
