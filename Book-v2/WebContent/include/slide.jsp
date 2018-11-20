<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="w3-content w3-section"
	style="width: 100%; padding: 20px 0px 0px 0px;">
	<img class="mySlides" src="${pageContext.request.contextPath}/img/anhnen2.jpg" style="width: 100%">
	<img class="mySlides" src="${pageContext.request.contextPath}/img/anhnen5.jpg" style="width: 100%"> <img
		class="mySlides" src="${pageContext.request.contextPath}/img/anhnen3.jpg" style="width: 100%"> <img
		class="mySlides" src="${pageContext.request.contextPath}/img/anhnen4.jpg" style="width: 100%">
</div>

<script>
	var myIndex = 0;
	carousel();

	function carousel() {
		var i;
		var x = document.getElementsByClassName("mySlides");
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
		}
		myIndex++;
		if (myIndex > x.length) {
			myIndex = 1
		}
		x[myIndex - 1].style.display = "block";
		setTimeout(carousel, 2000); // Change image every 2 seconds
	}
</script>