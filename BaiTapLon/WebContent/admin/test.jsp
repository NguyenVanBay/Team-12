<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Bài tập lớn</title>
<link rel="stylesheet" href="css/style.css">
</head>

<body>

	<div class="container">


		<div class="content">Ajax servler</div>
		
		<button id="yourname">Xem tên</button>
		
		<p id="result"></p>
		
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>

		<script type="text/javascript">

        $(document).ready(function(){          

                $('#yourname').click(function(){

                        var name = $('#yourname').val();

                        $.ajax({

                                type: "GET",

                                url : "../GetUserServlet",

                                data: {name: "bay"},

                                success: function(responseText){

                                        $('#result').text(responseText);

                                }

                        });

                });

        });

</script>


	</div>

</body>

</html>