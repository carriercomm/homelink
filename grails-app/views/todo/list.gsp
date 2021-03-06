<%@ page import="homelink.*" %>
<html>
<head>
	<title>Todo List</title>
	<meta name="layout" content="main"/>
	<script type="text/javascript">
	function strikeText(fieldID) {
	    fieldObj = document.getElementById(fieldID);
	    var style = (fieldObj.style.textDecoration!='line-through')?'line-through':'none';
	    fieldObj.style.textDecoration = style;
	    return;
	}
	</script>
</head>
<body>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span6 offset3 main">
		<h1 style="text-align:left">To Do Lists</h1>
		<br>
		<div id="todoLists">
			<g:render template="/todo/todoLists" />
		</div>
		<br><br>
		<g:formRemote onSuccess="document.getElementById('addListNameField').value = '';" name="addListForm" url="[controller:'todo', action:'addList']" method="POST" update="todoLists">
			<div class="input-append">
				<g:textField id="addListNameField" name="name" placeholder="Create a new todo list..." />
				<g:submitButton name="addList" value="Add List" class="btn btn-default" />
			</div>
		</g:formRemote>
		</div>
	</div>
</div>
</body>
</html>