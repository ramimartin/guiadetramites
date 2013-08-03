<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="springSecurity.login.title"/></title>
	<style type='text/css' media='screen'>
	      /* Override some defaults */
    
      .container {
        width: 300px;
      }

      /* The white background content wrapper */
      .container > .content {
        background-color: #fff;
        padding: 20px;
        margin: 0 -20px; 
        -webkit-border-radius: 10px 10px 10px 10px;
           -moz-border-radius: 10px 10px 10px 10px;
                border-radius: 10px 10px 10px 10px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.15);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.15);
                box-shadow: 0 1px 2px rgba(0,0,0,.15);
      }

	  .login-form {
		margin-left: 65px;
	  }
	
	  legend {
		margin-right: -50px;
		font-weight: bold;
	  	color: #404040;
	  }
	</style>
	<r:require modules="bootstrap"/>
</head>
<body>
  <div class="container">
	<div class="content">
			<g:if test='${flash.message}'>
				<div class="alert alert-error">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
				
					<div class='login_message'>${flash.message}</div>
				</div>	
			</g:if>
    <div class="row">
      <div class="login-form">
        <h2><g:message code="login.auth.form"/></h2>
	<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
          <fieldset>
            <div class="clearfix">
              <input type="text" placeholder="<g:message code="login.auth.user"/>" class='text_' name='j_username' id='username'>
            </div>
            <div class="clearfix">
              <input type="password" placeholder="<g:message code="login.auth.pass"/>" class='text_' name='j_password' id='password'>
            </div>
           
            <div id="remember_me_holder">
		<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
		<label for='remember_me'><g:message code="login.auth.form"/></label>
	  </div>
	  <br />
            
            <button class="btn primary" type="submit"><g:message code="login.auth.login"/></button>
          
          </fieldset>
        </form>
      </div>
      </div>
    </div>
  </div> <!-- /container -->
 <!-- 
<div id='login'>
	<div class='inner'>


		<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
			<p>
				<label for='username'><g:message code="springSecurity.login.username.label"/>:</label>
				<input type='text' class='text_' name='j_username' id='username'/>
			</p>

			<p>
				<label for='password'><g:message code="springSecurity.login.password.label"/>:</label>
				<input type='password' class='text_' name='j_password' id='password'/>
			</p>

			<p id="remember_me_holder">
				<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
				<label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
			</p>

			<p>
				<input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>
			</p>
		</form>
	</div>
</div>
 -->
<script type='text/javascript'>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>
</body>
</html>
