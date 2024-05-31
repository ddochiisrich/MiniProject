<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row" id="global-content">
	<div class="col">
		<form class="my-5" id="loginForm" action="login" method="post">
			<div class="row my-3 text-center">
				<div class="col">
					<img src="./resources/images/logo.png" style="width: 250px; height: 250px;">
				</div>
			</div>
			<div class="offset-4">
				<div class="input-group has-validation">
					<span class="input-group-text" style="width: 100px;">ID</span>
			  		<div class="form-floating is-invalid">
			    		<input type="text" class="form-control is-invalid" style="width: 300px;" id="userId" name="userId" placeholder="Userid" required>
			    		<label for="userId">User ID</label>
			  		</div>
				 	<div class="invalid-feedback" id="please1">
				    	Please choose a username.
				  	</div>
				</div>
				<div class="input-group has-validation">
					<span class="input-group-text" style="width: 100px;">PASS</span>
			  		<div class="form-floating is-invalid">
			    		<input type="password" class="form-control is-invalid" style="width: 300px;" id="userPass" name="pass" placeholder="Userpass" required>
			    		<label for="userpass">User Password</label>
			  		</div>
				 	<div class="invalid-feedback" id="please2">
				    	Please choose a userpassword.
				  	</div>
				</div>
				<div class="row">
					<div class="col-2 offset-2 my-5">
						<input type="submit" value="로그인" id="btnLogin" class="btn btn-success w-100 h-100"/>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>