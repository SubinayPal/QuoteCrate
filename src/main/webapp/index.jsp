<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>home</title>

<style>

/* CSS */
.button-22 {
  align-items: center;
  appearance: button;
  background-color: #0276FF;
  border-radius: 8px;
  border-style: none;
  box-shadow: rgba(255, 255, 255, 0.26) 0 1px 2px inset;
  box-sizing: border-box;
  color: #fff;
  cursor: pointer;
  display: flex;
  flex-direction: row;
  flex-shrink: 0;
  font-family: "RM Neue",sans-serif;
  font-size: 100%;
  line-height: 1.15;
  margin: 0;
  padding: 10px 21px;
  text-align: center;
  text-transform: none;
  transition: color .13s ease-in-out,background .13s ease-in-out,opacity .13s ease-in-out,box-shadow .13s ease-in-out;
 /* user-select: none;
   -webkit-user-select: none; */
  touch-action: manipulation;
}

.button-22:active {
  background-color: #006AE8;
}

.button-22:hover {
  background-color: #1C84FF;
}

#ta{
	width: 100%;
  	height: 150px;
  	padding: 12px 20px;
  	box-sizing: border-box;
  	border: 2px solid #ccc;
  	border-radius: 4px;
  	background-color: #f8f8f8;
  	font-size: 16px;
  	resize: none;
}
}

.gradient {
	width: 100vw;
	height: 100vh;
	background: linear-gradient(334deg, #6b97f7, #7525e2, #f7137e);
	background-size: 180% 180%;
	animation: gradient-animation 6s ease infinite;
}

@keyframes gradient-animation {
	0% {
		background-position: 0% 50%;
	}
	50% {
		background-position: 100% 50%;
	}
	100% {
		background-position: 0% 50%;
	}
}

</style>

</head>
<body>
	<div id="container" class="gradient">
		<textarea id="ta" name="ta" class="ta"></textarea>
		
	</div>
	<div align="center">
		<input type="button" name="btn" id="btn" class="button-22" value="&#128153; Generate Quote &#128153;"></input>
	</div>
	
	<script>
	$(document).ready(function(){
		$("#btn").click(function() {
			$.ajax({
				url: "https://type.fit/api/quotes",
				type: "GET",
				dataType: "json",
				success: function(data) {
					console.log("Clicked...")
					var randomIndex = Math.floor(Math.random() * data.length);
					console.log(randomIndex)
					var quote = data[randomIndex];
					console.log(quote.text);
					console.log(quote.author);
					$("#ta").val(quote.text + "\n-" + quote.author);
				}
			});
		})
	})

</script>

<!-- <script>

$(document).ready(function(){
	$("#btn").click(function() {
		$.ajax({
			url: "https://type.fit/api/quotes",
			type: "GET",
			dataType: "json",
			
			success: function(data) {
				console.log("Clicked...");
				var targetKey = "text"
				var quotes = Object.keys(data[0]);
				//console.log(data);
				
				var randomIndex = Math.floor(Math.random() * quotes.length);
				console.log(randomIndex);
				var test = quotes.findIndex(q=>{
					return q == targetKey
				})
				var quote = data[randomIndex][targetKey];
				
				
				
				console.log(test)
				
				
				$("#ta").val(quote+ "" ); 
			}
		});
	})
})

</script>
 -->

</body>


</html>