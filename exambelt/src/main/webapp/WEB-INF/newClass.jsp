<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <!-- for Bootstrap CSS -->
  <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
  <!-- YOUR own local CSS -->
  <link rel="stylesheet" href="/css/style.css" />
  <!-- For any Bootstrap that uses JS or jQuery-->
  <script src="/webjars/jquery/jquery.min.js"></script>
  <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
  <title>Create a course</title>
</head>
<body>
<div class="container p-1">
  <div class="in-line">
    <h2 class="float-left">
      <a href="/classes" class="btn btn-primary">Back to schedule</a>
    </h2>
  </div>
  <h1>Create a course</h1>
  <form:form action="/new" method="post" modelAttribute="yoga">
    <table>
      <thead>
      <tr>
        <td class="float-left">Name:</td>
        <td class="float-left"><form:errors path="name"
                                            class="text-danger" /> <form:input class="input" path="name" />
        </td>
      </tr>
      <tr>
        <td class="float-left">Day of week:</td>
        <td class="float-left"><form:errors path="weekday"
                                            class="text-danger" /> <form:input class="input" path="weekday" />
        </td>
      </tr>
      <tr>
        <td class="float-left">Drop-in price:</td>
        <td class="float-left"><form:errors path="price"
                                            class="text-danger" /> <form:input type="number" class="input" path="price"/>
        </td>
      </tr>


      <td class="float-left">Description:</td>
        <td class="float-left"><form:errors path="description"
                                            class="text-danger" /> <form:textarea rows="3" class="input" path="description" />
        </td>
      </tr>
      <tr>
        <td><input class="input btn btn-success" type="submit" value="Submit" /></td>
      </tr>
      </thead>
    </table>
  </form:form>
</div>
</body>
</html>