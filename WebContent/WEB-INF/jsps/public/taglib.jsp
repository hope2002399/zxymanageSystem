<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/componentTagLib.tld" prefix="cpt"%>
<c:set var="ctx">${pageContext.request.contextPath }</c:set>
<c:set var="locale"><%=org.springframework.context.i18n.LocaleContextHolder.getLocale().toString() %></c:set>
<c:set var="lang" value="<%=org.springframework.context.i18n.LocaleContextHolder.getLocale().getLanguage() %>" />
<script type="text/javascript"
	src="<c:url value='/common/jquery/jquery-1.5.1.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/common/jquery/jquery.form.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/common/login/login.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/common/login/thickbox-compressed.js'/>"></script>
 