<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<title>알바고</title>
<!--모바일화면 width값 잡아줌-->
<meta name="viewport"
	content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=1.0; user-scalable=no;" />
<!--/모바일화면 width값 잡아줌-->
<!--  공통 외부 CSS -->
<link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="/dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="/dist/css/skins/_all-skins.min.css">
<link rel="stylesheet" href="/plugins/iCheck/flat/blue.css">
<link rel="stylesheet" href="/plugins/morris/morris.css">
<link rel="stylesheet"
	href="/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<link rel="stylesheet"
	href="/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<link rel="stylesheet" href="/css/jquery-ui.css">
<link rel="stylesheet" href="/css/header_style.css" />
<link rel="stylesheet" href="/css/footer.css" />
<link rel="shortcut icon" href="/img/favicon.ico">
<!-- 공통	JS -->
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/js/jquery-ui.js"></script>
<script src="/js/AdminLTE/app.js" type="text/javascript"></script>
<script src="/js/common.js" type="text/javascript"></script>
<script src="/assets/jquery.bxslider.min.js"></script>
<script src="/fusioncharts/js/fusioncharts.js"></script>
<!-- Angular -->
<script src="/resources/angular/angular.js"></script>
<script>
	var result = getCookie('popup0520');
	if (location.origin.indexOf('http://www.mycrowding') == 0) {
		location.href = 'https://www.mycrowding.co.kr';
	} else if (result != 'end') {
		window
				.open(
						"/popup.html",
						"리뉴얼오픈",
						"width=450,height=552,menubar=no, location=no, toolbar=no, status=no, resizable=no, channelmode=no");
	}

	function getCookie(name) {
		var cookieName = name + "=";
		var x = 0;
		while (x <= document.cookie.length) {
			var y = (x + cookieName.length);
			if (document.cookie.substring(x, y) == cookieName) {
				if ((lastChrCookie = document.cookie.indexOf(";", y)) == -1)
					lastChrCookie = document.cookie.length;
				return decodeURI(document.cookie.substring(y, lastChrCookie));
			}
			x = document.cookie.indexOf(" ", x) + 1;
			if (x == 0)
				break;
		}
		return "";
	}

	String.prototype.numberToHangul = function() {
		var dan1 = Array('', '만 ', '억 ', '조 ', '경 ', '해 ', '시 ', '양 ', '구 ',
				'간 ', '정 ');
		var dan2 = Array('', '십', '백', '천');
		var han = Array('', '일', '이', '삼', '사', '오', '육', '칠', '팔', '구');
		var str = this.toString();
		var temp, result = '', chk;

		for (var i = str.length - 1, i2 = 0; i >= 0; i--, i2++) {
			temp = parseInt(str.charAt(i));
			chk = ((i2 % 4) == 0) ? i2 / 4 : 0;
			result = ((temp == 1 && i2 > 0 && chk == 0) ? '' : han[temp])
					+ ((temp == 0) ? '' : dan2[i2 % 4]) + dan1[chk] + result;
		}
		return result;
	}
</script>
<!--Custom-->
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/css/skin_color_main.css" />


<!--[if lt IE 9]>
    <link rel="stylesheet" href="css/ie8.css"/>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<!--스크립트-->
<script>
	(function(d, s, id) {

		$.ajax({
			method : "GET",
			url : '/myinfo',
			success : function(data) {
				$("#myinfo").html(data);
			},
			dataType : "html"
		});

		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.6";
		fjs.parentNode.insertBefore(js, fjs);

	}(document, 'script', 'facebook-jssdk'));

	function letter() {
		$.ajax({
			method : "get",
			url : '/newsletter/subscribe',
			data : {
				email : document.getElementById('email').value
			},
			success : function(data) {
				alert(document.getElementById('email').value
						+ " 계정으로 소식지 신청이 완료 되었습니다.");
			},
			error : function(data) {
				alert("소식지 신청이 실패했습니다.");
			}
		});
	}
	function openCalc() {
		window.open(location.origin + "/calc.html", "수익률계산기",
				"width=760,height=400");
	};
</script>
<script type="text/javascript">
	var myapp = angular.module("main", []);
	myapp.controller(
			"indexController",
			[
					'$scope',
					'$http',
					function($scope, $http) {
						var Status = 601;

						//기본 통계
						$http.get("/funding_summary").success(function(data) {
							$scope.summary = data;
						});

						//모집펀드
						$scope.tab = 0;
						// 탭 세팅 상품
						$scope.setTab = function(tabId) {
							switch (tabId) {
							case 0:			Status = 601;
								break;
							case 1:			Status = 702;
								break;
							case 2:			Status = 999;
								break;
							default:			Status = 601;
								break;
							}
							$http.get(
									"/open_funding?i_stepStatus=" + Status
											+ "&start=1&limit=12").success(
									function(data) {
										$scope.funding = data.items;
										$scope.tab = tabId;
									});
						};
						$scope.istab = function(tabId) {
							return $scope.tab === tabId;
						};
						//탭세팅 게시판

						$scope.tab1 = 0;
						$scope.setTab1 = function(tabId) {
							var boardUrl = "";
							switch (tabId) {
							case 0:
								boardUrl = "/bbs/BBSMSTR_000000000142/5/";
								break;
							case 1:
								boardUrl = "/bbs/BBSMSTR_000000000189/5/";
								break;
							case 2:
								boardUrl = "/bbs/BBSMSTR_000000000143/8/";
								break;
							default:
								boardUrl = "/bbs/BBSMSTR_000000000142/5/";
								break;
							}
							$http.get(boardUrl).success(function(data) {
								$scope.boards = data.bbsList;
								$scope.tab1 = tabId;
							});
						};
						$scope.istab1 = function(tabId) {
							return $scope.tab1 === tabId;
						};

						//초기화
						$scope.setTab(0);
						$scope.setTab1(0);

						//약관들
						$http.get("/terms").success(function(data) {
							$scope.terms = data.items;
						});

						//자주하는질문 토글
						$(document).on('click', '.queschen a', function(e) {
							console.log("out");
							e.preventDefault();
							$(this).siblings().slideToggle("slow");
						});

					} ]).directive('myRepeatDirective', function() {
		return function(scope, element, attrs) {
			if (scope.$last && scope.totalItems > 3) {
				$('.fund-slide').bxSlider({
					slideWidth : 350,
					minSlides : 1,
					maxSlides : 3,
					slideMargin : 30
				});

			}
		};
	});
</script>
</head>
<body ng-app="main" ng-controller="indexController">
	<!-- 페이스북  -->
	<div id="fb-root"></div>
	<!--헤더시작-->
	<%@ include file="header.jsp"%>
	<!--헤더종료-->
	<!--퀵배너시작-->
	<div class="right-banner-wrap quick-banner-wrap">
		<ul class="right-banner">
			<li class="no_border">
				<div class="btn-wrap">
					<a href="/product#0" class="btn_invest">투자하기</a>
				</div>
			</li>
			<li class="no_border">
				<div class="btn-wrap">
					<a href="/go?menuId=2020210" class="btn_invest">대출하기</a>
				</div>
			</li>
			<li class="no_border">
				<div class="btn-wrap">
					<a href="" class="btn_invest" title="수익률을 계산하고 싶으시다면 클릭하세요!"
						onclick="openCalc()">수익률 계산기</a>
				</div>
			</li>

			<li class="no_border">
				<div class="btn-wrap">
					<a href="#" class="btn_invest">Funding story</a>
				</div> <span class="dec"><a href="/product#0">모집중인 상품</a></span> <span
				class="dec"><a href="/product#1">상환중인 상품</a></span> <span
				class="dec"><a href="/product#2">종료된 상품</a></span>
			</li>

		</ul>
	</div>

	<!--퀵배너종료-->
	<!--본문시작-->
	<div class="body main_index">
		<div class="section section1">
			<div class="container-wrap">
				<div class="main_slider_wrap">
					<ul class="main_slider">
						<li>
							<div class="sd_item">
								<h1 class="slide_title01">
									크라우드가 만드는 <br /> 새로운 세상
								</h1>
								<h3>
									크라우드펀딩의 대중화를 통한 자본의 선순환, <br /> 이것이 바로 마이크라우딩의 미래와 가치입니다.
								</h3>
								<!-- <a href="#" class="btn_main company">마이크라우딩 알아보기</a> -->
							</div>
						</li>
						<li>
							<div class="sd_item">
								<h1 class="slide_title02">마이크라우딩은</h1>
								<h3 class="text02">
									자금이 필요한 사람과 <br /> 투자수익을 원하는 사람에게 자금중계를 위한 <br /> 크라우드펀딩 플랫폼
									서비스를 제공합니다.
								</h3>
								<a href="/product#0" class="btn_main invest">투자하기</a> <a
									href="/go?menuId=2020210" class="btn_main loan">대출하기</a>
							</div>
						</li>
						<!-- <li><div class="sd_item">
                        <h1>슬라이드 3</h1>
                    </div></li> -->
					</ul>
				</div>
			</div>
		</div>
		<div class="section section2">
			<div class="container-wrap">
				<ul class="main_state clearfix">
					<li>
						<h3>누적 투자 금액</h3>
						<p>{{ summary.totalAmount | number}} 원</p>
					</li>
					<li>
						<h3>누적 투자자</h3>
						<p>{{ summary.totalInvestors | number}} 명</p>
					</li>
					<li>
						<h3>총 펀딩 건수</h3>
						<p>{{ summary.totalCnt | number}} 건</p>
					</li>
					<li class="last">
						<h3>평균 수익률</h3>
						<p>{{ summary.avgRate}} %</p>
					</li>
				</ul>
			</div>
		</div>
		<div class="section section3">
			<div class="bg-wrap">
				<div class="container-wrap">
					<ul class="clearfix">
						<li>
							<div class="icon icon1"></div>
							<h5>담보 기반 상품</h5>
							<p>
								상품의 90% 이상이 전문가의 평가를 받은<br />안전한 담보기반 상품입니다.
							</p> <span class="dot"></span>
						</li>
						<li>
							<div class="icon icon2"></div>
							<h5>짧은 투자 기간</h5>
							<p>
								짦은 투자 기간설정으로<br />안전성을 추구합니다.
							</p> <span class="dot"></span>
						</li>
						<li>
							<div class="icon icon3"></div>
							<h5>재무 설계 시스템</h5>
							<p>
								재무컨설팅을 통해 체계적으로<br />투자를 할수있게 도와드립니다.
							</p> <span class="dot"></span>
						</li>
						<li>
							<div class="icon icon4"></div>
							<h5>중도 인출 시스템</h5>
							<p>
								투자자가 원하는 경우 내부심사를 거쳐<br /> 투자금 인출이 가능합니다
							</p>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="section section4">
			<div class="container-wrap">
				<ul class="fund-tab cearfix">
					<li ng-class='{active : istab(0)}' ng-click="setTab(0)"><a
						href>모집중인 상품</a></li>
					<li ng-class='{active : istab(1)}' ng-click="setTab(1)"><a
						href>상환중인 상품</a></li>
					<li ng-class='{active : istab(2)}' ng-click="setTab(2)"><a
						href>종료된 상품</a></li>
				</ul>
			</div>
			<div class="slide-box-wrap">
				<div class="slide-box active">
					<div class="btn_more">
						<a href="/product#0" ng-show="istab(0)">상품 더보기 ></a> <a
							href="/product#1" ng-show="istab(1)">상품 더보기 ></a> <a
							href="/product#2" ng-show="istab(2)">상품 더보기 ></a>
					</div>

					<ul class="fund-slide fund-slide-active">
						<li class="fund_box" ng-show="funding.length==0">
							<div class="fund_img">
								<div class="label left-label label01"></div>
								<div class="label right-label"></div>
								<div class="fund_hover"></div>
								<!-- <img src="http://www.alivesoft.co.kr/img/fund_img01.jpg" alt=""> -->
								<!-- <img src="/cmm/fms/getImage.do?atchFileId={{detail.defaultImage}}&fileSn=0" > -->
							</div>
							<div class="detail_info">
								<h4 style="color: #b7b7b7">상품 준비 중입니다</h4>
								<h4></h4>
								<span class="fund-txt-desc">
									<p>
										<em class="txt_title"></em>
									</p>
									<p>
										<em class="txt_title"></em>
									</p>
									<p>
										<em class="txt_title"></em>
									</p>
									<p>
										<em class="txt_title"></em>
									</p>
								</span> <span class="tund-txt-credit"> </span> <span
									class="fund-txt-desc">
									<p></p>
									<p></p> <em class="entry_date"></em>
								</span>
							</div>
						</li>


						<li class="fund_box" ng-repeat="detail in funding"
							my-repeat-directive ng-class="{last : ($index+1)%3==0}"><a
							href="/product#detail/{{detail.fundingProductSeq}}">
								<div class="fund_img">
									<div class="label left-label label01" ng-show="istab(0)">모집중</div>
									<!--label01 : 모집중 / label02 : 상환중 / label03 : 완료 -->
									<div class="label left-label label02" ng-show="istab(1)">상환중</div>
									<div class="label left-label label03" ng-show="istab(2)">종료</div>

									<div class="label right-label">개인담보</div>

									<span class="fund_icon icon_house"></span>
									<!--icon_house : 주택 / icon_apt : 아파트 / icon_bd : 건축 / icon_credit : 신용 -->

									<!-- <div class="fund_hover">
									<a class="btn_invest" href="/product#detail/{{detail.fundingProductSeq}}">상세보기</a>
								</div>
								<img src="http://www.alivesoft.co.kr/img/fund_img01.jpg" alt="">
								<img src="/cmm/fms/getImage.do?atchFileId={{detail.defaultImage}}&fileSn=0">
								<img src="/cmm/fms/getImage.do?atchFileId={{detail.defaultImage}}&fileSn=0" > -->
								</div>
								<div class="detail_info">
									<h4>NO.{{detail.fundingId}} {{detail.fundingName}}</h4>
									<span class="fund-txt-desc">
										<p>
											<em class="txt_title">모집기간</em><em class="right">{{detail.recruitmentEddt
												| date : 'yyyy.MM.dd'}}까지</em>
										</p>
										<p>
											<em class="txt_title">모집금액</em><em class="blue right">{{detail.collectingMoney/10000
												| number}}만원</em>
										</p>
										<p>
											<em class="txt_title">담보내용</em><em class="right">{{detail.mortgageType
												== 1 ? "건물/빌딩" : detail.mortgageType == 2 ? "공장" :
												detail.mortgageType == 3 ? "다가구주택" : detail.mortgageType ==
												4 ? "단독주택" : detail.mortgageType == 5 ? "빌라" :
												detail.mortgageType == 6 ? "상가" : detail.mortgageType == 7 ?
												"아파트" : detail.mortgageType == 8 ? "오피스텔" :
												detail.mortgageType == 9 ? "토지" : "기타"}}</em>
										</p>
										<p>
											<em class="txt_title">수익률(만기)</em><em class="green right">{{detail.rateOfReturn}}%<strong>({{detail.investmentPeriod}}개월)</strong></em>
										</p>
										<p>
											<em class="txt_title">원금상환</em><em class="right">{{detail.repaymentMethods
												== 1 ? "만기일시상환" : detail.repaymentMethods == 2 ? "원리금균등상환" :
												detail.repaymentMethods == 3 ? "원금균등상환" :
												detail.repaymentMethods == 4 ? "중도전체상환" : "중도일부상환"}}</em>
										</p>
									</span> <span class="tund-txt-credit">
										<table>
											<tr>
												<th>MC등급</th>
												<th>LTV</th>
												<th>DTI</th>
											</tr>
											<tr>
												<td>{{detail.grade}}</td>
												<td>{{detail.ltv}}%</td>
												<td>{{detail.dti}}%</td>
											</tr>
										</table>
									</span> <span class="fund-txt-desc">
										<p>달성률 ({{detail.amt | number}}원/{{detail.collectingMoney
											| number}}원)</p> <em class="percent_bar_bg"><strong
											class="percent_bar" ng-style="{width : detail.percent+'%'}"><em>{{detail.percent}}%</em></strong></em>
										<!-- <p>모집기간</p>
										<em class="entry_date">{{detail.recruitmentStdt | date : 'yyyy.MM.dd'}}부터 ~ {{detail.recruitmentEddt | date : 'yyyy.MM.dd'}}까지</em> -->
									</span>
								</div>
						</a></li>



						<!--  <ul class="fund-slide  fund-slide-active">
					<li class="fund_box" ng-show="funding.length==0">
                        <div class="fund_img">
                            <div class="label left-label label01"></div>
                            <div class="label right-label"></div>
                            <div class="fund_hover"></div>
                            <img src="http://www.alivesoft.co.kr/img/fund_img01.jpg" alt="">
                            <img src="/cmm/fms/getImage.do?atchFileId={{detail.defaultImage}}&fileSn=0" >
                        </div>
                        <div class="detail_info">
                            <h4 style="color:#b7b7b7">상품 준비 중입니다</h4>
                            <h4></h4>
                            <span class="fund-txt-desc">
									<p><em class="txt_title"></em></p>
									<p><em class="txt_title"></em></p>
									<p><em class="txt_title"></em></p>
									<p><em class="txt_title"></em></p>
								</span>
                            <span class="tund-txt-credit">
								</span>
                            <span class="fund-txt-desc">
									<p></p>
									<p></p>
									<em class="entry_date"></em>
								</span>
                        </div>
                    </li>
                    <li class="fund_box" ng-repeat="detail in funding" my-repeat-directive>
                        <div class="fund_img">
                            <div class="label left-label label01" ng-show="istab(0)">모집중</div>
                            <div class="label left-label label01" ng-show="istab(1)">상환중</div>
                            <div class="label left-label label01" ng-show="istab(2)">종료</div>
                            <div class="label right-label">개인담보</div>
                            <div class="fund_hover">
                                <a class="btn_invest" href="/product#detail/{{detail.fundingProductSeq}}">상세보기</a>
                            </div>
                            <img src="http://www.alivesoft.co.kr/img/fund_img01.jpg" alt="">
                            <img src="/cmm/fms/getImage.do?atchFileId={{detail.defaultImage}}&fileSn=0">
                            <img src="/cmm/fms/getImage.do?atchFileId={{detail.defaultImage}}&fileSn=0" >
                        </div>
                        <div class="detail_info">
                            <h4>[NO.{{detail.fundingId}}]</h4>
                            <h4>{{detail.fundingName}}</h4>
                            <span class="fund-txt-desc">
									<p><em class="txt_title">담보내용</em><em>{{detail.mortgageType == 1 ? "건물/빌딩" : detail.mortgageType == 2 ? "공장" : detail.mortgageType == 3 ? "다가구주택" : detail.mortgageType == 4 ? "단독주택" : detail.mortgageType == 5 ? "빌라" : detail.mortgageType == 6 ? "상가" : detail.mortgageType == 7 ? "아파트" : detail.mortgageType == 8 ? "오피스텔" : detail.mortgageType == 9 ? "토지" : "기타"}}</em></p>
									<p><em class="txt_title">모집금액</em><em class="blue">{{detail.collectingMoney/10000 | number}}만원</em></p>
									<p><em class="txt_title">수익률(만기)</em><em
                                            class="green">{{detail.rateOfReturn}}%<strong>({{detail.investmentPeriod}}개월)</strong></em></p>
									<p><em class="txt_title">원금상환</em><em>{{detail.repaymentMethods == 1 ? "만기일시상환" : detail.repaymentMethods == 2 ? "원리금균등상환" :  detail.repaymentMethods == 3 ? "원금균등상환" :  detail.repaymentMethods == 4 ? "중도전체상환" : "중도일부상환"}}</em></p>
								</span>
                            <span class="tund-txt-credit">
									<table>
										<tr>
											<th>MC등급</th>
											<th>LTV</th>
											<th>DTI</th>
										</tr>
										<tr>
											<td>{{detail.grade}}</td>
											<td>{{detail.ltv}}%</td>
											<td>{{detail.dti}}%</td>
										</tr>
									</table>

								</span>
							</div>
						</a>
                    </li>
                </ul>-->
				</div>
			</div>
		</div>
		<div class="section section4-1">
			<div class="bg-wrap">
				<div class="container-wrap">
					<div class="use_step_title clearfix">
						<div class="left active">
							<a href="#">마이크라우딩 투자방법</a><span class="click">CLICK !</span>
						</div>
						<div class="right">
							<a href="#">마이크라우딩 대출방법</a><span class="click">CLICK !</span>
						</div>
					</div>
					<ul class="clearfix active">
						<li>
							<div class="icon icon1"></div>
							<h5>회원 가입</h5> <span class="arrow">〉</span>
						</li>
						<li class="even">
							<div class="icon icon2"></div>
							<h5>예치금 입금</h5> <span class="arrow">〉</span>
						</li>
						<li>
							<div class="icon icon3"></div>
							<h5>상품 선택</h5> <span class="arrow">〉</span>
						</li>
						<li class="even">
							<div class="icon icon4"></div>
							<h5>투자 확정</h5>
						</li>
					</ul>
					<ul class="loan clearfix">
						<li>
							<div class="icon icon1"></div>
							<h5>대출신청정보입력</h5> <span class="arrow">〉</span>
						</li>
						<li class="even">
							<div class="icon icon2"></div>
							<h5>대출조건확인</h5> <span class="arrow">〉</span>
						</li>
						<li>
							<div class="icon icon3"></div>
							<h5>서류접수 및 심사확정</h5> <span class="arrow">〉</span>
						</li>
						<li class="even">
							<div class="icon icon4"></div>
							<h5>투자자 모집</h5>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="section section5">
			<div class="container-wrap">
				<div class="contents clearfix">
					<div class="sns_slide-wrap left">
						<ul class="sns-tab cearfix">
							<li class="active"><a href="#"><img
									src="/img/sns_tab03.png" alt=""></a></li>
							<!-- <li><a href="#"><img src="/img/sns_tab01.png" alt=""></a></li>
                        <li><a href="#"><img src="/img/sns_tab02.png" alt=""></a></li> -->
						</ul>
						<div class="sns-wrap-wrap">
							<ul class="sns-wrap clearfix active">
								<li class="sns-item">
									<div class="fb-page"
										data-href="https://www.facebook.com/mycrowding/"
										data-tabs="timeline" data-width="520" data-small-header="true"
										data-adapt-container-width="true" data-hide-cover="false"
										data-show-facepile="false">
										<div class="fb-xfbml-parse-ignore">
											<blockquote cite="https://www.facebook.com/mycrowding/">
												<a href="https://www.facebook.com/mycrowding/">마이크라우딩</a>
											</blockquote>
										</div>
									</div>
								</li>
							</ul>
							<ul class="sns-wrap clearfix">
								<li class="sns-item"><a href="#"><img
										src="/img/sns_img1.jpg" alt="인스타그램"></a></li>
							</ul>
							<ul class="sns-wrap clearfix">
								<li class="sns-item"><a href="#"><img
										src="/img/sns_img2.jpg" alt="페이스북"></a></li>
							</ul>
						</div>
					</div>
					<div class="news_slide-wrap right">
						<ul class="news-tab">
							<li class="active" ng-click="setTab1(0)"
								ng-class="{active : isTab1(0)}"><a href>공지사항</a></li>
							<li ng-click="setTab1(1)" ng-class="{active : isTab1(1)}"><a
								href>News</a></li>
							<li ng-click="setTab1(2)" ng-class="{active : isTab1(2)}"><a
								href>자주하는질문</a></li>
						</ul>
						<div class="news-wrap-wrap">
							<ul class="news-wrap active" ng-class="{active : isTab1(0)}">
								<a href="/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000142"
									class="more_link">더보기 &gt;</a>
								<li class="news-item">
									<ul class="notice-board">
										<li ng-repeat="item in boards"><a
											href="cop/bbs/selectBoardArticle.do?bbsId=BBSMSTR_000000000142&nttId={{item.nttId}}">
												<span class="notice-title" title="{{item.nttCn}}">{{item.nttSj}}</span>
												<span class="entry-date"><em>작성일 :
														{{item.regDate}}</em><em>|</em><em>조회 : {{item.cnt}}</em></span>
										</a></li>
									</ul>
								</li>
							</ul>
							<ul class="news-wrap" ng-class="{active : isTab1(1)}">
								<a href="/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000189"
									class="more_link">더보기 &gt; </a>
								<li class="news-item">
									<ul class="news-list">
										<li ng-repeat="item in boards"><a
											href="cop/bbs/selectBoardArticle.do?bbsId=BBSMSTR_000000000189&nttId={{item.nttId}}"
											class="clearfix"> <span class="thumbnail left"><img
													src="/cmm/fms/getImage.do?atchFileId={{item.getAtchFileId}}&fileSn=0"></span>
												<!-- <span class="thumbnail left"><img src="http://www.alivesoft.co.kr:7158/cmm/fms/getImage.do?atchFileId={{item.getAtchFileId}}&fileSn=0"><img src="/img/sns_img2.jpg" alt="" /></span> -->
												<span class="title-area left">
													<h3>{{item.nttSj}}</h3>
													<p>{{item.nttCn}}</p> <span class="entry-date"><em>작성일
															: {{item.regDate}}</em><em>|</em><em>조회 : {{item.cnt}}</em></span>
											</span>
										</a></li>


									</ul>
								</li>
							</ul>
							<ul class="news-wrap" ng-class="{active : isTab1(2)}">
								<a href="/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000143"
									class="more_link">더보기 &gt; </a>
								<li class="news-item">
									<div class="box-wrap box_table">
										<div class="box-body">
											<ul class="qna_often">
												<li ng-repeat="list in boards">
													<div class="queschen">
														<a href>{{list.nttSj}}</a>
														<div class="answer">{{list.nttCn}}</div>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--본문종료-->
	<!--푸터시작-->
	<%@ include file="footer.jsp"%>
	<!--푸터종료-->
	<script type="text/javascript">
		function commify(n) {
			var reg = /(^[+-]?\d+)(\d{3})/; // 정규식
			n += ''; // 숫자를 문자열로 변환

			while (reg.test(n))
				n = n.replace(reg, '$1' + ',' + '$2');

			return n;
		}

		function change() {
			CheckNum('principal');
			var test = $("#principal").val();
			var testKor = test.numberToHangul();
			$("#principal1").text(testKor + '원');
		}

		/*   function calcInterest(val) {
		 var test = $("#principal").val();
		 var interest_rate = $("#month_rate").val();

		 var interest = Math.round(test * interest_rate / 100 * val);
		 $("#val1").text("₩" + commify(interest));

		 $("#val2").text("₩" + commify(interest * 0.25));
		 $("#val3").text("₩" + commify(interest * 0.025));
		 $("#val4").text("₩" + commify(interest * 0.1));
		 $("#val6").text("₩" + commify(interest - (interest * 0.375 )));

		 }  */
		//CLICK 글씨 효과
		$(document).ready(function() {
			setInterval(function() {
				$(".click").animate({
					opacity : 0.1
				}, 200)
				$(".click").animate({
					opacity : 1
				}, 200)
			}, 500);

		});
		//스크롤따라 움직이는 퀵배너
		$(function() {
			var quick_menu = $(".right-banner-wrap .right-banner");
			var quick_top = 124;
			// quick menu initialization
			quick_menu.css('top', $(window).height());
			$(document).ready(function() {
				quick_menu.animate({
					"top" : $(document).scrollTop() + quick_top + "px"
				}, 100); //스크롤이 올라갈 때의 속도 값이 높아질수록 부드럽게 움직임
				$(window).scroll(function() {
					quick_menu.stop();
					quick_menu.animate({
						"top" : $(document).scrollTop() + quick_top + "px"
					}, 500); //스크롤 내려갈 때의 속도
				});
			});

			//대출하기&투자하기방법 TAB
			$(".use_step_title a").on(
					'click',
					function(e) {
						e.preventDefault();
						$(this).parent().addClass('active').siblings()
								.removeClass('active');
						temp = $(".use_step_title a").index($(this));
						$(".section4-1 ul").eq(temp).addClass('active')
								.siblings().removeClass('active');
					});
			//TOP으로 돌아가는 버튼
			$(".btn_top").on('click', function(e) {
				e.preventDefault();
				$("html,body").animate({
					scrollTop : 0
				})
			})
			//Index 메인 슬라이드
			$('.main_slider').bxSlider({
				auto : true,
				speed : 3200,
				pause : 8000
			});
			//펀드상품 슬라이드
			/*         $('.fund-slide').bxSlider({
			 slideWidth: 365,
			 minSlides: 1,
			 maxSlides: 3,
			 slideMargin: 20
			 }); */
			//SNS화면 TAB
			$(".sns-tab li a").on(
					'click',
					function(e) {
						e.preventDefault();
						$(this).parent().addClass('active').siblings()
								.removeClass('active');
						temp = $(".sns-tab li a").index($(this));
						$(".sns-wrap").eq(temp).addClass('active').siblings()
								.removeClass('active');
					});
			//NEWS화면 TAB
			$(".news-tab li a").on(
					'click',
					function(e) {
						e.preventDefault();
						$(this).parent().addClass('active').siblings()
								.removeClass('active');
						temp = $(".news-tab li a").index($(this));
						$(".news-wrap").eq(temp).addClass('active').siblings()
								.removeClass('active');
					});
			//펀드상품 구분별 TAB
			$(".fund-tab li a").on(
					'click',
					function(e) {
						e.preventDefault();
						$(this).parent().addClass('active').siblings()
								.removeClass('active');
						temp = $(".fund-tab li a").index($(this));
						$(".slide-box").eq(temp).addClass('active').siblings()
								.removeClass('active');
					});
			//펀드상품 마우스오버 이벤트
			$(".fund").on("mouseenter", function(e) {
				e.preventDefault();
				$(".item_hover", this).animate({
					opacity : 1
				}, 500);
				$(".item_hover .tooltip_bg", this).animate({
					height : 70
				})
			});
			$(".fund").on("mouseleave", function(e) {
				e.preventDefault();
				$(".item_hover", this).animate({
					opacity : 0
				}, 500);
				$(".item_hover .tooltip_bg", this).animate({
					height : 0
				})
			});
			//수익률계산기관련 스크립트
			$("#month_rate").val($("#year_rate").val() / 12);

			/* $('input[name=donation]').on("change", function () {
			 calcInterest($("#calc_slider").slider("option", "value"));
			 }); */
			/* 
			 $("#calc_slider").slider({
			 range: "max",
			 min: 1,
			 max: 12,
			 value: 12,
			 slide: function (event, ui) {
			 $("#calc_slider").children(".ui-slider-handle").html(
			 "투자기간: <span style='color: #38649f;font-weight: bold;'>" + ui.value + "개월</span>"
			 );
			 calcInterest(ui.value);
			 }
			 });
			 $("#year_rate").on("change", function () {
			 if ($.isNumeric($("#year_rate").val())) {
			 $("#month_rate").val(Math.round($("#year_rate").val() / 12 * 100) / 100);
			 }
			 calcInterest($("#calc_slider").slider("option", "value"));
			 });

			 $(".ui-slider-handle").css("height", "54px");
			 $(".ui-slider-handle").css("padding", "3px 10px");
			 $(".ui-slider-handle").css("text-align", "center");
			 $(".ui-slider-handle").css("margin-top", "-10px");
			 $(".ui-slider-handle").css("width", "85px");
			 $(".ui-slider-handle").css("border-radius", "15px");
			 $(".ui-slider-handle").html("투자기간: <span style='color: #38649f;font-weight: bold;'>12개월</span>");

			 calcInterest(12); */
		});
	</script>
</body>
</html>