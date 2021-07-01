<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Fashi | Template</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
<script type="text/javascript">
   function loginFn() {
      var member_id = $("#member_id").val();
      var member_pw = $("#member_pw").val();
      $.ajax({
         url : "ajaxlogin.do",
         type : "post",
         data : {
            "member_id" : member_id,
            "member_pw" : member_pw
         },
         success : function(data) {
            //alert(data);
            if (data == "NO") {
               alert("회원인증에 실패했습니다.");
            } else {
               alert("회원인증에 성공했습니다.");
               console.log("로그인 성공")
               location.href = "test03.jsp"; // 메인화면으로...
            }
         },
         error : function() {
            alert("error");
         }
      });

   }
   function joinFN() {
      var formData = $("#register").serialize();
      $.ajax({
         url : "ajaxjoinmember.do",
         type : "post",
         data : formData,
         success : function(data) {
            //alert(data);
            if (data == "NO") {
               alert("회원가입에 실패했습니다.");
            } else {
               alert("회원가입에 성공했습니다.");
               location.href = "test03.jsp"; // 메인화면으로...
            }
         },
         error : function() {
            alert("error");
         }

      });

   }
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
                     class="fa fa-user"></i>회원가입 </a>

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
                  <li class=""><a href="./test03.jsp">메인</a></li>
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
                  <li class="active"><a href="#">마이페이지</a>
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

   <!-- Breadcrumb Section Begin -->
   <div class="register-login-section spad">
      <div class="container">
         <div class="row">
            <div class="col-lg-6 offset-lg-3">
               <div class="login-form">
                  <h2>로그인</h2>
                  <form id="login" method="post">
                     <div class="group-input">
                        <label for="username">아이디 *</label> <input
                           type="text" id="member_id">
                     </div>
                     <div class="group-input">
                        <label for="pass">비밀번호 *</label> <input type="password"
                           id="member_pw">
                     </div>
                     <div class="group-input gi-check">
                        <div class="gi-more">
                           <label for="save-pass">비밀번호 저장 <input
                              type="checkbox" id="save-pass"> <span
                              class="checkmark"></span>
                           </label>
                        </div>
                     </div>
                     <input type="button" class="site-btn login-btn"
                        onclick="loginFn()" value="로그인"/>
                  
                  <div class="switch-login">
                     <input type="button" class="site-btn login-btn"
                        onclick="location='Register.jsp'" value="회원가입"/>
                  </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- Register Form Section End -->

   <!-- Partner Logo Section Begin -->
   <div class="partner-logo">
      <div class="container">
         <div class="logo-carousel owl-carousel">
            <div class="logo-item">
               <div class="tablecell-inner">
                  <img src="img/logo-carousel/logo-1.png" alt="">
               </div>
            </div>
            <div class="logo-item">
               <div class="tablecell-inner">
                  <img src="img/logo-carousel/logo-2.png" alt="">
               </div>
            </div>
            <div class="logo-item">
               <div class="tablecell-inner">
                  <img src="img/logo-carousel/logo-3.png" alt="">
               </div>
            </div>
            <div class="logo-item">
               <div class="tablecell-inner">
                  <img src="img/logo-carousel/logo-4.png" alt="">
               </div>
            </div>
            <div class="logo-item">
               <div class="tablecell-inner">
                  <img src="img/logo-carousel/logo-5.png" alt="">
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- Partner Logo Section End -->

   <!-- Footer Section Begin -->
   <footer class="footer-section">
      <div class="container">
         <div class="row">
            <div class="col-lg-3">
               <div class="footer-left">
                  <div class="footer-logo">
                     <a href="#"><img src="img/footer-logo.png" alt=""></a>
                  </div>
                  <ul>
                     <li>Address: 60-49 Road 11378 New York</li>
                     <li>Phone: +65 11.188.888</li>
                     <li>Email: hello.colorlib@gmail.com</li>
                  </ul>
                  <div class="footer-social">
                     <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
                        class="fa fa-instagram"></i></a> <a href="#"><i
                        class="fa fa-twitter"></i></a> <a href="#"><i
                        class="fa fa-pinterest"></i></a>
                  </div>
               </div>
            </div>
            <div class="col-lg-2 offset-lg-1">
               <div class="footer-widget">
                  <h5>Information</h5>
                  <ul>
                     <li><a href="#">About Us</a></li>
                     <li><a href="#">Checkout</a></li>
                     <li><a href="#">Contact</a></li>
                     <li><a href="#">Serivius</a></li>
                  </ul>
               </div>
            </div>
            <div class="col-lg-2">
               <div class="footer-widget">
                  <h5>My Account</h5>
                  <ul>
                     <li><a href="#">My Account</a></li>
                     <li><a href="#">Contact</a></li>
                     <li><a href="#">Shopping Cart</a></li>
                     <li><a href="#">Shop</a></li>
                  </ul>
               </div>
            </div>
            <div class="col-lg-4">
               <div class="newslatter-item">
                  <h5>Join Our Newsletter Now</h5>
                  <p>Get E-mail updates about our latest shop and special
                     offers.</p>
                  <form action="#" class="subscribe-form">
                     <input type="text" placeholder="Enter Your Mail">
                     <button type="button">Subscribe</button>
                  </form>
               </div>
            </div>
         </div>
      </div>
      <div class="copyright-reserved">
         <div class="container">
            <div class="row">
               <div class="col-lg-12">
                  <div class="copyright-text">
                     <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                     Copyright &copy;
                     <script>
                        document.write(new Date().getFullYear());
                     </script>
                     All rights reserved | This template is made with <i
                        class="fa fa-heart-o" aria-hidden="true"></i> by <a
                        href="https://colorlib.com" target="_blank">Colorlib</a>
                     <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                  </div>
                  <div class="payment-pic">
                     <img src="img/payment-method.png" alt="">
                  </div>
               </div>
            </div>
         </div>
      </div>
   </footer>
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
</body>

</html>