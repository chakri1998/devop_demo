<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
	body{
	background-color: black;
	opacity: 0.8;
	}
	.container{
		 /*  background-color: white-smoke;   */
		 color: white; 
		width: 40%;
		padding: 1%;
	}
	.container-1{
		height: 12vh;
	}
	.checked{
		color:red ;
	}
	.unchecked{
		color:white ;
	}
</style>
</head>
<script>
	
	function clickStar(i)
	{
		let i1 = i;

		const idStarArr = [null,"start1","start2","start3","start4","start5"];

		
		 for(let k = 1 ;k<=5;k++)
		{
				
			ele = document.getElementById(idStarArr[k]);
			let clss = document.getElementById(idStarArr[k]).className;

						
			if(k<=i)
			{
					ele.classList.remove("unchecked");
					ele.classList.add("checked");
					console.log("checked");
			}
			else
			{
					console.log("unchecked");
					ele.classList.remove("checked");
					 ele.classList.add("unchecked");
			}
			
			
		}
		 document.feedback_form.rating.value = i;
		 updatedStarValue(i1);
			
	}
	function updatedStarValue(i)
	{
		console.log(i);
			return i;
	}
	function validateForm()
	{
		console.log("form");
		let val = document.feedback_form.mid.value;
		console.log(val.trim());
		 
		 
		
		 if(val.search(/[M|m]\d{7}$/g)==-1)
		    {
		      alert("invalid mid");
		      return false;
		    }
		 let name = document.feedback_form.name.value.trim();
		 
		 let splitName = name.split(" ");
		 for(let k = 0 ;k<splitName.length;k++)
		 if(splitName[k].search(/^[a-zA-z]+$/g)==-1)
		    {
		      alert("invalid name");
		      return false;
		    }
		
		return true;
	}
</script>
<body>
<div class="container-1">
</div>
<div class="container ">
	
  <h2 style="align-content: center;">Feedback Form</h2>
  <hr>
  <form:form name = "feedback_form" action="save-employee-feedback" method="post" modelAttribute="employee" onSubmit="return validateForm()">
    <div class="form-group">
      <label for="mid">MID:</label>
      <form:input type="text" class="form-control" id="mid" placeholder="Enter Mid" name="mid" required="required" path="mId"/>
    </div>
	<div class="form-group">
      <label for="name">NAME:</label>
      <form:input type="text" class="form-control" id="name" placeholder="Enter Name" name="name" required="required" path="name"/>
    </div>
    
    <div class="form-group">
      <label for="rating">RATING:</label><br>
   		<span id = "start1" class="fa fa-star checked" onclick = "clickStar(1)"></span>
		<span id = "start2" class="fa fa-star" onclick = "clickStar(2)" ></span>
		<span id = "start3" class="fa fa-star" onclick = "clickStar(3)"></span>
		<span id = "start4" class="fa fa-star" onclick = "clickStar(4)"></span>
		<span id = "start5" class="fa fa-star" onclick = "clickStar(5)"></span>
    </div>
    <div class="form-group" style="display: none;">
      <label for="rating">NAME:</label>
      <form:input type="text" class="form-control" id="rating"  name="rating"  path="rating"/>
    </div>
    <button type="submit" class="btn btn-primary" value="Save">Submit</button>
  </form:form>
</div>

</body>
</html>
