<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">

  <title>Edit Class</title>
</head>
<body>
<div class="container p-1">
  <h1>Edit ${yoga.name}</h1>
  <a href="/classes" class="btn btn-primary">Back to schedule</a>
  <form:form action="/classes/edit/${yoga.id}" method="post" modelAttribute="yoga">
    <input type="hidden" name="_method" value="put">
    <form:input type="hidden" name="user" path="user"/>
    <table>
      <thead>
      <tr>
        <td class="float-left">Name:</td>
        <td class="float-left">
          <form:errors path="name" class="text-danger"/>
          <form:input class="input" path="name"/>
        </td>
      </tr>
      <tr>
        <td class="float-left">Day of the week:</td>
        <td class="float-left">
          <form:errors path="weekday" class="text-danger"/>
          <form:input class="input" path="weekday"/>
        </td>
      </tr>
      <tr>
        <td class="float-left">Drop-in price:</td>
        <td class="float-left">
          <form:errors path="price" class="text-danger"/>
          <form:input type="number" class="input" path="price"/>
        </td>
      </tr>
      <tr>
        <td class="float-left">Description:</td>
        <td class="float-left">
          <form:errors path="description" class="text-danger"/>
          <form:textarea rows="3" class="input" path="description"/>
        </td>
      </tr>
      <tr>

      </tr>
      <tr>
        <td><input class="input btn btn-success" type="submit" value="Submit"/></td>
      </tr>
      </thead>
    </table>
  </form:form>
</div>
</body>
</html>