<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<!--
   Forty by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Happy House</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<noscript>
   <link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<style>
<!--
div h2 {
	color:black;
}
-->
</style>
</head>
<body class="is-preload">

   <!-- Wrapper -->
   <div id="wrapper">

      <!-- Header -->
      <header id="header" class="alt">
         <%@ include file="../header.jsp"%>
      </header>
      <%@ include file="../menu.jsp"%>

      <section id="banner">
         <div class="inner">
            <span class="image"> <img src="images/pic07.jpg" alt="" />
            </span>
            <header class="major">
               <h4>맞춤검색</h4>
            </header>
         </div>
      </section>

      <div align="center">
         <div class="container">
            <!-- //<dl class="dl-horizontal col-md-4">


         //</dl> -->
            <!-- map start -->
            <!-- //<dl class="dl-horizontal col-md-7"> -->
            <p></p>
            
            <input type="checkbox" id="option1" name="option"/>
            <label for = "option1">CCTV</label>
            <input type="checkbox" id="option2" name="option"/>
            <label for = "option2">공원</label>
            <input type="checkbox" id="option3" name="option"/>
            <label for = "option3">문화시설</label>
            <input type="text" name="gu" placeholder="검색 원하시는 구 이름을 입력하세요.">
            <br>
            <input type="button" value="검색" id="bt_search">
            <br><br>

            <div id="map" style="width: 100%; height: 1000px; margin: auto;"></div>
			
         </div>
   
      <br><br><br>


      <!-- 검색 결과에 따라 마커 다시 업데이트 시작  -->
      <script>
         $(document).ready(
               function() {
                  $('#bt_search').click(    
                        function() {
                        	
                           console.log($("input[name=gu]").val());
                           $.ajax({
                              type : 'GET',
                              url : "${root}api/custom/search/"
                                    + $("input[name=gu]").val(),
                              headers : {
                                 "Content-Type" : "application/json"
                              },

                              success : function(data) {
                                 console.log(data);
                                 console.log(status);
                                 initMap(data[5].lat,data[5].lng);
                                 $.each(data, function(index, no) {
                                    console.log(no.lat);
                                    console.log(no.lng);
                                    
                                    addMarker(no);
                                 });
                                 
                                 var arr = document.getElementsByName("option");
                                 
                                 for (var i = 0; i < arr.length; i++) {
                                    if (arr[0].checked == true) {
                                    	$.get("/api/custom/cctvinfo"

                                                , function(data, status) {
                                                   console.log("response");
                                                   console.log(data);
                                                   console.log(status);
                                                   $.each(data, function(index, no) {
                                                      checkGuCCTV(no,$("input[name=gu]").val());
                                                   });
                                                   console.log(data);
                                                }, "json");
                                                console.log("end");
                                    }
                                    if (arr[1].checked == true) { 
                                    	 $.get("/api/custom/parkinfo", function(data, status) {
                                             console.log("response");
                                             console.log(data);
                                             console.log(status);
                                             $.each(data, function(index, no) {
                                                checkGuPark(no,$("input[name=gu]").val());
                                             });
                                             console.log(data);
                                          }, "json");
                                    	
                                    }
                                    if (arr[2].checked == true) {   
                                    	$.get("/api/custom/culturalfacilityinfo"

                                                , function(data, status) {
                                                   console.log("response");
                                                   console.log(data);
                                                   console.log(status);
                                                   $.each(data, function(index, no) {
                                                      checkGuCulture(no,$("input[name=gu]").val());
                                                   });
                                                   console.log(data);
                                                }, "json");
                                                console.log("end");
                                    }
                                 }
                              }
                           });
                        }
                  
                  );//검색         

               });
      </script>

      <script>
      function checkGuCCTV(no,gu) {
          var addr = no.GC_MAPADDRESS;
          if (addr.includes(gu)) {
              addCCTVMarker(no.GC_MAPX, no.GC_MAPY,
                      no.GC_MAPADDRESS);
          }
       }
      
      function checkGuPark(no,gu) {
          var addr = no.P_ADDR;
          if (addr.includes(gu)) {
              addParkMarker(no.LATITUDE, no.LONGITUDE,
                      no.P_PARK);
          }
       }
      
         function checkGuCulture(no,gu) {
            var addr = no.ADDR;
            if (addr.includes(gu)) {
               addFacilityMarker(no.X_COORD, no.Y_COORD, no.FAC_NAME,
                     no.SUBJCODE);
            }
         }
      </script>

      <!--  맵 시작   -->
      <script
         src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
      <script async defer
         src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBT4TBPuW99mJESn8A4PGjuSCcu52HGI28&callback=initMap"></script>
      <script>
         //      var multi = {
         //         lat: ${housedeal.lat},
         //         lng: ${housedeal.lng}
         //      };
         var multi = {
        	            lat : 37,
        	            lng : 126
        	         };
         var map;

         function initMap(templat, templng) {
        
        	 var multi = {       			    			 
        	            lat : Number(templat),
        	            lng : Number(templng)
        	         };
        	 console.log(multi);
        	 if (isNaN(multi.lat) ) {
        		 multi.lat = 37.5665734;
        		 
			}
        	 if (isNaN(multi.lng) ) {
        		 multi.lng = 126.978179;
			}
        	 console.log(multi);
            var homeIcon = new google.maps.MarkerImage(
                  "images/icon/home.png", null, null, null,
                  new google.maps.Size(90, 50));

            map = new google.maps.Map(document.getElementById('map'), {
               center : multi,
               zoom : 17
            });

            var marker = new google.maps.Marker({
               position : multi,
               icon : homeIcon,
               map : map
            });
         }

         // 집 마커
         function addMarker(no) {
            var homeIcon = new google.maps.MarkerImage(
                  "images/icon/home.png", null, null, null,
                  new google.maps.Size(90, 50));

            var marker = new google.maps.Marker({
               position : new google.maps.LatLng(parseFloat(no.lat),
                     parseFloat(no.lng)),
               icon : homeIcon,
               label : no.aptName,
               title : no.aptName
            });

            marker
                  .addListener(
                        'click',
                        function() {
                           map.setZoom(17);
                           map.setCenter(marker.getPosition());

                           var contentString = '<div style="color: black;"> '
                                 + '<h2 style="color: black;">'
                                 + no.aptName
                                 + '</h2>'
                                 + '매물번호 : '
                                 + no.no
                                 + '</br>'
                                 + '매물 동 : '
                                 + no.dong
                                 + '</br>'
                                 + '건축년도 : '
                                 + no.buildYear
                                 + '</br>'
                                 + '<a href="https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query='
                                 + no.aptName
                                 + '">자세한 정보 보기</a>'
                                 +	 
                                 '</div>';
                           var markerMaxWidth = 300;

                           var infowindow = new google.maps.InfoWindow(
                                 {
                                    content : contentString,
                                    maxWizzzdth : markerMaxWidth
                                 });
                           infowindow.open(map, marker);

                        });
            marker.setMap(map);
         }

         // CCTV 마커
         function addCCTVMarker(tmpLat, tmpLng, name) {
            var cctvIcon = new google.maps.MarkerImage(
                  "images/icon/cctv.png", null, null, null,
                  new google.maps.Size(50, 37));

            var marker = new google.maps.Marker({
               position : new google.maps.LatLng(parseFloat(tmpLat),
                     parseFloat(tmpLng)),
               title : name,
               icon : cctvIcon
            });
            marker.setMap(map);
         }

         // Park 마커
         function addParkMarker(tmpLat, tmpLng, name) {
            var cctvIcon = new google.maps.MarkerImage(
                  "images/icon/tree.png", null, null, null,
                  new google.maps.Size(50, 37));

            var marker = new google.maps.Marker({
               position : new google.maps.LatLng(parseFloat(tmpLat),
                     parseFloat(tmpLng)),
               title : name,
               icon : cctvIcon
            });
            marker.setMap(map);
         }

         // 문화시설 마커
         function addFacilityMarker(tmpLat, tmpLng, name, type) {
            var imgsrc = "images/icon/map_facility.png";
            if (type == '도서관')
               imgsrc = "images/icon/library.png";
            else if (type == '미술관')
               imgsrc = "images/icon/art.png";
            else if (type == '박물관/기념관')
               imgsrc = "images/icon/museum.png";
            else if (type == '공연장')
               imgsrc = "images/icon/concert.png";

            var cctvIcon = new google.maps.MarkerImage(imgsrc, null, null,
                  null, new google.maps.Size(50, 37));

            var marker = new google.maps.Marker({
               position : new google.maps.LatLng(parseFloat(tmpLat),
                     parseFloat(tmpLng)),
               title : name,
               icon : cctvIcon
            });
            marker.setMap(map);
         }
         
      </script>
   </div>


   <!-- Footer -->
   <footer id="footer">
      <div class="inner">
         <ul class="icons">
            <li><a href="#" class="icon brands alt fa-twitter"><span
                  class="label">Twitter</span></a></li>
            <li><a href="#" class="icon brands alt fa-facebook-f"><span
                  class="label">Facebook</span></a></li>
            <li><a href="#" class="icon brands alt fa-instagram"><span
                  class="label">Instagram</span></a></li>
            <li><a href="#" class="icon brands alt fa-github"><span
                  class="label">GitHub</span></a></li>
            <li><a href="#" class="icon brands alt fa-linkedin-in"><span
                  class="label">LinkedIn</span></a></li>
         </ul>
         <ul class="copyright">
            <li>&copy; Untitled</li>
            <li>Design: <a href="https://html5up.net">HTML5 UP</a></li>
         </ul>
      </div>
   </footer>
</div>


   <!-- Scripts -->
   <script src="assets/js/jquery.min.js"></script>
   <script src="assets/js/jquery.scrolly.min.js"></script>
   <script src="assets/js/jquery.scrollex.min.js"></script>
   <script src="assets/js/browser.min.js"></script>
   <script src="assets/js/breakpoints.min.js"></script>
   <script src="assets/js/util.js"></script>
   <script src="assets/js/main.js"></script>

</body>
</html>