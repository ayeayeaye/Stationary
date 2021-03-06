<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="../css/styles.css" rel="STYLESHEET" type="text/css">



	<script type="text/javascript">
	
	function addRow(tableID) {

		//get table
		var table = document.getElementById(tableID);

		//get row length,  rowCount=2(first time have default one row, 3, 4,...)
		var rowCount = table.rows.length;
		var row = table.insertRow(rowCount); 
		
		//Cell 1  = serial number 
		var cell1= row.insertCell(0);
		cell1.innerHTML = rowCount ;
		
		//Cell 2  
  		var cell2 = row.insertCell(1);		
		var colCount = table.rows[1].cells.length;//every second row from * =rows[1], colCount=6			
			for(var i=1; i<colCount; i++) //start from second column
			{							
			    var newcell	= row.insertCell(i); //**get a column from second row
				newcell.innerHTML = table.rows[1].cells[i].innerHTML; //SET = GET (**)
			} 

	}
/* 	
	function changemyCategorySelect() 
	{
		var s1 = document.getElementById("myCategorySelect");
		var strUser = s1.options[s1.selectedIndex].value;
		alert(strUser);		
		s1.value = strUser;
			
	}
 */
 
 	function removeRow(x) {
	 var selectRow = x.parentNode.parentNode.rowIndex;
   	 //alert(selectRow+"*");
   	 document.getElementById("dataTable").deleteRow(selectRow);
	}
 

	</script>	
	
	


<h2> Create New Request - Staff</h2>

<form:form action="${pageContext.request.contextPath}/staff/request/create.html" method="POST" modelAttribute="categoryList">
	<div class="row">
		<c:if test="${fn:length(itemList) gt 0}">	
		<div class="col-lg-9">
		<div class="panel panel-default ">
		<div class="panel panel-heading"><h3>Choose the Item</h3></div>		
		<div class="panel panel-body">			
			<table class="table" id="dataTable">
				<thead>
					<tr class="listHeading">
						<th>No</th>
						<th>Name</th>					
						<th>Quantity</th>
						<th>Unit</th>
					</tr>
				</thead>
				<tbody>	
				

					<tr class="listBody">

						<td>1</td>					     
					
						<td>
							<select name="reqItemC">
								<c:forEach items="${itemList}" var="itemList">
									<option value="${itemList.itemId}">${itemList.category}-${itemList.itemName}</option>								
								</c:forEach>
							</select>
						</td>					
						<td> <INPUT TYPE="TEXT" name="reqQuantityC" ><br/></td>						
						<td>
							EA
						</td>						
						<td ><a  class="btn btn-danger" id="myRemoveBtn"  onclick="removeRow(this)" >Remove</a></td>						
				  </tr>				
					
				</tbody>
			</table>
			</div>	
			
			<div class="panel panel-footer">
			<a class="btn btn-primary" onclick="addRow('dataTable')" >Add New Item</a>
			</div>
		</div>
		</div>
	</c:if>

		

		<div class=" col-lg-3 pull-right">
		<div class="panel panel-default">	
		<div class="panel panel-body">	
					<table class="table">
						<tbody>
						<tr>
							<td class="col-lg-3">Request By:<br>
							Sign in People</td>
						</tr>
						<tr>
							<td class="col-lg-3">Request for:<br>
							<select name="forWho">
								<c:forEach items="${empList}" var="emp">
									<option value="${emp.employeeName}">${emp.employeeName}</option>
								</c:forEach>
								<option>Others</option>
							</select>
							</td>
						</tr>
						<tr>
							<td class="col-lg-6">Reason:<br>
							<textarea name="reason" ></textarea></td>
						</tr>						
						</tbody>					
					</table>
	</div>
	</div>
	</div>
	</div>

<br />
		<div class='col-lg-9'>
			<div class="row">
				<form:button class="btn btn-success" >Submit</form:button>
			</div>
		</div>
		
</form:form>

	<br><br>
		<div class='col-lg-12'>
			<div class="row">
				<input type="button" value="Back" class="btn btn-primary" onclick="history.back()"/>
			</div>
		</div>
	

