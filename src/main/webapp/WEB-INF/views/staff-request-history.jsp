<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">

<h2>Department Request History - One Department </h2>

<div class="row" style="height:50px">
<div class="col-lg-6">
<a href="${pageContext.request.contextPath}/staff/request/create.html"class="btn btn-primary">Create New Request</a>
</div>
</div>

<div class="row" style="height:50px">
  <div class="col-lg-6">
    <div class="input-group">
      <span class="input-group-btn">
        <button class="btn btn-default" type="button">Go!</button>
      </span>
      <input type="text" class="form-control" placeholder="Search for...">
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
 </div>
 


<div class="row">
<div class="panel col-lg-12">	
	<table class="table table-striped">
	<thead>
	  <tr class="bg-info">
	    <th>No</th>
	    <th>Request Id</th>
	    <th>Employee</th>
	    <th>Status </th>
	    <th>Request Date</th>
	    <th>Approve/Reject Date</th>
	    <th>Receive Date</th>
	    <th>Details</th>
	    <th>Update</th>
	    <th>Cancel</th>
	  </tr>
	</thead> 
	  <c:forEach items="${deptReqList}" var="deptReqList" varStatus="counter">	 
	  <tr> 
	  	<td>${counter.count}</td>
	    <td>${deptReqList.department}-${deptReqList.drepCode}</td>
	    <td>${deptReqList.employeeModel.employeeName} </td>
	    <td>${deptReqList.deptStatus}</td>   
	    <td>${deptReqList.reqDate}</td>
	    <td>${deptReqList.approveDate}</td>
	    <td>${deptReqList.disburseDate}</td>
	    <td><a href="${pageContext.request.contextPath}/staff/request/detail/${deptReqList.requestId}.html" class="btn btn-primary" >Detail</a></td>
	  	
	  	<!-- Staff can see "Update" & "Cancel" button if 1-their own request 2-before "Approve"or"Reject" -->
	  	<c:choose>
	  		<c:when test="${loginEmpId == deptReqList.employee and deptReqList.deptStatus == 'Request' }">
			  	<td><a href="${pageContext.request.contextPath}/staff/request/update/${deptReqList.requestId}.html" class="btn btn-warning">Update</a></td>
			  	
			  	<!-- cancel confirm ,window pop-up -->			  	
				<script type="text/javascript">
					function clickCancelFunction()
					{
						var yn = confirm("Are you sure you want to cancel this request!");
						var text;
						//alert("**"+yn);
						if(yn == true ){text = "cancel";}
						else{text = "history";}
						document.getElementById("cabcelId").setAttribute('href','${pageContext.request.contextPath}/staff/request/'+ text+'/${deptReqList.requestId}.html');
					} 
				</script>				
			  	<td><a id="cabcelId"  class="btn btn-danger" onclick="clickCancelFunction()" >Cancel</a></td>
			  	
	 		</c:when>
	 		<c:otherwise>
	 			<td></td>
	 			<td></td>
	 		</c:otherwise>
	 	</c:choose>
	 	
	  </tr>
	 </c:forEach>

	</table>
</div>
</div>

 </div>