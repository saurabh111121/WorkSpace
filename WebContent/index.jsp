<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1">
        <title>WorkSpace</title>
        <jsp:include page="generalHeaderImports.jsp"></jsp:include>
    </head>
    <jsp:include page="header.jsp"></jsp:include>

    <body>
        <br />
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-8"></div>
                <div class="col-sm-4">
                    <div class="jumbotron" style="border: 2px;">
                        <form action="" id="registerForm" class="needs-validation" novalidate>
                            <div class="row form-group">
                                <div class="col-sm-6">
                                   <input type="text" placeholder="First Name" id="fname_id" name="fname" class="form-control" required>
                                </div>
                                <div class="col-sm-6"> 
                                   <input type="text" placeholder="Last Name" id="lname_id" name="lname" class="form-control" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="email" placeholder="Email" id="email_id" name="email" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <input type="password" placeholder="Password" id="password_id" name="passowrd" class="form-control" required>
                            </div>
                            <div class="form-group">
                               <div class="">
                                 <div class="custom-file">
                                    <input type="file" id="image_id" name="image" class="custom-file-input">
                                    <label class="custom-file-label" for="customFile">Upload Picture(Optional)</label>
                                 </div>
                               </div>
                            </div>
                            <div class="text-center">
                               <button class="btn btn-success">Register</button>
                            </div>
                        </form>
                            

                    </div>
                </div>
                <div class="col-sm-2"></div>
            </div>


        </div>




    </body>
    <jsp:include page="generalFooterImports.jsp"></jsp:include>
    <script>
    (function () {
        window.addEventListener('load', function () {
            var forms = document.getElementsByClassName('needs-validation');
            var validation = Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                    if (form.checkValidity() == true) {
                        event.preventDefault();
                        let fn = $('#fname_id').val();
						let ln = $('#lname_id').val();
						let email = $('#email_id').val();
						let password = $('#password_id').val();
						$.post("RegisterServlet", {
							fname : fn,
							lname : ln,
							email : email,
							password : password
						}, function(data) {
							alert(data);
						});
                        //document.forms[0].reset();
                        document.getElementById("registerForm").reset(); 
                        document.getElementById('registerForm').classList.remove("was-validated");

                    }

                }, false); // end of function(event)
            });   //end of function(form)
        }, false); //end of  window.addEventListener('load', function () 
    })();  // end of funtion()
    </script>

    </html>