<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="container containerSize" style="padding:0;">
		<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between mb-4">
			<div class="col-md-3 mb-2 mb-md-0">
				<a href="index.jsp" class="d-inline-flex link-body-emphasis text-decoration-none">
					<svg xmlns="http://www.w3.org/2000/svg" width="100" height="45" viewBox="0 0 100 45">
						<image href="img/logo/logo_text.png" width="100" height="45"></image>
					</svg>
				</a>
			</div>            
			<div class="col-md-3 text-end">
				<button type="button" class="btn my-button1">
					<svg style="width:1.5rem; height:1.5rem;">
                       	<image href="img/logo/icons8-user-profile-32.png" width="24" height="24">
					</svg>
					<span style="font-size:1rem; line-height:1.5rem; text-overflow: ellipsis; white-space: nowrap;overflow: hidden;">
                       	로그인
					</span>
				</button>
			</div>
		</header>           
	</div>
	<!-- Login Modal -->
	    <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
	        <div class="modal-dialog custom-modal" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="loginModalLabel">Login</h5>
	                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">&times;</span>
	                    </button>
	                </div>
	                <div class="modal-body">
	                    <!-- Login Form -->
	                    <form>
	                        <div class="form-group">
	                            <label for="username">Username</label>
	                            <input type="text" class="form-control" id="username" placeholder="Enter your username">
	                        </div>
	                        <div class="form-group">
	                            <label for="password">Password</label>
	                            <input type="password" class="form-control" id="password" placeholder="Enter your password">
	                        </div>
	                        <button type="submit" class="btn btn-primary w-100">Login</button>
	                    </form>
	                </div>
	            </div>
	        </div>
	    </div>
	    <!-- Login Modal end -->