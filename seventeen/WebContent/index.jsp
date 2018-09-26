<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="net.board.db.*" %>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
	List boardList=(List)request.getAttribute("boardlist");
%>



<html>
 
<!-- Mirrored from seventeen-17.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 06 Dec 2017 07:16:36 GMT -->

<head>
  <title> SEVENTEEN Official website </title>
  	<meta name="Author" content="minee">
  	<meta name="Publisher" content="MyelHub">
  	<meta name="Description" content="">
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=9">
  	
  	<link type="text/css" rel="stylesheet" href="css/default.css" />
  	<script type="text/javascript" src="code.jquery.com/jquery-1.7.1.min.js"></script>
  	<script type="text/javascript" src="js/doorer.js"></script>
 </head>


<!-- 게시판 넣기 -->
<script language='javascript' type='text/javascript'>

		//<![CDATA[
		function doResize(id) 
		{ 
			var obj = (typeof(id)=='string')?document.getElementById(id):id; 
			obj.height = obj.contentWindow.document.body.scrollHeight; 
		}
		//]]> 
	</script>


 <body>

 <!--Wrap-->
 <div id="wrap">
 		
	<p class="m_top"><img src="image/main/main_blue.jpg"border="0" alt=""></p>
	<!--Header-->
	<div id="header_new">
		<ul class="m_menu">
			<li><img src="image/common/menu/menu_left.jpg"border="0" alt=""></li>
			<li><a href="Index.bo"><img src="image/common/menu/menu01.jpg" border="0" alt=""></a></li>
			<li><a href="Profile.bo"><img src="image/common/menu/menu02.jpg" border="0" alt=""></a></li>
			<li><a href="BoardList.bo"><img src="image/common/menu/menu03.jpg" border="0" alt=""></a></li>
			<li><a href="ShowSc.sc"><img src="image/common/menu/menu04.jpg" border="0" alt=""></a></li>			
			<li><a href="Vote.bo"><img src="image/common/menu/menu05.jpg" border="0" alt=""></a></li>			
			<li><a href="BoardList.bo3"><img src="image/common/menu/lnb01.jpg" border="0" alt=""></a></li>
			<li><a href="BoardList.bo4"><img src="image/common/menu/lnb02.jpg" border="0" alt=""></a></li>

				<%
					String ida = null;
					ida = (String) session.getAttribute("loggedID");
					System.out.println("세션에 저장된 아이디: " + ida);
					if (ida == null) 
					{
				%>		<li><a href="login_new.me">
						<img src="image/common/menu/lnb03.jpg" border="0" alt=""></a></li>
				<%
					} else {
				%>
						<li><a href="logoutaction.me">
						<img src="image/common/menu/lnb03_out.jpg" border="0" alt=""></a></li>
				<%
					}
				%>
			
			<li><img src="image/common/menu/menu_right.jpg"border="0" alt=""></li>		
		</ul>
	</div><!--END Header-->
	<iframe name="action_ifrm" id="action_ifrm" width="0" height="0" frameborder="0" ></iframe><!--Quick-->



<!--Container-->
<div id="container_m">
	<div class="m_com_left">
		<h1><img src="image/main/st_title01.jpg" width="312" height="72" border="0" alt=""></h1>
		<p class="m_youtube" style="width:456px; height:257px;">
			<iframe width="456" height="257" src="https://www.youtube.com/embed/CyzEtbG-sxY" frameborder="no" scrolling="no"></iframe>
		</p>
		<p class="m_text"><img src="upload/img/IMG20171024144849.jpg" target="_blank" >
		</p>
	</div>
	<div class="m_com_right">
		<ul class="media_bt">
			<li><a href="https://mobile.twitter.com/pledis_17" target="_blank"><img src="image/main/m_btn03.jpg" border="0" alt=""></a></li>
			<li><a href="https://www.facebook.com/seventeennews" target="_blank"><img src="image/main/m_btn02.jpg" border="0" alt=""></a></li>
			<li><a href="http://www.youtube.com/user/pledis17" target="_blank"><img src="image/main/m_btn01.jpg" border="0" alt=""></a></li>
		</ul>
		<h1><img src="image/main/r_st_title01.jpg" width="230" height="30" border="0" alt=""></h1>
		<p><a href="asp/profile.html"><img src="image/main/r_con_img01.jpg" width="460" height="176" border="0" alt=""></a></p>
		
		
		
		
		
		<div class="m_notice">
			<p class="notice_title"><img src="image/main/r_st_title02.jpg" border="0" alt=""><span class="mp_btn"><a href="BoardList.bo"><img src="image/main/r_con_plus.jpg" border="0" alt=""></a></span></p>
			
			<dl class="m_notice_con">
				
				
				<!-- 1) 만약 테이블에 값이 6개보다 적다면 전체출력을 해야 한다 -->
				<%
				if(boardList.size() < 6)
				{
					for(int i=0; i<boardList.size(); i++) 
					{
						BoardBean bl=(BoardBean)boardList.get(i);
				%>	
					<dt>
						<a href="./BoardDetailAction.bo?num=<%=bl.getBOARD_NUM()%>">
							<%=bl.getBOARD_SUBJECT()%>
						</a>					
					</dt>
					
					<dd> <%=bl.getBOARD_DATE() %> </dd>
				<%  } 
				}
				
				
				
				// 2) 만약 테이블에 값이 6개보다 많다면 6개만 출력해야 한다 -->
				else
				{
					for(int i=0; i<6; i++) 
					{
						BoardBean bl=(BoardBean)boardList.get(i);
				%>	
					<dt>
						<a href="./BoardDetailAction.bo?num=<%=bl.getBOARD_NUM()%>">
							<%=bl.getBOARD_SUBJECT()%>
						</a>					
					</dt>
					
					<dd> <%=bl.getBOARD_DATE() %> </dd>
				<%  } 
				}
				%>
					
				
						

				
			</dl>
			
		</div>
		<p class="mt25">
		<a href="http://www.pledis.co.kr/" target="_blank"><img src="image/main/l_con_bottom.png" border="0" alt=""></a>
		</p>
	</div>
</div><!--END Container-->

	<!--Footer-->
	<div id="footer">
		<p class="pt20 pb20">Seventeen Copyright 2013 PLEDIS Co.,Ltd. All Rights Reserved.</p>
	</div><!--END Footer-->
	
 </div><!--END Wrap-->
  
 </body>

<!-- Mirrored from seventeen-17.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 06 Dec 2017 07:17:04 GMT -->
</html>
<script type="text/javascript">


function setCookie(name,value,expiredays) {	
	var today = new Date();
	today.setDate(today.getDate()+expiredays);
	document.cookie = name + "=" + escape(value) + "; path=/; expires=" + today.toGMTString() + ";";
}

function getCookie( name ) {
   var nameOfCookie = name + "="; 
   var x = 0; 
   while ( x <= document.cookie.length ) 
   { 
		   var y = (x+nameOfCookie.length); 
		   if ( document.cookie.substring( x, y ) == nameOfCookie ) { 
				   if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 ) 
						   endOfCookie = document.cookie.length; 
				   return unescape( document.cookie.substring( y, endOfCookie ) ); 
		   } 
		   x = document.cookie.indexOf( " ", x ) + 1; 
		   if ( x == 0 ) 
				   break; 
   } 
   return ""; 
}



var popups = "".split(",");

function popupLocationGo(url, target){
	if (target == 1) //遺�紐⑥갹... ��湲곕�� ���� ����李�
	{
		location.href= url;
	}
	else
	{
		window.open(url, '', '');
	}
}

function layerPopupDisplay(obj){
//	alert(obj);
//	return;
	$("#" + obj).css("display", "none");
}

$(function(){
	$(popups).each(function(n){		
		
		var this_name = popups[n].substring(0, popups[n].lastIndexOf("_"));
		var this_type = popups[n].substring(popups[n].lastIndexOf("_") + 1, popups[n].length);
		var this_idx = popups[n].split("_")[1];
		
		if (getCookie(this_name) != "no")
		{
			if (this_type == 1) // ������
			{
				window.open('popup/img_popupfa50.html?seq='+this_idx, 'tomato_popup_'+n, 'width=50, height=50, left=0, top=0, toolbar=no, menubar=no, scrollbars=no');
			}
			else //���댁�댄��
			{		
				$.get("popup/layer_popup.html", {seq:this_idx}, function(data){$(window.document.body).append(data);});				
			}
		}		
	});
});
</script>