<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html>
<head>
    <title><tiles:getAsString name="title" ignore="true"/></title>
</head>
<body>
<tiles:insertAttribute name="header" ignore="true"/>
<tiles:insertAttribute name="body" ignore="true"/>
</body>
</html>
