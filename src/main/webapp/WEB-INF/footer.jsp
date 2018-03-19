<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!--푸터시작-->
	<div class="footer">
		<div class="container960">
			<div class="contants-wrap clearfix">
				<div class="contants footer_contants">
					<ul class="footer_menu_title clearfix">
						<a href="#" class="slideDown">▼</a>
						<li>
							<a href="#">·&nbsp;고객센터</a>
							<ul class="footer_menu">
                                <li><a href="/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000142">공지사항</a></li>
                                <li><a href="/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000143">자주하는 질문</a></li>
							</ul>
						</li>
						<li><a href="#">·&nbsp;마이크라우딩 소개</a>
							<ul class="footer_menu">
								<li><a href="#">서비스소개</a></li>
								<li><a href="/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000189">마이크라우딩 소식</a></li>
								<li><a href="/info#invest">투자 신청 방법</a></li>
								<li><a href="/info#funding">대출 신청 방법</a></li>
							</ul>
						</li>
						<li>
							<a href="#">·&nbsp;약관안내</a>
							<ul class="footer_menu">
								<li ng-repeat="term in terms"><a href="/info#term/{{term.termsSeq}}">{{term.termsTitle}}</a></li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="contants company_info left">
					<ul>
						<li class="company_logo"><img src="/img/logo_pc_footer.png" alt=""></li>
						<li>
							<p>
								<b>(주)마이크라우딩</b> <br />
								사업자번호 : 746-87-00223 <br />
								대표이사 : 성진호 <br />
								대표전화 : 02-553-3400 <br />
								FAX : 02-553-3405 <br />
								통신판매업신고번호 : 제2015-서울강남-03540호
							</p>
							<p>
								소재지 : 서울특별시 강남구 논현로 75길 10,<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;602호(역삼동,영창빌딩)
							</p>
						</li>
					</ul>
				</div>
				
				<div class="contants company_info left last">
					<ul class="clearfix">
						<li><h5>·&nbsp;&nbsp;관련 사이트 링크</h5></li>
						<li>
							<div class="site_link_wrap">
							  <div class="col-sm-10 clearfix wd100">
								<select class="form-control left wd70" id="gourl">
								  <option selected="selected">관련사이트 바로가기</option>
								  <option value="http://www.alivesoft.co.kr">(주)얼라이브소프트</option>
								</select>
								<button type="submit" class="btn btn-info left wd30" onclick="gogo()">GO</button>
							  </div>
							</div>
						</li>
					</ul>
					<div class="footer_banner">
						<script type="text/javascript" src="https://seal.thawte.com/getthawteseal?host_name=www.mycrowding.co.kr&amp;size=S&amp;lang=en"></script>
					</div>
				</div>
			</div><div class="copyright">
				<p>대출금리 연 6~24% 이내 (연체이자율 연 27.9%이내)&nbsp;|&nbsp;플랫폼 이용료 외 취급수수료 등 기타 부대비용을 받지 않습니다.&nbsp;|&nbsp;과도한 빚, 고통의 시작입니다.</p>
				<p>Copyright ⓒ 2016 MyCrowding Co.,Ltd All Right Reserved.</p>
			</div>
		</div>		
	</div>
<!--푸터종료-->
</body>
</html>
<script>
	//관련사이트 링크
/* 	function gogo(){
		var url=document.getElementById('gourl').value;
		window.open(url);
	};
	$(function(){
		$(".footer_menu_title>li>a,.slideDown").on('click',function(e){
			e.preventDefault();
			$(".footer_menu").slideToggle();
			$(".slideDown").toggleClass('rotate');
		});
	}) */
</script>