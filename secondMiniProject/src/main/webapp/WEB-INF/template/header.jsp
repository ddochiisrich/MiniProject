<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<!-- header -->
<div class="row" id="global-header">
	<div class="col">
		<div class="row align-items-center">
			<div class="col-2 text-end">
				<a href="main">
					<img src="./resources/images/logo.png" class="w-50">
				</a>	
			</div>
			<div class="col-7 text-end">
				<a href="#" class="link-dark link-underline-opacity-0">SIGN IN</a>
				&nbsp;|&nbsp;
				<a href="#" class="link-dark link-underline-opacity-0">SIGN UP</a>

			</div>
			<div class="col-3 text-start">
				<img src="https://via.placeholder.com/50" class="rounded-circle">
				&nbsp;
				<span>USERNAME</span>
				&nbsp;
				<button class="btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight"><i class="bi bi-list"></i></button>

					<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
					  <div class="offcanvas-header">
					    <h5 class="offcanvas-title" id="offcanvasRightLabel">MENU</h5>
					    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
					  </div>
					  <div class="offcanvas-body">
					    CONTENT
					  </div>
					</div>
			</div>
		</div>
	</div>
</div>


