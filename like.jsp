<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Liverary - 일상 속 작은도서관</title>

<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Fashi | Template</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/themify-icons.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">

<link rel="stylesheet" href="assets/css/main.css" />
<style>
.ex_show {
	margin-right: 10px;
	cursor: pointer;
}

.ex_hide {
	float: left;
	cursor: pointer;
	z-index: 10000;
	clear: both;
	position: absolute;
	right: 10px;
}

.ex_box {
	position: fixed;
	z-index: 100;
	width: 100%;
	height: 1000px;
	background-color: whitesmoke;
	border-radius: 10px;
	opacity: 0.9;
	/*투명도*/
	display: none;
	clear: both;
	text-align: center;
}

.ex_show_J {
	margin-right: 10px;
	cursor: pointer;
}

.ex_hide_J {
	float: left;
	cursor: pointer;
	z-index: 10000;
	clear: both;
	position: absolute;
	right: 10px;
}

.ex_box_J {
	position: fixed;
	z-index: 100;
	width: 100%;
	height: 1000px;
	background-color: whitesmoke;
	border-radius: 10px;
	opacity: 0.9;
	/*투명도*/
	display: none;
	clear: both;
	text-align: center;
}

.ex_show_T {
	margin-right: 10px;
	cursor: pointer;
}

.ex_hide_T {
	float: left;
	cursor: pointer;
	z-index: 10000;
	clear: both;
	position: absolute;
	right: 10px;
}

.ex_box_T {
	position: fixed;
	z-index: 100;
	width: 100%;
	height: 1000px;
	background-color: whitesmoke;
	border-radius: 10px;
	opacity: 0.9;
	/*투명도*/
	display: none;
	clear: both;
	text-align: center;
}

.ex_show_S {
	margin-right: 10px;
	cursor: pointer;
}

.ex_hide_S {
	float: left;
	cursor: pointer;
	z-index: 10000;
	clear: both;
	position: absolute;
	right: 10px;
}

.ex_box_S {
	position: fixed;
	z-index: 100;
	width: 100%;
	height: 1000px;
	background-color: whitesmoke;
	border-radius: 10px;
	opacity: 0.9;
	/*투명도*/
	display: none;
	clear: both;
	text-align: center;
}

.ex_show_U {
	margin-right: 10px;
	cursor: pointer;
}

.ex_hide_U {
	float: left;
	cursor: pointer;
	z-index: 10000;
	clear: both;
	position: absolute;
	right: 10px;
}

.ex_box_U {
	position: fixed;
	z-index: 100;
	width: 100%;
	height: 1000px;
	background-color: whitesmoke;
	border-radius: 10px;
	opacity: 0.9;
	/*투명도*/
	display: none;
	clear: both;
	text-align: center;
}
</style>




<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	function btnWrite() {
		$("#bc").css("display", "none");
		$("#bf").css("display", "block");
		$("#resetBtn").trigger("click"); // => 강제로 resetBtn 버튼에 클릭이벤트를 발생하게 해준다.

	}

	function logoutFn() {
		$.ajax({
			url : "ajaxlogout.do",
			type : "get",
			success : function() {
				location.href = "test03.jsp";
			},
			error : function() {
				alert("error");
			}
		});
	}

	function updateFn() {
		var formData = $("#ufrm").serialize();
		//alert(formData);
		$.ajax({
			url : "ajaxupdate.do",
			type : "post",
			data : formData,
			success : list,
			error : function() {
				alert("error");
			}

		});
	}

	function contentFn(index) {
		var idx = $("#idx" + index).text();
		//alert(idx); 데이터 잘 들어오는지 확인
		$.ajax({
			url : "ajaxcontent.do",
			type : "get",
			data : {
				"idx" : idx
			},
			dataType : "json",
			success : callContent,
			error : function() {
				alert("error");
			}

		});
	}
<%String data1 = request.getParameter("result");%>
	
</script>








</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<header class="header-section">
		<div class="header-top">
			<div class="container">
				<div class="ht-left">
					<div class="mail-service">
						<i class=" fa fa-envelope"></i> 스마트인재개발원@gmail.com
					</div>
					<div class="phone-service">
						<i class=" fa fa-phone"></i> 062-655-3509
					</div>
				</div>
				<div class="ht-right">
					<c:if test="${sessionScope.memberVO==null}">
						<a href="Login.jsp" class="login-panel"><i class="fa fa-user"></i>로그인</a>
						<a href="Register.jsp" class="login-panel"><i
							class="fa fa-user"></i>회원가입<%=data1%> </a>


					</c:if>


					<c:if test="${sessionScope.memberVO!=null}">

						<a href="javascript:void(0);" onclick="logoutFn();"
							attr-a="onclick : attr-a" class="login-panel"><i
							class="fa fa-user">로그아웃</i></a>
						<!-- <a href="Mypages.jsp" class="login-panel"><i
							class="fa fa-user">마이페이지</i></a> -->

					</c:if>

					<div class="lan-selector">
						<select class="language_drop" name="countries" id="countries"
							style="width: 300px;">
							<option value='yt' data-image="img/flag-1.jpg"
								data-imagecss="flag yt" data-title="English">미국</option>
							<option value='yu' data-image="img/flag-2.jpg"
								data-imagecss="flag yu" data-title="Bangladesh">독일</option>
						</select>
					</div>

				</div>
			</div>
		</div>
		<div class="container">
			<div class="inner-header">
				<div class="row">
					<div class="col-lg-2 col-md-2"></div>
					<div class="col-lg-7 col-md-7">
						<div class="logo" style="margin-left: 170px";>
							<a href="./test03.jsp"> <img src="img/Liverary.jpg" alt="">
							</a>

						</div>
					</div>
					<div class="col-lg-3 text-right col-md-3">
						<!-- <ul class="nav-right">
							<li class="heart-icon"><a href="#"> <i
									class="icon_heart_alt"></i> <span>1</span>
							</a></li>
							<li class="cart-icon"><a href="#"> <i
									class="icon_bag_alt"></i> <span>3</span>
							</a>
								<div class="cart-hover">
									<div class="select-items">
										<table>
											<tbody>
												<tr>
													<td class="si-pic"><img src="img/select-product-1.jpg"
														alt=""></td>
													<td class="si-text">
														<div class="product-selected">
															<p>$60.00 x 1</p>
															<h6>Kabino Bedside Table</h6>
														</div>
													</td>
													<td class="si-close"><i class="ti-close"></i></td>
												</tr>
												<tr>
													<td class="si-pic"><img src="img/select-product-2.jpg"
														alt=""></td>
													<td class="si-text">
														<div class="product-selected">
															<p>$60.00 x 1</p>
															<h6>Kabino Bedside Table</h6>
														</div>
													</td>
													<td class="si-close"><i class="ti-close"></i></td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="select-total">
										<span>total:</span>
										<h5>$120.00</h5>
									</div>
									<div class="select-button">
										<a href="#" class="primary-btn view-card">VIEW CARD</a> <a
											href="#" class="primary-btn checkout-btn">CHECK OUT</a>
									</div>
								</div></li>
							<li class="cart-price">$150.00</li>
						</ul> -->
					</div>
				</div>
			</div>
		</div>
		<div class="nav-item">
			<div class="container">
				<div class="nav-depart">
					<div class="depart-btn">
						<i class="ti-menu"></i> <span>전체 보기</span>
						<ul class="depart-hover">
							<li class="active"><a href="#">Women’s Clothing</a></li>
							<li><a href="#">Men’s Clothing</a></li>
							<li><a href="#">Underwear</a></li>
							<li><a href="#">Kid's Clothing</a></li>
							<li><a href="#">Brand Fashion</a></li>
							<li><a href="#">Accessories/Shoes</a></li>
							<li><a href="#">Luxury Brands</a></li>
							<li><a href="#">Brand Outdoor Apparel</a></li>
						</ul>
					</div>
				</div>
				<nav class="nav-menu mobile-menu">
					<ul>
						<li class="active"><a href="./test03.jsp">메인</a></li>
						<li><a href="#">인기 도서</a>
							<ul class="dropdown">
								<!-- <li><a href="#">인기 대출</a></li>
								<li><a href="#">도서</a></li>
								<li><a href="#">도서관</a></li> -->
							</ul></li>
						<li><a href="#">검색</a>
							<ul class="dropdown">
								<li><a href="#">도서</a></li>
								<li><a href="#">도서관</a></li>

							</ul></li>
						<li><a href="./Bookboard.jsp">게시판</a></li>
						<li><a href="./contact.html">찾아오는 길</a></li>
						<li><a href="#">마이페이지</a>
							<ul class="dropdown">
								<li><a href="./Mypages.jsp">내 정보</a></li>
								<li><a href="./Mypages.jsp">도서 정보</a></li>
							</ul></li>
					</ul>
				</nav>
				<div id="mobile-menu-wrap"></div>
			</div>
		</div>
	</header>

	<!-- Header End -->

	<!-- Hero Section Begin -->

	<!-- Hero Section End -->

	<!-- Banner Section Begin -->

	<!-- Banner Section End -->

	<!-- Women Banner Section Begin -->

	<!-- Deal Of The Week Section End -->
	<%
		
	%>

	<!-- Man Banner Section Begin -->
	<section class="carousel" class="wrapper style1 fade-up">

		<div class="reel2">
			<p>
				<b>#원숭이 전용 동물원</b>
			</p>
		</div>
		<div class="reel">

			<article>
				<a href="#" class="image featured"><img src="img/kiki.jpg"
					alt="" /></a>
				<header>
					<h3>
						<a href="#">Pulvinar sagittis congue</a>
					</h3>
				</header>
				<p>Commodo id natoque malesuada sollicitudin elit suscipit
					magna.</p>
			</article>
			<article>
				<a href="#" class="image featured"><img src="img/kiki.jpg"
					alt="" /></a>
				<header>
					<h3>
						<a href="#">Pulvinar sagittis congue</a>
					</h3>
				</header>
				<p>Commodo id natoque malesuada sollicitudin elit suscipit
					magna.</p>
			</article>
			<article>
				<a href="#" class="image featured"><img src="img/kiki.jpg"
					alt="" /></a>
				<header>
					<h3>
						<a href="#">Pulvinar sagittis congue</a>
					</h3>
				</header>
				<p>Commodo id natoque malesuada sollicitudin elit suscipit
					magna.</p>
			</article>
			<article>
				<a href="#" class="image featured"><img src="img/kiki.jpg"
					alt="" /></a>
				<header>
					<h3>
						<a href="#">Pulvinar sagittis congue</a>
					</h3>
				</header>
				<p>Commodo id natoque malesuada sollicitudin elit suscipit
					magna.</p>
			</article>
			<article>
				<a href="#" class="image featured"><img src="img/kiki.jpg"
					alt="" /></a>
				<header>
					<h3>
						<a href="#">Pulvinar sagittis congue</a>
					</h3>
				</header>
				<p>Commodo id natoque malesuada sollicitudin elit suscipit
					magna.</p>
			</article>

			<article>
				<a href="#" class="image featured"><img src="img/kiki.jpg"
					alt="" /></a>
				<header>
					<h3>
						<a href="#">Pulvinar sagittis congue</a>
					</h3>
				</header>
				<p>Commodo id natoque malesuada sollicitudin elit suscipit
					magna.</p>
			</article>

			<article>
				<a href="#" class="image featured"><img src="img/kiki.jpg"
					alt="" /></a>
				<header>
					<h3>
						<a href="#">Pulvinar sagittis congue</a>
					</h3>
				</header>
				<p>Commodo id natoque malesuada sollicitudin elit suscipit
					magna.</p>
			</article>

			<article>
				<a href="#" class="image featured"><img src="img/kiki.jpg"
					alt="" /></a>
				<header>
					<h3>
						<a href="#">Pulvinar sagittis congue</a>
					</h3>
				</header>
				<p>Commodo id natoque malesuada sollicitudin elit suscipit
					magna.</p>
			</article>

			<article>
				<a href="#" class="image featured"><img src="img/kiki.jpg"
					alt="" /></a>
				<header>
					<h3>
						<a href="#">Pulvinar sagittis congue</a>
					</h3>
				</header>
				<p>Commodo id natoque malesuada sollicitudin elit suscipit
					magna.</p>
			</article>

			<article>
				<a href="#" class="image featured"><img src="img/kiki.jpg"
					alt="" /></a>
				<header>
					<h3>
						<a href="#">Pulvinar sagittis congue</a>
					</h3>
				</header>
				<p>Commodo id natoque malesuada sollicitudin elit suscipit
					magna.</p>
			</article>

			<article>
				<a href="#" class="image featured"><img src="img/kiki.jpg"
					alt="" /></a>
				<header>
					<h3>
						<a href="#">Pulvinar sagittis congue</a>
					</h3>
				</header>
				<p>Commodo id natoque malesuada sollicitudin elit suscipit
					magna.</p>
			</article>


		</div>



	</section>

	<!-- Man Banner Section End -->

	<!-- Instagram Section Begin -->

	<!-- Instagram Section End -->

	<!-- Latest Blog Section Begin -->

	<!-- Partner Logo Section End -->

	<!-- Footer Section Begin -->

	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.countdown.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery.zoom.min.js"></script>
	<script src="js/jquery.dd.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>


	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script type="text/javascript">
		$(function() {
			var ex_show = $('.ex_show');

			var ex_hide = $('.ex_hide');

			var ex_box = $('.ex_box');

			ex_show.click(function() {

				ex_box.fadeIn();

			});

			ex_hide.click(function() {
				ex_box.fadeOut();
			});
		});
	</script>
	<script type="text/javascript">
		$(function() {
			var ex_show = $('.ex_show_J');

			var ex_hide = $('.ex_hide_J');

			var ex_box = $('.ex_box_J');

			ex_show.click(function() {

				ex_box.fadeIn();

			});

			ex_hide.click(function() {
				ex_box.fadeOut();
			});
		});
	</script>
	<script type="text/javascript">
		$(function() {
			var ex_show = $('.ex_show_T');

			var ex_hide = $('.ex_hide_T');

			var ex_box = $('.ex_box_T');

			ex_show.click(function() {

				ex_box.fadeIn();

			});

			ex_hide.click(function() {
				ex_box.fadeOut();
			});
		});
	</script>

	<script type="text/javascript">
		$(function() {
			var ex_show = $('.ex_show_S');

			var ex_hide = $('.ex_hide_S');

			var ex_box = $('.ex_box_S');

			ex_show.click(function() {

				ex_box.fadeIn();

			});

			ex_hide.click(function() {
				ex_box.fadeOut();
			});
		});
	</script>

	<script type="text/javascript">
		$(function() {
			var ex_show = $('.ex_show_U');

			var ex_hide = $('.ex_hide_U');

			var ex_box = $('.ex_box_U');

			ex_show.click(function() {

				ex_box.fadeIn();

			});

			ex_hide.click(function() {
				ex_box.fadeOut();
			});
		});
	</script>
</body>

</html>