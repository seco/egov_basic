<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<header class="header_main">
    <div class="header_login">
        <div id="myinfo">
        </div>
    </div>
    <div class="container">
        <div class="contants-wrap">
            <div class="contents">
                <div class="gnb-wrap">
                    <div class="logo logo_login"><a href="/index.jsp">메인로고</a></div>
                    <ul class="gnb clearfix">
                        <li><a href="/product#0">투자하기</a>
							<ul class="under_menu">
                                <li><a href="/product#0">모집중인 상품</a></li>
                                <li><a href="/product#1">상환중인 상품</a></li>
                                <li><a href="/product#2">종료된 상품</a></li>
                            </ul>
						</li>
                        <li><a href="/go?menuId=2020210">대출하기</a></li>
                        <li class="active"><a href="#">마이크라우딩 소개</a>
                            <ul class="under_menu">
                                <li><a href="/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000189">마이크라우딩 소식</a></li>
                                <li><a href="/info#invest">투자 신청 방법</a></li>
                                <li><a href="/info#funding">대출 신청 방법</a></li>
                            </ul>
                        </li>
                        <li class="last"><a href="#">고객센터</a>
                            <ul class="under_menu">
                                <span class="arrow_top"></span>
                                <li><a href="/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000142">공지사항</a></li>
                                <li><a href="/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000143">자주하는 질문</a></li>
                                <!-- <li><a href="/go?menuId=2201000#/">공인인증서 안내</a></li> -->
                                <li><a href="/info#certificate">공인인증서 안내</a></li>
                                <li><a href="/go?menuId=2202000#/">공인인증서 등록</a></li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="gnb_mobile clearfix">
                        <li><a href="/product#0">투자하기</a>
							<ul class="under_menu">
                                <span class="arrow_top"></span>
                                <li><a href="/product#0">모집중인 상품</a></li>
                                <li><a href="/product#1">상환중인 상품</a></li>
                                <li><a href="/product#2">종료된 상품</a></li>
                            </ul>
						</li>
                        <li><a href="/go?menuId=2020210">대출하기</a></li>
                        <li class="active"><a href="#">마이크라우딩 소개</a>
                            <ul class="under_menu">
                                <span class="arrow_top"></span>
                                <li><a href="#">서비스소개</a></li>
                                <li><a href="/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000189">마이크라우딩 소식</a></li>
                                <li><a href="/info?menuName=invest">투자 신청 방법</a></li>
                                <li><a href="/info?menuName=funding">대출 신청 방법</a></li>
                            </ul>
                        </li>
                        <li class="last"><a href="#">고객센터</a>
                            <ul class="under_menu">
                                <span class="arrow_top"></span>
                                <li><a href="/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000142">공지사항</a></li>
                                <li><a href="/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000143">자주하는 질문</a></li>
                            </ul>
                        </li>
                    </ul>
<!--                     <div class="main_email">
                        <div class="col-sm-10 clearfix">
                            <input type="email" class="form-control left" placeholder="YOUR E-MAIL ADDRESS">
                            <button type="submit" class="btn btn-info left">소식지받기</button>
                        </div>
                    </div> -->
                </div>
            </div>
        </div>
    </div>
	<!--로그인시 좌측메뉴 나오게하는 버튼-->
	<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
		<i class="fa fa-bars" aria-hidden="true"></i>
	</a>
	<!--로그인시 좌측메뉴 나오게하는 버튼-->
    </header>
<div class="btn_top">
	<img src="/img/btn_top.png" alt="" />
</div>
<script type="text/javascript">
/* $(function(){
		$(".gnb-wrap>ul>li").on('mouseenter',function(){
				$(".under_menu",this).show();
			});
		$(".gnb-wrap>ul>li").on('mouseleave',function(){
				$(".under_menu").hide();
			});

			$(".btn_top").on('click',function(e){
				e.preventDefault();
				$("html,body").animate({scrollTop:0})
			})
	}); */
</script><!--헤더 하위메뉴용 임시 스크립트 -->