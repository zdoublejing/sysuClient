<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<!-- saved from url=(0053)http://www.bootcss.com/examples/starter-template.html -->
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>SYSU Client: participant info/delete</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Based on yawl resourceService">
    <meta name="author" content="sysu">

    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" media="screen">
    <style>
      body {
        padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
      }
    </style>
    <link href="../css/my.css" rel="stylesheet">
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
              Logged in as <a href="#">Administrator</a>
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
      <form class="form-horizontal"><fieldset>
        
        <legend>用户信息</legend>

        <div class="control-group">
          <label class="control-label">First Name</label>
          <div class="controls">
            <input type="text" id="inputfirstname" type="text" value="jingjing">
          </div>
        </div>

        <div class="control-group">
          <label class="control-label">Last Name</label>
          <div class="controls">
            <input type="text" id="inputlastname" type="text" value="zhao">
          </div>
        </div>

        <div class="control-group">
          <label class="control-label">User ID</label>
          <div class="controls">
            <input type="text" id="inputuserid" type="text" value="zjj">
            <label class="checkbox inline"><input id="isAdmin" type="checkbox" checked> Administrator</label>
          </div>
        </div>

        <div class="control-group">
          <label class="control-label">Password</label>
          <div class="controls">
            <input type="password" id="inputPassword" type="text" value="YAWL">
            <input type="password" id="confirmPassword" type="text" value="YAWL">
          </div>
        </div>

        <div class="control-group">
          <label class="control-label">Description</label>
          <div class="controls">
            <textarea rows="3"></textarea>
          </div>
        </div>

        <div class="control-group">
          <label class="control-label">Notes</label>
          <div class="controls">
            <textarea rows="3"></textarea>
          </div>
        </div>

        <div class="control-group">
          <label class="control-label">Privileges</label>
          <div class="controls">
            <label class="checkbox"><input type="checkbox" checked> Choose Which Work Item to Start</label>
            <label class="checkbox"><input type="checkbox" checked> Start Work Items Concurrently</label>
            <label class="checkbox"><input type="checkbox" checked> Reorder Work Items</label>
            <label class="checkbox"><input type="checkbox"> View All Work Items of Team</label>
            <label class="checkbox"><input type="checkbox"> View All Work items of Org Group</label>
            <label class="checkbox"><input type="checkbox"> Chain Work Item Execution</label>
            <label class="checkbox"><input type="checkbox"> Manage Cases</label>
          </div>
        </div>
            
        <div class="control-group">
          <label class="control-label">Roles</label>
          <div class="controls">
            <div class="simple">
            <label class="checkbox"><input type="checkbox"> role 1</label>
            <label class="checkbox"><input type="checkbox"> role 2</label>
            <label class="checkbox"><input type="checkbox"> role 3</label>
            <label class="checkbox"><input type="checkbox"> role 4</label>
            <label class="checkbox"><input type="checkbox"> role 5</label>
            <label class="checkbox"><input type="checkbox"> role 6</label>
            <label class="checkbox"><input type="checkbox"> role 7</label>
            </div>
          </div>
        </div>
        
        <div class="control-group">
          <label class="control-label">Positions</label>
          <div class="controls">
            <div class="simple">
            <label class="checkbox"><input type="checkbox"> Position 1</label>
            <label class="checkbox"><input type="checkbox"> Position 2</label>
            <label class="checkbox"><input type="checkbox"> Position 3</label>
            <label class="checkbox"><input type="checkbox"> Position 4</label>
            </div>
          </div>
        </div>
        
        <div class="control-group">
          <label class="control-label">Capabilities</label>
          <div class="controls">
            <div class="simple">
            <label class="checkbox"><input type="checkbox"> Capability 1</label>
            <label class="checkbox"><input type="checkbox"> Capability 2</label>
            <label class="checkbox"><input type="checkbox"> Capability 3</label>
            <label class="checkbox"><input type="checkbox"> Capability 4</label>
            </div>
          </div>
        </div>

        <div class="form-actions">
          <button type="submit" class="btn btn-primary">Save changes</button>
          <button type="button" class="btn">Cancel</button>
        </div>
        </fieldset></form>

      <hr>
      <footer>
          <p>© Workflow Lab 2013</p>
      </footer>
    </div> <!-- /container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>


</body></html>