<%@ page import="homelink.User" %>
<g:if test="${shoppingLists.size() > 0}">
<div class="accordion" id="accordion">
	<g:each in="${shoppingLists}" status="i" var="shoppingList">
		<div class="accordion-group">
		  <div class="accordion-heading" style="">
		    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#${i+1}"><h3>${shoppingList}&nbsp;<span style="float:right;" id="list-${shoppingList.id}-close" class="close" 
			onclick="${remoteFunction(
				action: 'deleteList',
				id: shoppingList.id,
				update: [success: 'shoppingLists']
			)}">&times;</span></h3></a>
		  </div>
		  <div id="${i+1}" class="accordion-body collapse<% if(i == session.user.getShoppingLists().size()-1){println " in" }%>">
		    <div id="shoppingList-${shoppingList.id}" class="accordion-inner">
		     <g:render template="shoppingList" collection="${shoppingList}" /></div>
		     <g:formRemote onSuccess="document.getElementById('addItemNameField-${shoppingList.id}').value = '';" name="addItemForm" url="[controller:'shopping',action:'addItem',id:shoppingList.id]" method="POST" update="shoppingList-${shoppingList.id}" placeholder="add item">
				<div class="input-append">
					<g:textField id="addItemNameField-${shoppingList.id}" class="addItemField" name="name" placeholder="Add an item..." />
					<g:submitButton name="addItem" value="Add Item" class="btn btn-default btn-small addItemButton" />
				</div>
			</g:formRemote>
		  </div>
		</div>
	</g:each>
</div>
</g:if>
<g:else>
You do not have any shopping lists.
</g:else>

