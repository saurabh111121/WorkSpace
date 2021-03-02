<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="ISO-8859-1">
    <title>header</title>
  </head>

  <body>

    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
      <a class="navbar-brand" href="home">WorkSpace</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample03"
        aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarsExample03">

        <ul class="navbar-nav mr-auto">
        </ul>

        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="#" data-toggle="modal" data-target="#loginModal">Login</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#" data-toggle="modal" data-target="#registerModal">Register</a>
          </li>
        </ul>

      </div>
    </nav>

    <!-- login Modal -->
    <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
      aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Login</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form action="servlet/login" class="needs-validation" novalidate>
              <div class="form-group">
                <input type="text" name="emailMobile" id="emailMobile" placeholder="Email address or phone number" class="form-control"
                  required>
              </div>
              <div class="form-group">
                <input type="password" name="loginPassword" id="loginPassword" placeholder="Password" class="form-control" required>
              </div>
              <div class="form-group">
                <a href="resetPassword.jsp">Forgotten password?</a>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary">Login</button>
          </div>
        </div>
      </div>
    </div>



    <!-- Register Modal -->
    <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
      aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Register</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form action="servlet/Register" method="POST">
              <div class="row form-group">
                <div class="col-sm-6">
                  <input type="text" name="fname" id="fname" placeholder="First Name" class="form-control" required>
                </div>
                <div class="col-sm-6">
                  <input type="text" name="lname" id="lname" placeholder="Surname" class="form-control" required>
                </div>
              </div>
              <div class="form-group">
                <input type="text" name="emailMobile" id="emailMobile" placeholder="Mobile number or Email address" class="form-control"
                  required>
              </div>
              <div class="form-group">
                <input type="password" name="newPassword" id="newPassword" placeholder="New Password" class="form-control" required>
              </div>
              <div class="form-group">
                <input type="password" name="rePassword" id="rePassword" placeholder="Re-enter Password" class="form-control" required>
              </div>
            </form>
          </div>
          <div class="form-group mx-auto">
            <button type="button" class="btn btn-primary">Sign Up</button>
          </div>
        </div>
      </div>
    </div>
    
    


  </body>

  </html>