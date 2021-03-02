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
                        <form action="">
                            <div class="row form-group">
                                <div class="col-sm-6">
                                   <input type="text" placeholder="First Name" class="form-control" required>
                                </div>
                                <div class="col-sm-6"> 
                                   <input type="text" placeholder="Last Name" class="form-control" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="email" placeholder="Email" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <input type="password" placeholder="Password" class="form-control" required>
                            </div>
                            <div class="form-group">
                               <div class="">
                                 <div class="custom-file">
                                    <input type="file" name="image" class="custom-file-input">
                                    <label class="custom-file-label" for="customFile">Upload Picture</label>
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

    </html>