<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Test!  </h1>



<h1>Disburse</h1>

<p>RequestID = ${aRqId }</p>
Request Detail ID = 
<c:forEach items="${disbReqDetailList}" var="d">
	${d.requestdetailId},
</c:forEach>

Receive Qty =
<c:forEach items="${receiveQtyAry}" var="a">
	${a},
</c:forEach>



</body>

</html>