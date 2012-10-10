
<%@ page import="codekata.Tweet" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tweet.label', default: 'Tweet')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tweet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tweet" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tweet">
			
				<g:if test="${tweetInstance?.text}">
				<li class="fieldcontain">
					<span id="text-label" class="property-label"><g:message code="tweet.text.label" default="Text" /></span>
					
						<span class="property-value" aria-labelledby="text-label"><g:fieldValue bean="${tweetInstance}" field="text"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tweetInstance?.created}">
				<li class="fieldcontain">
					<span id="created-label" class="property-label"><g:message code="tweet.created.label" default="Created" /></span>
					
						<span class="property-value" aria-labelledby="created-label"><g:formatDate date="${tweetInstance?.created}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${tweetInstance?.id}" />
					<g:link class="edit" action="edit" id="${tweetInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
