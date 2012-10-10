<%@ page import="codekata.Tweet" %>



<div class="fieldcontain ${hasErrors(bean: tweetInstance, field: 'text', 'error')} required">
	<label for="text">
		<g:message code="tweet.text.label" default="Text" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="text" maxlength="48" required="" value="${tweetInstance?.text}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tweetInstance, field: 'created', 'error')} required">
	<label for="created">
		<g:message code="tweet.created.label" default="Created" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="created" precision="day"  value="${tweetInstance?.created}"  />
</div>

