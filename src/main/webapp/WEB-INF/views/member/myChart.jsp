<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
.count-box{
background-color:white !important;
}

.choices>.form-control {
	width : 80px;
}
</style>



	<!-- 탭 네비게이션 -->
	<ul class="nav nav-tabs" id="myTab" role="tablist" style="margin-left:10px;">
	  <li class="nav-item">
	    <a class="nav-link active" id="tab1-tab" data-bs-toggle="tab" data-bs-target="#tab1" role="tab" aria-controls="tab1" aria-selected="true"> <i class="bi bi-bar-chart-line"> </i> 매출관리 </a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" id="tab2-tab" data-bs-toggle="tab" data-bs-target="#tab2" role="tab" aria-controls="tab2" aria-selected="false"><i class="bi bi-cash-stack"> </i> 판매내역</a>
	  </li>
	</ul>
	
	<!-- 탭내용 -->
	<!-- 쌓이는 바탕화면 -->
	<div style="background-color:#FFFFFF; border-radius:10px; margin : 20px 10px 10px 10px; padding:10px 10px 10px 10px;">
	<div class="tab-content" id="myTabContent">
		  <div class="tab-pane fade show active" id="tab1" role="tabpanel" aria-labelledby="tab1-tab">
		  <br>
		    	<input type="hidden" name="expertId" id="expertId" value="${memId }">
		    	<div style="display:flex;">
					<div  class="p-4 text-center bg-body-secondary hover-shadow rounded-2 border count-box" style="display:inline-block; font-align: center; width : 300px; height:140px; margin-bottom:20px; margin-right: 30px;">
						 <span>This Month </span><i style="color:purple; font-size:20px;" class="bi bi-piggy-bank cute-icon"></i>
						 <c:set value="${topMonth.totalSum }" var="topMonthTotalSum"/>
						 <c:if test="${empty topMonth.totalSum }">
							<c:set value="0" var="topMonthTotalSum"/>
						 </c:if>
						 <h2> <fmt:formatNumber value="${topMonthTotalSum}" pattern="#,###" />원</h2>
						 <span>지난달 대비 </span><span id="percentageCal" style="font-weight:bold; color:lightseagreen"></span>
					</div>
					<div class="p-4 text-center bg-body-secondary hover-shadow rounded-2 border count-box" style="display:inline-block; border : 1px solid black;  width : 300px; height:140px;  margin-right: 30px;">
						<span>Top Like </span> <i style="color:red; font-size:20px;" class="bi bi-heart-fill cute-icon"></i>
						 <c:set value="${topLike.eprodName }" var="topLikeEprodName"/>
						 <c:set value="${topLike.likeCount }" var="topLikeCount"/>
						 <c:if test="${empty topLike.eprodName }">
							<c:set value="내역이 없습니다." var="topLikeEprodName"/>
							<c:set value="0" var="topLikeCount"/>
						 </c:if>
<%-- 						<div style="height:30px; overflow:hidden; margin-top:10px;" data-tippy-content="${topLikeEprodName}"> --%>
						<div style="height:30px; overflow:hidden; margin-bottom:10px;">
							<c:if test="${topLike.eprodCateNum eq '템플릿'}">
								<a href="/coco/solution/templateDetail?eprodNum=${topLike.eprodNum }">
									<span style="font-weight: 600; font-size: 25px; display: inline-block; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; max-width: 100%;" data-bs-toggle="tooltip"
		                                    data-bs-placement="bottom" title="${topLikeEprodName}">${topLikeEprodName}</span>
								</a>
							</c:if>
							<c:if test="${topLike.eprodCateNum eq '멘토링'}">
								<a href="/coco/mentoring/mentoringDetail?eprodNum=${topLike.eprodNum }">
									<span style="font-weight: 600; font-size: 25px; display: inline-block; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; max-width: 100%;" data-bs-toggle="tooltip"
		                                    data-bs-placement="bottom" title="${topLikeEprodName}">${topLikeEprodName}</span>
								</a>
							</c:if>
							<c:if test="${empty topLike.eprodCateNum }">
									<span style="font-weight: 600; font-size: 25px; display: inline-block; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; max-width: 100%;" data-bs-toggle="tooltip"
		                                    data-bs-placement="bottom" title="${topLikeEprodName}">${topLikeEprodName}</span>
							</c:if>
<!-- 							<h4 style="display: inline-block; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; max-width: 100%;" data-bs-toggle="tooltip" -->
<%--                                     data-bs-placement="bottom" title="${topLikeEprodName}" >${topLikeEprodName}</h4> --%>
						</div>
							<h4>${topLikeCount}건</h4>
					</div>
					<div class="p-4 text-center bg-body-secondary hover-shadow rounded-2 border count-box" style="display:inline-block; border : 1px solid black;  width : 300px; height:140px; ">
						<span>Top Review </span> <i style="color:green; font-size:20px;" class="bi bi-card-checklist cute-icon"></i>
						<c:set value="${topReview.eprodName }" var="topReviewProdName"/>
						<c:set value="${topReview.reviewCount }" var="topReviewCount"/>
						<c:if test="${empty topReview.eprodName }">
							<c:set value="내역이 없습니다." var="topReviewProdName"/>
							<c:set value="0" var="topReviewCount"/>
						</c:if>
						<div style="height:30px; overflow:hidden; margin-bottom:10px;">
							<c:if test="${topReview.eprodCateNum eq '템플릿'}">
								<a href="/coco/solution/templateDetail?eprodNum=${topReview.eprodNum }">
									<span style="font-weight: 600; font-size: 25px; display: inline-block; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; max-width: 100%;" data-bs-toggle="tooltip"
		                                    data-bs-placement="bottom" title="${topReviewProdName}">${topReviewProdName}</span>
								</a>
							</c:if>
							<c:if test="${topReview.eprodCateNum eq '멘토링'}">
								<a href="/coco/mentoring/mentoringDetail?eprodNum=${topReview.eprodNum }">
									<span style="font-weight: 600; font-size: 25px; display: inline-block; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; max-width: 100%;" data-bs-toggle="tooltip"
		                                    data-bs-placement="bottom" title="${topReviewProdName}">${topReviewProdName}</span>
								</a>
							</c:if>
							<c:if test="${empty topReview.eprodCateNum }">
									<span style="font-weight: 600; font-size: 25px; display: inline-block; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; max-width: 100%;" data-bs-toggle="tooltip"
		                                    data-bs-placement="bottom" title="${topReviewProdName}">${topReviewProdName}</span>
							</c:if>
							
<!-- 							<h4 style="display: inline-block; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; max-width: 100%;" data-bs-toggle="tooltip" -->
<%--                                     data-bs-placement="bottom" title="${topReviewProdName}">${topReviewProdName}</h4> --%>
						</div>
							<h4>${topReviewCount}건</h4>
					</div>
				</div>
				
	            <div class="d-flex align-items-center mb-4">
	                <h6 class="me-3 text-body-secondary mb-0">
	                    	연도별 총 판매수익
	                </h6>
	                <span class="border-top d-block flex-grow-1"></span>
	                		<div  style="display:flex; align-items:center; margin-left:50px; margin-right:10px;">
		            			<i class="bi bi-calendar-week"></i>
							   	<span style="width:60px;">&nbsp;연도별&nbsp;</span>
							   	<select id="yearSelect" style="display:inline-block; width: 120px;" name="chYear" class="form-control form-control-sm" data-choices='{"searchEnabled":false, "allowHTML":true,"itemSelectText":""}'>
							  	    <option value="23" selected>2023</option>
							    	<option value="22">2022</option>
					   		     </select>
							    <span style="width : 20px"></span>
							   	<i class="bi bi-calendar-plus"></i> 
							   	<span style="width:80px;">&nbsp;연도추가&nbsp;</span>
							   	<select id="addYear"  style="display:inline-block; width: 120px;" name="chYear" class="form-control form-control-sm" data-choices='{"searchEnabled":false, "allowHTML":true,"itemSelectText":""}' >
							  	    <option value="23" selected>2023</option>
							    	<option value="22">2022</option>
					   		  	</select>
						   	</div>
	            </div>
					<div style="display:inline-block">
							<canvas id="myChart" width ="900" height ="200"></canvas>
					</div>
	           <div class="d-flex align-items-center mb-4">
	               <h6 class="me-3 text-body-secondary mb-0">
	                   	카테고리별 판매수익
	               </h6>
	               <span class="border-top d-block flex-grow-1"></span>
	               <div style="display:flex; align-items:center; margin-left:50px; margin-right:10px;">
	               		<i class="bi bi-calendar-week"></i>
						   	<span style="width:60px;">&nbsp;연도별&nbsp;</span>
					   		  <select id="cateYearSel" style="display:inline-block; width: 120px;" name="chYear" class="form-control form-control-sm" data-choices='{"searchEnabled":false, "allowHTML":true,"itemSelectText":""}'>
						  	    <option value="23" selected>2023</option>
						    	<option value="22">2022</option>
					   		  </select>
	               </div>
	           </div>
					<!-- 카테고리별 차트 -->
					<div style="display:inline-block">
						<div style="display:flex; align-items:center;">
						
					    </div>
						<canvas id="myChartCate" width ="900" height ="200"></canvas>
					</div>
					<!-- 카테고리별 차트 끝 -->
		  </div>
		  <!-- 탭2시작 -->
		  <div class="tab-pane fade" id="tab2" role="tabpanel" aria-labelledby="tab2-tab">
			<table id="datatable" class="table mt-0 table-striped table-card table-nowrap">
				<thead class="text-uppercase small text-body-secondary">
					<tr>
						<th>번호</th>
						<th>상품명</th>
						<th>판매일시</th>
						<th>판매금액</th>
						<th>진행사항</th>
						<th>연락</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list }">
							<tr>
								<td colspan="6">조회하신 판매내역이 존재하지 않습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list }" var="sellList" varStatus="stat">
								<tr>
									<td>${list.size() - stat.index } </td>
									<td>
										<c:if test="${sellList.eprodCateNum eq '템플릿'}">
											<a href="/coco/solution/templateDetail?eprodNum=${sellList.eprodNum }">${sellList.eprodName }</a>
										</c:if>
										<c:if test="${sellList.eprodCateNum eq '멘토링'}">
											<a href="/coco/mentoring/mentoringDetail?eprodNum=${sellList.eprodNum }">${sellList.eprodName }</a>
										</c:if>
										<c:if test="${empty sellList.eprodCateNum }">
											${sellList.eprodName }
										</c:if>
									</td>
									<td><fmt:formatDate value="${sellList.epayDate }" pattern="yyyy-MM-dd hh:mm" /></td>
									
									<td>
										<fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${sellList.amount }" /></li>
									</td>
									<td>${sellList.progressCode }</td>
									<td><i class="bi bi-chat-dots" style="font-size:20px; cursor:pointer;"></i></td>
								</tr> 
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div> <!-- 탭 끝 -->
	</div>
 
<script>
$(function() {
	  var expertId = "";
	  var chYear = ""; // chYear 변수 이동
	  
	  let percentageChange = ((${topMonth.totalSum } - ${lastMonth.totalSum }) / ${lastMonth.totalSum }) * 100;
	  $("#percentageCal").text(percentageChange.toFixed(2) + "%");
// 	  $("#percentageCal").text(percentageChange.toFixed(2) + "% up");
			
	 
// 	  function percCalculate() {
// 		  ((${topMonth.totalSum } - ${lastMonth.totalSum }) / ${lastMonth.totalSum }) x 100 
// 	  };
	  
	// 페이지 로딩 시 바로 띄우기 
		
		// 연도별 총수익체크 테이블 
	 	expertId = $("#expertId").val();
	 	chYear = $("#yearSelect").val(); // chYear 변수 이동
	 	console.log("이거 왜 안됮는거야 expertId : ", expertId, ", chYear, : " , chYear);
		var monthList = new Array();
		var sumList = new Array();
		
		  $.ajax({
			    type: "post",
			    contentType: "application/json",
			    url: "/coco/chartYearAjax",
			    data: JSON.stringify({
			      'expertId': expertId,
			      'chYear': chYear
			    }),
			    success: function(res) {
			      console.log("전송성공, 년도별 자료 확인 ㅋ >> ", res);
			      var data = JSON.parse(res); // javascript 배열로 변환
			      
			      for(var i =0; i< data.length; i++) {
			    	  monthList.push(data[i].chMonth);
			    	  sumList.push(data[i].chMonthSum);
			      }
				  
			      // month 순서대로 재정렬 - slice(배열복사)
			      let sortedMonthList = monthList.slice().sort((a, b) => a - b);
			      let sortedSumList = [];

			      for (let j = 0; j < sortedMonthList.length; j++) { 	 
			          let index = monthList.indexOf(sortedMonthList[j]);
			          sortedSumList.push(sumList[index]);
			      }

				  myChart.data.labels = sortedMonthList; // 달
				  myChart.data.datasets[0].data = sortedSumList; // 금액
				  myChart.update();
			    } // success
			    
		  }); // 연도별 총수익 ajax 끝
		  
		  
		  
		  // 카테고리별
		 	var chYearCate = $("#cateYearSel").val(); // chYear 변수 이동
		 	console.log("이거 왜 안됮는거야 expertId : ", expertId, ", chYear, : " , chYear);
			var CateMonthList = new Array();
			var CateSumList = new Array();
			
			  // 템플릿만 뽑는 용도
			  $.ajax({
				    type: "post",
				    contentType: "application/json",
				    url: "/coco/chartCateAjax",
				    data: JSON.stringify({
				      'expertId': expertId,
				      'chYear': chYearCate,
				      'chCateName' : '템플릿'
				    }),
				    success: function(res) {
				      console.log("전송성공, 카테고리 !!!년도별 자료 확인 ㅋ >> ", res);
				      var data = JSON.parse(res); // javascript 배열로 변환
				      
				      for(var i =0; i< data.length; i++) {
				    	  CateMonthList.push(data[i].chMonth);
				    	  CateSumList.push(data[i].chMonthSum);
				      }
					  
				      // month 순서대로 재정렬 - slice(배열복사)
				      let sortedMonthList = CateMonthList.slice().sort((a, b) => a - b);
				      let sortedSumList = [];

				      for (let j = 0; j < sortedMonthList.length; j++) { 	 
				          let index = CateMonthList.indexOf(sortedMonthList[j]);
				          sortedSumList.push(CateSumList[index]);
				      }
				      
// 				      var YearlyMonth = ['1','2','3','4','5','6','7','8','9','10','11','12'];

				      console.log("템플릿 금액 확인 >> ", sortedSumList);
				      myChartCate.data.labels = sortedMonthList; // 달
				      myChartCate.data.datasets[0].data = sortedSumList; // 금액
				      myChartCate.update();
				    } // success
			  }); // 연도별 총수익 ajax 끝
			  
			  
			  
		      var CateMonthListMento = new Array();
			  var CateSumListMento = new Array();
				
			  // 멘토링만 뽑는 용도
			  $.ajax({
				    type: "post",
				    contentType: "application/json",
				    url: "/coco/chartCateAjax",
				    data: JSON.stringify({
				      'expertId': expertId,
				      'chYear': chYearCate,
				      'chCateName' : '멘토링'
				    }),
				    success: function(res) {
				      console.log("전송성공, 카테고리 멘토링만 !!!년도별 자료 확인  >> ", res);
				      var data = JSON.parse(res); // javascript 배열로 변환
				      
				      for(var i =0; i< data.length; i++) {
				    	  CateMonthListMento.push(data[i].chMonth);
				    	  CateSumListMento.push(data[i].chMonthSum);
				      }
					  
				      // month 순서대로 재정렬 - slice(배열복사)
				      let sortedMonthList = CateMonthListMento.slice().sort((a, b) => a - b);
				      let sortedSumList = [];

				      for (let j = 0; j < sortedMonthList.length; j++) { 	 
				          let index = CateMonthListMento.indexOf(sortedMonthList[j]);
				          sortedSumList.push(CateSumListMento[index]);
				      }
				      
				      console.log("멘토링 금액 확인 >> ", sortedSumList);
				   	  // 새로운 데이터셋 추가
				      myChartCate.data.datasets.push({
				          label: '멘토링', // 선택한 년도 라벨 넣기
				          data: sortedSumList,
			              backgroundColor: [
			            	"rgb(0, 128, 255, 0.5)",
			            	"rgb(0, 128, 255, 0.5)"
			              ],
				          borderColor : [
				                'rgba(153, 102, 255, 0.2)',
				                'rgba(255, 159, 64, 0.2)'
				            ]
				      });

				      // 그래프 업데이트
				      myChartCate.update();

				      
				    } // success
			  }); // 연도별 총수익 ajax 끝
		  
	
	  

	// 연도별 선택시 변경
	const yearSelect = $("#yearSelect");

	// select 선택시 year 값 변경 
	yearSelect.on("change", function() {
		  var monthList = new Array();
		  var sumList = new Array();
		  expertId = $("#expertId").val();
		  chYear = yearSelect.val(); // chYear 변수 이동
		  
		  console.log("select 작동확인 가봅니다 ", $(this).val());
		  
		  $.ajax({
		    type: "post",
		    contentType: "application/json",
		    url: "/coco/chartYearAjax",
		    data: JSON.stringify({
		      'expertId': expertId,
		      'chYear': chYear
		    }),
		    success: function(res) {
		    	
			      console.log("전송성공, 년도별 자료 확인 ㅋ >> ", res);
			      var data = JSON.parse(res); // javascript 배열로 변환
			      
			      for(var i =0; i< data.length; i++) {
			    	  monthList.push(data[i].chMonth);
			    	  sumList.push(data[i].chMonthSum);
			      }
				  
			      // month 순서대로 재정렬 - slice(배열복사)
			      let sortedMonthList = monthList.slice().sort((a, b) => a - b);
			      let sortedSumList = [];
	
			      for (let j = 0; j < sortedMonthList.length; j++) { 	 
			          let index = monthList.indexOf(sortedMonthList[j]);
			          sortedSumList.push(sumList[index]);
			      }
	
				  myChart.data.labels = sortedMonthList; // 달
				  myChart.data.datasets[0].data = sortedSumList; // 금액
				  
				  myChart.update();
			  
		    } // success
		  });
	  
	}); // yearselect 끝 

	
	
	// addYear 시작
	const addYear = $("#addYear");

	// select 선택시 year 값 변경 
	addYear.on("change", function() {
		  var monthList = new Array();
		  var sumList = new Array();
		  expertId = $("#expertId").val();
		  chYear = addYear.val(); // chYear 변수 이동
		  
		  console.log("select 작동확인 가봅니다 ", $(this).val());
		  
		  $.ajax({
		    type: "post",
		    contentType: "application/json",
		    url: "/coco/chartYearAjax",
		    data: JSON.stringify({
		      'expertId': expertId,
		      'chYear': chYear
		    }),
		    success: function(res) {
		    	
			      console.log("전송성공, 년도별 자료 확인 ㅋ >> ", res);
			      var data = JSON.parse(res); // javascript 배열로 변환
			      
			      for(var i =0; i< data.length; i++) {
			    	  monthList.push(data[i].chMonth);
			    	  sumList.push(data[i].chMonthSum);
			      }
				  
			      // month 순서대로 재정렬 - slice(배열복사)
			      let sortedMonthList = monthList.slice().sort((a, b) => a - b);
			      let sortedSumList = [];
	
			      for (let j = 0; j < sortedMonthList.length; j++) { 	 
			          let index = monthList.indexOf(sortedMonthList[j]);
			          sortedSumList.push(sumList[index]);
			      }
			      
			      
			   	  // 새로운 데이터셋 추가
			      myChart.data.datasets.push({
			          label: '20' + chYear + '년', // 선택한 년도 라벨 넣기
			          data: sortedSumList 
			      });

			      // 그래프 업데이트
			      myChart.update();

	
// 				  myChart.data.labels = sortedMonthList; // 달
// 				  myChart.data.datasets[0].data = sortedSumList; // 금액
// 				  myChart.update();
			  
		    } // success
		  });
	  
	}); // yearselect 끝 
	
	
	
	
	// 카테고리별 - 연도-----------------------------------------------------------------------------------
	
	// 연도별 선택시 변경
	const cateYearSel = $("#cateYearSel");

	// select 선택시 year 값 변경 
	cateYearSel.on("change", function() {
		
		
		// 카테고리별
	 	var chYearCate = $("#cateYearSel").val(); // chYear 변수 이동
		var CateMonthList = new Array();
		var CateSumList = new Array();
		
		  // 템플릿만 뽑는 용도
		  $.ajax({
			    type: "post",
			    contentType: "application/json",
			    url: "/coco/chartCateAjax",
			    data: JSON.stringify({
			      'expertId': expertId,
			      'chYear': chYearCate,
			      'chCateName' : '템플릿'
			    }),
			    success: function(res) {
			      console.log("전송성공, 카테고리 !!!년도별 자료 확인 ㅋ >> ", res);
			      var data = JSON.parse(res); // javascript 배열로 변환
			      
			      for(var i =0; i< data.length; i++) {
			    	  CateMonthList.push(data[i].chMonth);
			    	  CateSumList.push(data[i].chMonthSum);
			      }
				  
			      // month 순서대로 재정렬 - slice(배열복사)
			      let sortedMonthList = CateMonthList.slice().sort((a, b) => a - b);
			      let sortedSumList = [];

			      for (let j = 0; j < sortedMonthList.length; j++) { 	 
			          let index = CateMonthList.indexOf(sortedMonthList[j]);
			          sortedSumList.push(CateSumList[index]);
			      }
			      
//				  var YearlyMonth = ['1','2','3','4','5','6','7','8','9','10','11','12'];

			      console.log("템플릿 금액 확인 >> ", sortedSumList);
			      myChartCate.data.labels = sortedMonthList; // 달
			      myChartCate.data.datasets[0].data = sortedSumList; // 금액
			      myChartCate.update();
			    } // success
		  }); // 연도별 총수익 ajax 끝
		  
		  
		  
	      var CateMonthListMento = new Array();
		  var CateSumListMento = new Array();
			
		  // 멘토링만 뽑는 용도
		  $.ajax({
			    type: "post",
			    contentType: "application/json",
			    url: "/coco/chartCateAjax",
			    data: JSON.stringify({
			      'expertId': expertId,
			      'chYear': chYearCate,
			      'chCateName' : '멘토링'
			    }),
			    success: function(res) {
			      console.log("전송성공, 카테고리 멘토링만 !!!년도별 자료 확인  >> ", res);
			      var data = JSON.parse(res); // javascript 배열로 변환
			      
			      for(var i =0; i< data.length; i++) {
			    	  CateMonthListMento.push(data[i].chMonth);
			    	  CateSumListMento.push(data[i].chMonthSum);
			      }
				  
			      // month 순서대로 재정렬 - slice(배열복사)
			      let sortedMonthList = CateMonthListMento.slice().sort((a, b) => a - b);
			      let sortedSumList = [];

			      for (let j = 0; j < sortedMonthList.length; j++) { 	 
			          let index = CateMonthListMento.indexOf(sortedMonthList[j]);
			          sortedSumList.push(CateSumListMento[index]);
			      }
			      
			      console.log("멘토링 금액 확인 >> ", sortedSumList);
			      
			      
			      myChartCate.data.datasets[1].data = sortedSumList; // 금액
			      myChartCate.update();
			      
// 				  myChartCate
// 			   	  // 새로운 데이터셋 추가
// 			      myChartCate.data.datasets.push({
// 			          label: '멘토링', // 선택한 년도 라벨 넣기
// 			          data: sortedSumList
// 			      });

// 			      // 그래프 업데이트
// 			      myChartCate.update();

			    } // success
		  }); // 연도별 총수익 ajax 끝
		  
	  
	}); // yearselect 끝 

	
	

	
	//-----------------------------------------------------차트--------------------------------------------
	// 차트 
	const ctx = document.getElementById('myChart').getContext('2d');
	const myChart = new Chart(ctx, {
	    type: 'bar', // 차트 종류, bar, bubble, daughnut, line...
	    data: {	
	        labels: ['1', '2', '3', '4', '5', '6', '7'], // 축제목
	        datasets: [{													// 데이터, 꾸밈요소
	            label: '# 2023',
	            data: [120000, 198000, 38000, 52000, 28120, 38000],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ]
	        }]
	    },
	    options: {				// 차트 모양 꾸밀 수 있음
	        scales: {
	            y: {
	                beginAtZero: true,
	                suggestedMax : 1000000 // 더미데이터 넣으면 값 조정하기
	            }
	        }
	    }
	}); // 차트끝
	
	
	const ctxCate = document.getElementById('myChartCate').getContext('2d');
	const myChartCate = new Chart(ctxCate, {
	    type: 'line', // 차트 종류, bar, bubble, daughnut, line...
	    data: {	
	        labels: ['1', '2', '3', '4', '5', '6', '7'], // 축제목
	        datasets: [{													// 데이터, 꾸밈요소
	            label: '템플릿',
	            data: [120000, 198000, 38000, 52000, 28120, 38000],
	            backgroundColor: [
	            	"rgb(0, 0, 255, 0.5)",
	            	"rgb(0, 0, 255, 0.5)", 
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)'
	            ],
	            borderColor : [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	            ]
	            
	        
	        }]
	    }, // data 
	    options: {				// 차트 모양 꾸밀 수 있음
	        scales: {
	            y: {
	                beginAtZero: true,
	                suggestedMax : 1000000 // 더미데이터 넣으면 값 조정하기
	            }
	        }
	    }
	}); // 차트끝
	//-----------------------------------------------------차트--------------------------------------------
	
	
	
	


});


// 데이터 테이블스
	document.addEventListener("DOMContentLoaded", function() {
		// Datatables Responsive
		$("#datatable").DataTable({
//			"filter":false,
           "length":true,			
           "searching": false, 	  // 검색 끄기
           "lengthChange": false, // entity 끄기
           "bInfo" : false,
           asSorting : [],
           order : [[ 0, "desc"]]
		});
	});

</script>