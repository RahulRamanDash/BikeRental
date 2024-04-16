<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<f:view>
<html>
<head>
<title>Login</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Poppins", sans-serif;
}
body{
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background-color: black;
  background-size: cover;
  background-position: center;
}
.logo{
	color: white;
	text-decoration: none;
}
.wrapper{
  width: 420px;
  background: transparent;
  border: 1px solid white;
  backdrop-filter: blur(4px);
  color: #fff;
  border-radius: 12px;
  padding: 30px 40px;
}

.wrapper h1{
  font-size: 36px;
  text-align: center;
}

.wrapper .input-box{
  position: relative;
  width: 100%;
  height: 50px;
  margin: 30px 0;
}

.input-box input{
  width: 100%;
  height: 100%;
  background: transparent;
  border: none;
  outline: none;
  border: 1px solid white;
  border-radius: 40px;
  font-size: 16px;
  color: #fff;
  padding: 20px 45px 20px 20px;
  text-align: center;
}

.input-box input::placeholder{
  color: #fff;
}

.wrapper .checkbox1{
  display: flex;
  justify-content: space-between;
  font-size: 14.5px;
  margin: -15px 0 15px;
}

.checkbox1 label input{
  accent-color: #fff;
  margin-right: 3px;
}

.checkbox1 a{
  color: #fff;
  text-decoration: none;
}

.checkbox1 a:hover{
  text-decoration: underline;
}

.wrapper .btn{
  width: 100%;
  height: 45px;
  background: #fff;
  border: none;
  outline: none;
  border-radius: 40px;
  border: 1px solid white;
  box-shadow: 0 0 10px rgba(0, 0, 0, .1);
  cursor: pointer;
  font-size: 16px;
  color: #333;
  font-weight: 600;
}

.wrapper .link{
  font-size: 14.5px;
  text-align: center;
  margin: 20px 0 15px;
}

.link p a{
  color: #fff;
  text-decoration: none;
  font-weight: 600;
}

.link p a:hover{
  text-decoration: underline;
}

.inputBx{
    position: relative;
    width: 100%;
}

.input-box i {
    position: absolute;
    left: 37%;
    padding: 15px 0;
    font-style: normal;
    font-size: 20px;
    color: #aaa;
    transition: 0.5s;
    pointer-events: none;
    transform-origin: left top;
}
</style>

<script>
    $(document).ready(function() {
        // Check for focus on all input fields within elements with class 'inputBx'
        $('.input-box input').on('focus', function() {
            $(this).siblings('i').css({
                opacity: 0,
                transition: 'opacity 0.3s ease'
            });
        }).on('blur', function() {
            if (!$(this).val()) {
                $(this).siblings('i').css({
                    opacity: 1,
                    transition: 'opacity 0.5s ease'
                });
            }
        });
    });
</script>


</head>
<body>
<h:form id="form">
	<div class="wrapper" id="loginFormContent">
			<h1 class="logo">Login</h1>
			<div class="input-box">
				<h:inputText id="username" value="#{user.username}" autocomplete="off"/>
				<i>Username</i>
			</div>
			<div class="input-box">
				<h:inputSecret id="passInput" value="#{user.password}"/>
	            <i>Password</i>
			</div>
			
			<div class="checkbox1">
				<label><input type="checkbox">Remember Me</label> <label
					for="forgotForm">Forgot Password</label>
			</div>
			<h:commandButton action="#{controller.userLogin(user)}" value="Login" styleClass="btn" />
			<div class="link">
				<p>
					Don't have an account? <label for="registerForm">Register</label>
				</p>
			</div>
	</div>
</h:form>
</body>
</html>
</f:view>