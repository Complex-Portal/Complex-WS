<%--
  Created by IntelliJ IDEA.
  User: maitesin
  Date: 13/03/2014
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Complex Web Service</title>
</head>
<body>
<h2>Search method</h2>
<%--** NOTE: We have to force the format with the parameter format in the query because we are using a web browser and is header sensitive, but if you do not give a header you will receive the answer in JSON (default format) **--%>
<br>This method is for query in Solr. Then you have to build your query for search. Please find below different examples about that:
<ul>
    <li>Search for ndc80:<br><a href="${pageContext.request.contextPath}/search/ndc80">/search/ndc80</a></li>
    <li>Search for ndc80 and facet with the species field:<br><a href="${pageContext.request.contextPath}/search/ndc80?facets=species_f">/search/ndc80?facets=species_f</a></li>
    <li>Search for ndc80 and facet with the species and biological role fields:<br><a href="${pageContext.request.contextPath}/search/ndc80?facets=species_f,pbiorole_f">/search/ndc80?facets=species_f,pbiorole_f</a></li>
    <li>Search for ndc80, facet with the species and biological role fields and filter the species using human:<br><a href="${pageContext.request.contextPath}/search/Ndc80?first=0&number=10&filters=species_f:(&quot;Homo sapiens&quot;)&facets=species_f,ptype_f,pbiorole_f">/search/Ndc80?first=0&number=10&filters=species_f:("Homo sapiens")&facets=species_f,ptype_f,pbiorole_f</a></li>
    <li>Search for ndc80, facet with the species and biological role fields and filter the species using human or mouse:<br><a href="${pageContext.request.contextPath}/search/Ndc80?first=0&number=10&filters=species_f:(&quot;Homo sapiens&quot; &quot;Mus musculus&quot;)&facets=species_f,ptype_f,pbiorole_f">/search/Ndc80?first=0&number=10&filters=species_f:("Homo sapiens" "Mus musculus")&facets=species_f,ptype_f,pbiorole_f</a></li>
    <li>Search with a wildcard to retrieve all the information:<br><a href="${pageContext.request.contextPath}/search/*">/search/*</a></li>
    <li>Search with a wildcard to retrieve all the information and facet with the species, biological role and interactor type fields:<br><a href="${pageContext.request.contextPath}/search/*?facets=species_f,pbiorole_f,ptype_f">/search/*?facets=species_f,pbiorole_f,ptype_f</a></li>
    <li>Search with a wildcard to retrieve all the information, facet with the species, biological role and interactor type fields and filter the interactor type using small molecule:<br><a href="${pageContext.request.contextPath}/search/*?facets=species_f,pbiorole_f,ptype_f&filters=ptype_f:(&quot;small molecule&quot;)">/search/*?facets=species_f,pbiorole_f,ptype_f&filters=ptype_f:("small molecule")</a></li>
    <li>Search with a wildcard to retrieve all the information, facet with the species, biological role and interactor type fields and filter the interactor type using small molecule and the species using human:<br><a href="${pageContext.request.contextPath}/search/*?facets=species_f,pbiorole_f,ptype_f&filters=ptype_f:(&quot;small molecule&quot;),species_f:(&quot;Homo sapiens&quot;)">/search/*?facets=species_f,pbiorole_f,ptype_f&filters=ptype_f:("small molecule"),species_f:("Homo sapiens")</a></li>
    <li>Search for GO:0016491 and paginate (first is for the offset and number is how many do you want):<br><a href="${pageContext.request.contextPath}/search/GO:0016491?first=10&number=10">/search/GO:0016491?first=10&number=10</a></li>
</ul>
</body>
</html>
