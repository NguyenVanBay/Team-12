<div class="w3-content w3-section" style="max-width:500px">
  <img class="mySlides1" src="${pageContext.request.contextPath}/img/anhnen2.jpg" style="width:20%">
  <img class="mySlides1" src="${pageContext.request.contextPath}/img/anhnen2.jpg" style="width:20%">
  <img class="mySlides1" src="${pageContext.request.contextPath}/img/anhnen2.jpg" style="width:20%">
  <img class="mySlides1" src="${pageContext.request.contextPath}/img/anhnen2.jpg" style="width:20%">
  <img class="mySlides1" src="${pageContext.request.contextPath}/img/anhnen2.jpg" style="width:20%">
  <img class="mySlides1" src="${pageContext.request.contextPath}/img/anhnen2.jpg" style="width:20%">
  <img class="mySlides1" src="${pageContext.request.contextPath}/img/anhnen2.jpg" style="width:20%">
  <img class="mySlides1" src="${pageContext.request.contextPath}/img/anhnen2.jpg" style="width:20%">
  <img class="mySlides1" src="${pageContext.request.contextPath}/img/anhnen2.jpg" style="width:20%">
</div>




<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides1");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 2000); // Change image every 2 seconds
}
</script>