<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.java.user.UserDTO" %>
   <%
   request.setCharacterEncoding("utf-8");
   UserDTO udto = (UserDTO)session.getAttribute("userinfo");
	%>
    <link rel="stylesheet" href="css/mycss.css">
    <link rel="stylesheet" href="css/bs/bootstrap.css">
	<div class="container containerSize" style="padding:0;">
		<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between mb-4">
			<div class="col-md-3 mb-2 mb-md-0">
				<a href="index.jsp" class="d-inline-flex link-body-emphasis text-decoration-none">
					<svg xmlns="http://www.w3.org/2000/svg" width="100" height="45" viewBox="0 0 100 45">
						<image href="img/logo/logo_text.png" width="100" height="45"></image>
					</svg>
				</a>
			</div>            
			<div class="col-md-3 text-end position-relative" >
				<%if(udto == null){ %>
				<button id="login-button" type="button" class="btn my-button1">
					<svg style="width:1.5rem; height:1.5rem;">
                       	<image href="img/logo/icons8-user-profile-32.png" width="24" height="24">
					</svg>
					<span style="font-size:1rem; line-height:1.5rem; text-overflow: ellipsis; white-space: nowrap;overflow: hidden;">
                     	로그인  
					</span>
				</button>
				<%} else{ 
				%>
				<button id="user-button" type="button" class="btn my-button1 dropdown-toggle">
					<svg height="1.5rem" width="1.5rem">
  						<circle cx="0.75rem" cy="0.75rem" r="0.75rem" fill="url(#img/logo/icons8-user-profile-32.png)" />
  						<image x="0" y="0" width="1.5rem" height="1.5rem" href="img/logo/icons8-user-profile-32.png" />
					</svg>
					<span style="font-size:1rem; line-height:1.5rem; text-overflow: ellipsis; white-space: nowrap;overflow: hidden;">
                    	<%if(udto.getIsAdmin()){%>
							관리자
						<%}else{%>
							<%=udto.getUserNName() %>
						<%} %> 
					</span>
				</button>
				<ul id="user-dropdown" class="dropdown-menu position-absolute mx-0 shadow " data-bs-theme="light" style="width:9rem;left:9.56rem;display:none">
				    <li>
						<a class="dropdown-item d-flex gap-2 align-items-center" href="#">
				        	<svg class="bi" width="16" height="16"><use xlink:href="#files"></use></svg>
				        	예약 현황
				      	</a>
				    </li>
				    <li>
				      	<a class="dropdown-item d-flex gap-2 align-items-center" href="#">
				        	<svg class="bi" width="16" height="16"><use xlink:href="#image-fill"></use></svg>
				        	계정
				      	</a>
				    </li>
				    <li>
				      	<a class="dropdown-item d-flex gap-2 align-items-center" href="#">
				        	<svg class="bi" width="16" height="16"><use xlink:href="#film"></use></svg>
				        	예약 관리
				      	</a>
				    </li>
				    <li>
				      	<a class="dropdown-item d-flex gap-2 align-items-center" href="#">
				        	<svg class="bi" width="16" height="16"><use xlink:href="#music-note-beamed"></use></svg>
				        	리뷰 작성
				      	</a>
				    </li>
				    <%if(udto.getIsAdmin()){%>
				    <li>
				      	<a class="dropdown-item d-flex gap-2 align-items-center" href="#">
				        	<svg class="bi" width="16" height="16"><use xlink:href="#joystick"></use></svg>
				        	유저관리
				      	</a>
				    </li>
				    <%} %>
				    <li><hr class="dropdown-divider"></li>
				    <li>
				      	<a id="logout-button" class="dropdown-item dropdown-item-danger d-flex gap-2 align-items-center" href="index.jsp">
				        	<svg class="bi" width="16" height="16"><use xlink:href="#trash"></use></svg>
				        	로그아웃
				      	</a>
				    </li>
				</ul>
				<%} %>
			</div>
		</header>
	</div>
</header>