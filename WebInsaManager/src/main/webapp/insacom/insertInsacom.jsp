<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>
<section>

<div class="m-5">
	<div class="mb-3">
		<h4>인사 공통 코드 입력</h4>
	</div>
	<div class="container">
		<div class="justify-content-center">
			<div class="form-control-sm col-md-3">
				<form action="insertInsacom.do" method="post" 
						name="inputForm" onsubmit="return checkInputForm()">
					<table class="table table-hover table-sm">
						<tr>
							<td align="center">구분</td>
							<td><input type="text" name="gubun" 
									class="form-control form-control-sm"></td>
						</tr>
						<tr>
							<td align="center">코드</td>
							<td><input type="text" name="code"
									class="form-control form-control-sm"></td>
						</tr>
						<tr>
							<td align="center">이름</td>
							<td><input type="text" name="name" 
									class="form-control form-control-sm"></td>
						</tr>
						<tr>
							<td align="center">설명</td>
							<td><input type="text" name="note" 
									class="form-control form-control-sm"></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="submit" value="코드 등록" 
										class="btn btn-primary btn-sm">				  
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>

</section>
<%@ include file="../bottom.jsp" %>