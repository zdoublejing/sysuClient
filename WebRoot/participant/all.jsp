<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>

<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>SYSU Client: all participants</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Based on yawl resourceService">
    <meta name="author" content="sysu">

    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" media="screen">
    <style>
      body {
        padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
      }
      .sidebar-nav {
        padding: 9px 0;
      }
    </style>
    <link href="../css/bootstrap-responsive.min.css" rel="stylesheet">
  </head>

  <body>

    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="#">Sysu Wfclient</a>
          <div class="nav-collapse collapse">
            <p class="navbar-text pull-right">
              Logged in as <a href="#">${sessionScope.userid}</a>
            </p>
            <ul class="nav">
              <li><a href="../workitems.html">任务队列</a></li>
              <li><a href="../cases.html">流程管理</a></li>
              <li class="active"><a href="all.action">资源管理</a></li>
              <li><a href="../interfaces.html">服务管理</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

    <div class="container-fluid">
	    <div class="row-fluid">
	        <div class="span3">
	          <div class="well sidebar-nav">
	            <ul class="nav nav-list">
	              <li class="active"><a href="all.action">所有用户</a></li>
	              <li class="nav-header">用户属性管理</li>
	                <li><a href="#">职位/组织</a></li>
	                <li><a href="#">角色</a></li>
	                <li><a href="#">能力</a></li>
	              <li class="nav-header">其他</li>
	              	<li><a href="#">所有非人力资源</a></li>
	            </ul>
	          </div><!--/.well -->
	        </div>
	        
	        <div class="span9">
		    	<form target="_blank" action="info.action" method="post"><fieldset><legend>所有用户</legend>
		   		<div class="btn-group" style="float: left;">
		        	<button class="btn" type="submit">查看/修改</button>
		        	<a class="btn" target="_blank" href="create.action">新增</a>
		       	</div>
		        
		        <div style="height:350px;"><table class="table table-hover">
		        	<thead>
			        	<tr>
			        	<th>#</th>
			        	<th>User ID</th>
			        	<th>First Name</th>
			        	<th>Last Name</th>
			        	</tr></thead>     	
			        <tbody>
			        <s:iterator id="participant" value="%{allParticipants}">
			        <tr>
				        <td><input type="radio" name="infoSelect" value="${participant.getUserID()}"></td>
				        <td><s:property value="#participant.getUserID()"/></td>
				        <td><s:property value="#participant.getFirstName()"/></td>
				        <td><s:property value="#participant.getLastName()"/></td>
			        </tr>
			        </s:iterator></tbody></table></div>
			        
			  	<div class="pagination pagination-left">
			    	<ul>
			        <li><a href="#">Prev</a></li>
			        <li><a href="#">1</a></li>
			        <li><a href="#">2</a></li>
			        <li><a href="#">3</a></li>
			        <li><a href="#">4</a></li>
			        <li><a href="#">5</a></li>
			        <li><a href="#">Next</a></li>
			      	</ul></div>
		      	</fieldset></form>
	      	</div>
	      	
	    </div>
      
      	<hr>
      	<footer>
          <p>© Workflow Lab 2013</p>
      	</footer>
    </div> <!-- /container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>


</body></html>