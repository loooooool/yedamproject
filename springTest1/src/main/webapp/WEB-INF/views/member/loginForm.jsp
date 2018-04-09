<%@page contentType="text/html; charset=EUC-KR" %>
<body class="app flex-row align-items-center">
<form action="login" name="form1" method="post">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="card-group">
          <div class="card p-4">
            <div class="card-body">
              <h1>Login</h1>
              <p class="text-muted">Sign In to your account</p>
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text"><i class="icon-user"></i></span>
                </div>
                <input type="text" class="form-control" placeholder="Username" name="member_id" >
              </div>
              <div class="input-group mb-4">
                <div class="input-group-prepend">
                  <span class="input-group-text"><i class="icon-lock"></i></span>
                </div>
                <input type="password" class="form-control" placeholder="Password" name="pwd">
              </div>
              <div class="row">
                <div class="col-6">
                  <button type="submit" class="btn btn-primary px-4">Login</button>
                </div>
                <input type="submit" value="login">
                <div class="col-6 text-right">
                  <button type="submit" class="btn btn-link px-0">Forgot password?</button>
                </div>
              </div>
            </div>
          </div>
         
        </div>
      </div>
    </div>
  </div>
</form>

    
  <!-- Bootstrap and necessary plugins -->
  <script src="../../node_modules/jquery/dist/jquery.min.js"></script>
  <script src="../../node_modules/popper.js/dist/umd/popper.min.js"></script>
  <script src="../../node_modules/bootstrap/dist/js/bootstrap.min.js"></script>

</body>