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


  <link rel="stylesheet" href="/css/style.css"/>


  <title>Project Manager</title>
</head>
<body>
<div class="container text-center">
  <h1>Course Platform - Instructors</h1>
</div>
<div class="container d-flex justify-content-around">
  <form:form action="/register" method="post" modelAttribute="newUser">
    <table>
      <thead>
      <tr>
        <td>New Instructor</td>
      </tr>
      </thead>
      <thead>
      <tr>
        <td class="float-left">User Name:</td>
        <td class="float-left">
          <form:errors path="userName" class="text-danger"/>
          <form:input class="input" path="userName"/>
        </td>
      </tr>
      <tr>
        <td class="float-left">Email:</td>
        <td class="float-left">
          <form:errors path="email" class="text-danger"/>
          <form:input class="input" path="email"/>
        </td>
      </tr>
      <tr>
        <td class="float-left">Password:</td>
        <td class="float-left">
          <form:errors path="password" class="text-danger"/>
          <form:password path="password"/>
          <!-- <form:input class="input" path="password"/> -->
        </td>
      </tr>
      <tr>
        <td class="float-left">Confirm PW:</td>
        <td class="float-left">
          <form:errors path="confirm" class="text-danger"/>
          <form:password path="confirm"/>
          <!-- <form:input class="input" path="password"/> -->
        </td>
      </tr>
      <tr>
        <td><input class="input btn btn-success" type="submit" value="Submit"/></td>
      </tr>
      </thead>
    </table>
  </form:form>
  <form:form action="/login" method="post" modelAttribute="newLogin">
    <table>
      <thead>
      <tr>
        <td>Log In</td>
      </tr>
      </thead>
      <thead>
      <tr>
        <td class="float-left">Email:</td>
        <td class="float-left">
          <form:errors path="email" class="text-danger"/>
          <form:input class="input" path="email"/>
        </td>
      </tr>
      <tr>
        <td class="float-left">Password:</td>
        <td class="float-left">
          <form:errors path="password" class="text-danger"/>
          <form:password path="password"/>
          <!-- <form:input class="input" path="password"/> -->
        </td>
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