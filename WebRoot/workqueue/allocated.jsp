<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>SYSU Client: user workqueue</title>
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
              Logged in as <a href="#">User</a>
            </p>
            <ul class="nav">
              <li class="active"><a href="offered.action">任务队列</a></li>
              <li ><a href="./casesforuser.html">流程管理</a></li>
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
				  	<li class="nav-header">个人工作列表</li>
						<li><a href="offered.action">Offered</a></li>
						<li class="active"><a href="allocated.action">Allocated</a></li>
						<li><a href="started.action">Started</a></li>
						<li><a href="suspended.action">Suspended</a></li>
				  </ul>
				</div><!--/.well -->
        	</div>
        
	        <div class="span9">
	        <form name="allocatedForm" action="" method="post"><fieldset><legend>Allocated Work Items</legend>
	       		<div style="height:350px;"><table class="table table-hover">
	        		<thead>
						<tr>
						<th>#</th>
						<th>Task ID</th>
						<th>Task Name</th>
						<th>Case ID</th>
						<th>Status</th>
						<th>Created</th>
						</tr></thead>
					<tbody>
						<s:iterator id="workitem" value="%{items}">
						<tr>
						<td><input type="radio" name="selectedItem" value="${workitem.getID()}"></td>
						<td><s:property value="#workitem.getTaskID()"/></td>
						<td><s:property value="#workitem.getTaskName()"/></td>
						<td><s:property value="#workitem.getCaseID()"/></td>
						<td><s:property value="#workitem.getStatus()"/></td>
						<td><s:property value="#workitem.getEnablementTime()"/></td>
						</tr>
						</s:iterator>
					</tbody></table></div>
				
				<div class="btn-group" style="float: left;">
					<button class="btn" type="submit"
						onclick="allocatedForm.action='start.action';allocatedForm.submit();">Start</button>
					<button class="btn" type="submit"
						onclick="">Deallocate</button>
					<button class="btn" type="submit"
						onclick="">Delegate</button>
					<button class="btn" type="submit"
						onclick="">Skip</button>
					<button class="btn" type="submit"
						onclick="">Pile</button>
			    </div>
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