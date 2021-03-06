<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="STYLESHEET" type="text/css" href="${pageContext.request.contextPath}/css/style.css" rel="STYLESHEET" type="text/css">
<link rel="STYLESHEET" type="text/css" href="${pageContext.request.contextPath}/css/simple.css" rel="STYLESHEET" type="text/css">

<script>
function myMainSearchFunction() {
	var textBox, inputUpcase, dataTable, row, itemCol, i;
	
	textBox =  document.getElementById("inputSearch");
	inputUpcase = textBox.value.toUpperCase();
	
	dataTable=document.getElementById("myTable");
	row = dataTable.getElementsByTagName("tr");

	
	for (i = 0; i < row.length; i++) 
	{
		itemColCell = row[i].getElementsByTagName("td")[2];
		
		if(itemColCell)
			{
		      if (itemColCell.innerHTML.toUpperCase().indexOf(inputUpcase) > -1 )
		      {
		        row[i].style.display = "";
		      } 
		      else
		      {
		    	  row[i].style.display = "none";
		      }
			}
	}
	
}

function myRowSelect(itemId) {
	//alert("***"+ itemId);
	var dataTable=document.getElementById("myTable");
	var rows = dataTable.getElementsByTagName("tr");
	rows[itemId].className ="active";
	
 	var colCount = dataTable.rows[0].cells.length;
	for(var i=1; i<colCount; i++) 
	{	
		document.getElementById(i+"modal").value = dataTable.rows[itemId].cells[i].innerHTML;
	}
	
  	document.getElementById("myBtnUpdate").href = "${pageContext.request.contextPath}/store/stock/update/"+itemId;
}

</script>

<!-- 1 -->	
		<div >
			<h3>Item Stock</h3>
		</div>	
	 
	
		<div class="row" >
		<!-- 1.1 -->
			<div class="col-lg-5">
				<div class="input-group mb-2 mr-sm-2 mb-sm-0"> <!-- to combine search & input box -->
					<div class="input-group-addon">Search</div>
					<input type="text"  class="form-control" id="inputSearch" onkeyup="myMainSearchFunction()" placeholder="*****">
				</div>
			</div>

		<!-- 1.2 -->	
			<div class="link-menu navbar-text navbar-right">			
				   <span><a href="${pageContext.request.contextPath}/store/stock/view">Stock</a></span>
						<a href="${pageContext.request.contextPath}/all/view/catalogue">Item Catalogue</a>
						<a href="${pageContext.request.contextPath}/store/stock/supplier" >Supplier</a>	
						<a href="${pageContext.request.contextPath}/store/stock/view/log" >Stock Log</a>								
			</div>
			
		</div>
		
	<!-- 2 -->	
			<div class="table-responsive">	
			<table id="myTable" class="table table-scroll">
				<thead>
					<tr >
						<th class="col-xs-1">#</th>
						<th class="col-xs-2">Id</th>
						<th class="col-xs-3">Item</th>
						<th class="col-xs-2">TotalQuantity</th>
						<th class="col-xs-2">Unit</th>
						<th class="col-xs-2">Price(one unit)</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${itemList}" var="items" varStatus="counter">
						<tr onclick="myRowSelect('${items.itemId}')" >
							<td class="col-xs-1">${counter.count}</td>
							<td class="col-xs-2">${items.itemId}</td>
							<td class="col-xs-3">${items.itemName}</td>
							<td class="col-xs-2">${items.totalQty}</td>
							<td class="col-xs-2">${items.unit}</td>
							<td class="col-xs-2">${items.price}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
					
<!-- 3 -->			
			<div class="pull-right ">
					<a id="myAddLink" class="btn btn-success"  >
					<span class="glyphicon glyphicon-plus-sign"></span> Add New Stock
					</a>

					<a class="btn btn-success" id="myUpdateLink" >
					<span class="glyphicon glyphicon-pencil"></span> Update Stock
					</a>
					
					<a class="btn btn-success" id="myDeleteLink" >
					<span class="glyphicon glyphicon-trash"></span> Delete Stock
					</a>
					
					<a href="${pageContext.request.contextPath}/store/stock/add"> Add Stock</a>
			</div>	 


<!-- Update Modal popup Starts-->

<div id="myUpdateModal" class="modal">
	<div class="modal-dialog">
		  <!-- Modal content -->
		  <div class="modal-content">
		    <span class="close">&times;</span>
		    
		  <div class="modal-header">
			  	<p class="modal-title">Update Stock</p>

			  	
			 	<div class="modal-body">
			 		
					<table class="modal-table">
						<tbody>
							<tr>
								<td><label>Id</label></td>
								<td>:<input id="1modal" /></td>
							</tr>
							<tr>
								<td><label>Name</label></td>
								<td>:<input id="2modal" /></td>
							</tr>
							<tr>
								<td><label>Quantity</label></td>
								<td>:<input id="3modal" /></td>
							</tr>
							<tr>
								<td><label>Unit</label></td>
								<td>:<input id="4modal" /></td>
							</tr>
							<tr>
								<td><label>Price</label></td>
								<td>:<input id="5modal" /></td>
							</tr>														
						</tbody>
					</table>
					

		  		</div> 
		  		
			 	<div class="modal-footer">
		  			<a class="btn btn-warning " id="myBtnUpdate">Update</a>
		  		</div> 		  		
		  </div> 
	    
		  </div>
  	</div>
</div>
<!-- Update Modal popup End-->


<!-- Add Modal popup Starts-->
<form:form action="${pageContext.request.contextPath}/store/stock/add" modelAttribute="newStock" method="POST">

<div id="myAddModal" class="modal">
	<div class="modal-dialog">
		  <!-- Modal content -->
		  <div class="modal-content">
		    <span class="close" onclick="closeModalF('myAddModal')">&times;</span>
		    
		  <div class="modal-header">
			  	<div class="modal-title">
			  		<p>Add Stock</p>  				  	
			  	</div>
	  		</div>
	  		
			<div class="modal-body col-lg-12">
			<div class="row">
				<div class="col-lg-6">
				<table class="modal-table">
					<tbody>
					<tr>
						<td><label>Item</label></td>
						<td>:<input id="itemTxt"><form:hidden id="itemVal" path="addedItem" /></td>
					<tr>
						<td><label>Quantity</label></td>
						<td>:<form:input path="addedQty"/></td>
					</tr>			
					<tr>
						<td><label>Price($)</label></td>
						<td>:<form:input path="addedPrice"/></td>
					</tr>			
					<tr>
						<td><label>Supplier</label></td>
						<td>:<input id="suppTxt"><form:hidden id="suppVal" path="supplier" /></td>			
					</tr>
					</tbody>
				</table>
<form:button class="btn btn-default">Submit</form:button>				
				</div>
				
				<div class="col-lg-6">
						<div class="input-group input-group-sm"> <!-- to combine search & input box -->
								<div class="input-group-addon">Search Item</div>
								<input type="text" class="form-control" id="inputSearchItem" onkeyup="myItemSearchFunction()" placeholder="Item or Category">
						</div>
						<div style="overflow-y:auto; height: 150px;">
							<table class="table">
							<thead>
								<tr>
									<th>Category</th>
									<th>Item</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${itemList}" var="items">
								<tr onclick="fillSelectElement('item','${items.itemName}','${items.itemId}')">
									<td>${items.categoryModel.categoryName}</td>
									<td>${items.itemName}</td>
									<td hidden="">${items.itemId}</td>
								</tr>
								</c:forEach>
							</tbody>
							</table>
						</div>
						<br/>
						<div class="input-group input-group-sm"> <!-- to combine search & input box -->
								<div class="input-group-addon">Search Supplier</div>
								<input type="text"  class="form-control" id="inputSearchSupp" onkeyup="mySuppSearchFunction()" placeholder="*****">
						</div>
						<div style="overflow-y:auto; height: 150px;">
							<table class="table">
							<thead>
								<tr>
									<th>Name</th>
									<th>Company</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${supList}" var="supp">
								<tr  onclick="fillSelectElement('supp','${supp.supName}','${supp.supplierId}')">
									<td>${supp.supName}</td>
									<td>${supp.supCompany}</td>
								</tr>
								</c:forEach>
							</tbody>
							</table>
						</div>
				</div>
				</div>
			</div>								  	
		  				
			 		
		  		
	    
		  </div>
</div> 
  </div>

</form:form>



<!-- Add Modal popup End-->


<!-- Start script for modal -->
<script>
// Start script for update modal
//open Update Modal
var modalUpdate = document.getElementById('myUpdateModal');
var btnUpdate = document.getElementById("myUpdateLink");
btnUpdate.onclick = function() {
	modalUpdate.style.display = "block";
}
//close Update Modal
var spanClose = document.getElementsByClassName("close")[0];
spanClose.onclick = function() {
	modalUpdate.style.display = "none";
}
//End script for update modal 

//Start script for add modal
//Open Add Modal
var modalAdd = document.getElementById('myAddModal');
var btnAdd = document.getElementById("myAddLink");
btnAdd.onclick = function() {
	modalAdd.style.display = "block";
}
//Close Add Modal
var spanClose = document.getElementsByClassName("close")[1];
spanClose.onclick = function() {
	modalAdd.style.display = "none";
} 

function fillSelectElement(type,name,id) {
	if(type=="item")
	{
		document.getElementById('itemTxt').value = name;
		document.getElementById('itemVal').value = id;
	}
	if(type=="supp")
	{
		document.getElementById('suppTxt').value = name;
		document.getElementById('suppVal').value = id;
	}	

}
// End script for add modal -->
</script> 
<!-- End script for modal -->