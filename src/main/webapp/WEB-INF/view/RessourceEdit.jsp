<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
    crossorigin="anonymous">
<title>Edit Resource</title>
</head>
<body>

    <%@ include file="navbar.jsp" %>
    
    <div class="container my-5 p-5" style="border:1px solid black;">
        <h4 class="text-center">Edit Resource</h4>
        <form class="col-md-4 offset-md-4" action="saveRessource" method="post">
            
            <!-- Hidden field for ID (sent with form but not visible) -->
            <input type="hidden" name="id" value="${p.id}"/>
            
            <!-- ID field, disabled -->
            <div class="mb-3">
                <label for="id" class="form-label">ID</label>
                <input class="form-control" type="text" id="id" placeholder="Disabled input" aria-label="Disabled input example" disabled value="${p.id}">
            </div>
            
            <!-- SIM field, editable -->
            <div class="mb-3">
                <label for="sim" class="form-label">SIM</label>
                <input type="text" class="form-control" id="sim" name="sim" value="${p.sim}">    
            </div>
            
            <!-- MSISDN field, editable -->
            <div class="mb-3">
                <label for="msisdn" class="form-label">MSISDN</label>
                <input type="text" class="form-control" id="msisdn" name="msisdn" value="${p.msisdn}">    
            </div>
            
            <!-- Submit button -->
            <center><button type="submit" class="btn btn-primary">Submit</button></center>
        </form>
    </div>

    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>

</body>
</html>
