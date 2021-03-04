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
                <div class="col-sm-8">
                   <div class="container">
                      <div class="">
                         <button class="btn btn-info" id="btnDisplay">Display Register User</button>
                       </div>
                       <br/>
                      <div class="">
                          <table id="displayTable" class="display table-responsive-md table-bordered" style="width:100%">
                           
			         	  </table> 
                      </div>
                  </div>
                
                
                </div>
                <div class="col-sm-4">
                    <div class="jumbotron" style="border: 2px;">
                        <form id="registerForm" class="needs-validation" novalidate>
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
                                <input type="password" placeholder="Password" id="password_id" name="password" class="form-control" required>
                            </div>
                            <div class="form-group">
                                 <div class="custom-file">
                                    <input type="file" id="image_id" name="image" class="custom-file-input" required>
                                    <label class="custom-file-label" for="customFile">Upload Picture</label>
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
    $(".custom-file-input").on("change", function () {
        var fileName = $(this).val().split("\\").pop();
        $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
     });
    
    function postFilesData(data) {
        $.ajax({
            url :  'RegisterServlet',
            type : 'POST',
            data : data,
            cache : false,
            dataType : 'json',
            processData : false,
            contentType : false,
            /*    
            success : function(data, textStatus, jqXHR) {
                alert(data);
            },
            error : function(jqXHR, textStatus, errorThrown) {
                alert('ERRORS: ' + textStatus);
            }
            */
            
        });
    }
    
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
						let image = $('#image_id').val();

					    //var xdata = {fname : fn,lname : ln,email : email,password : password,image : image};
					    
					    var x = document.getElementById('registerForm');
                        var data = new FormData(x);
					    postFilesData(data)
						
						/*
						$.post("RegisterServlet", {
							fname : fn,
							lname : ln,
							email : email,
							password : password,
							image : image
						}, function(data) {
							alert(data);
						});
                        */
						
                        document.getElementById("registerForm").reset(); 
                        document.getElementById('registerForm').classList.remove("was-validated");

                    }

                }, false); // end of function(event)
            });   //end of function(form)
        }, false); //end of  window.addEventListener('load', function () 
    })();  // end of funtion()
    
    $('#btnDisplay').click(function() {
		$.get("RegisterServlet", function(data) {
			//alert(data);
			var dataSet = JSON.parse(data);
			dataSet = dataSet.data;

			$('#displayTable').DataTable({
				data : dataSet,
				"searching" : false,
				"bPaginate" : false,
				"bFilter" : false,
				"bInfo" : false,
				columns : [ {
					title : "Fist Name"
				}, {
					title : "Last Name"
				}, {
					title : "Email"
				}, {
					title : "Password"
				},{
					title : "Image"
				} ],
				"columnDefs": [{
                    "targets": -1,
                    "data": null,
                    "mRender": function (data, type, full) {
                        return '<img src=" '+ data[4] + ' " >';
                    }
                }]
			
			});

		});
	});
    
    </script>

    </html>