<%-- 
    Document   : success
    Created on : Apr 22, 2018, 1:02:06 AM
    Author     : User
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${requestScope.is_success_invoice == false}">
            <c:set var="error_message" value="${requestScope.error_message}"></c:set>
            <h1>Ghế ${error_message} đã có người đặt.</h1>
        </c:if>
    </body>
    <c:if test="${requestScope.is_success_invoice == true}">
        <script>
            alert('Insert invoice successfully');
        </script>
    </c:if>

</html>
