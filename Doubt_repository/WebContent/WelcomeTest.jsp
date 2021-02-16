<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("userid");
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "doubt_repository";
String userid = "root";
String password = "";
try 
{
Class.forName(driver);
} 
catch (ClassNotFoundException e) 
{
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<!DOCTYPE html>
<html>
<title>Doubt Repository page</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html, body, h1, h2, h3, h4, h5 {
	font-family: "Open Sans", sans-serif
}
</style>
<body class="w3-theme-l5">
	<%
		if(session.getAttribute("prn_no")==null)
		{
			response.sendRedirect("login.jsp");
		}
		
	%>

	<p>welcome ${username}</p>


	<!-- Navbar -->
	<div class="w3-top">
		<div class="w3-bar w3-theme-d2 w3-left-align w3-large">
			<a
				class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2"
				href="javascript:void(0);" onclick="openNav()"><i
				class="fa fa-bars"></i></a> <a href="#"
				class="w3-bar-item w3-button w3-padding-large w3-theme-d4">YCP
				DOUBT REPOSITORY</a>

			<!--   <div class="w3-dropdown-hover w3-hide-small">
    <button class="w3-button w3-padding-large" title="Notifications" for="subject">Subject catagory</button>     
    <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px" >
      <a href="java.jsp" class="w3-bar-item w3-button">JAVA</a>
      <a href="cpp.jsp" class="w3-bar-item w3-button">CPP</a>
      <a href="asp_net.jsp" class="w3-bar-item w3-button">MS.NET</a>
      <a href="dbt.jsp" class="w3-bar-item w3-button">DATABASE TECHNOLOGY</a>
    </div>
  </div>
-->




			<a href="login.jsp"
				class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white"
				title="My Account"> LOGOUT </a>
		</div>
	</div>
	<div align="center">
		<h4>
			<% int prn_no = (int)session.getAttribute("prn_no");
			out.println("Welcome " +prn_no);%>
		</h4>
	</div>

	<!-- Navbar on small screens -->
	<!-- <div id="navDemo" class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium w3-large">
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 1</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 2</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 3</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">My Profile</a>
</div>  -->

	<!-- Page Container -->
	<div class="w3-container w3-content"
		style="max-width: 1400px; margin-top: 80px">
		<!-- The Grid -->
		<div class="w3-row">
			<!-- Left Column -->
			<div class="w3-col m3">
				<!-- Profile -->

				<br>

				<!-- Accordion -->

				<br>

				<!-- Interests -->

				<br>

				<!-- Alert Box -->


				<!-- End Left Column -->
			</div>


			<!-- Middle Column -->
			<div class="w3-col m7">
				<div class="w3-row-padding">
					<div class="w3-col m12">
						<div class="w3-card w3-round w3-white">
							<div class="w3-container w3-padding">

								<form action="PostController" method="post">
									<table>
										<tr>
											<td><label for="subject">Select a subject:</label></td>
											<td><select id="subject" name="subject">
													<option value="1">Java</option>
													<option value="2">C++</option>
													<option value="3">DBT</option>
											</select></td>
										</tr>
									</table>


									<h6 class="w3-opacity">Post Your Doubts Here...</h6>
									<input type="text" name="content" size="89">
									<!--  <p contenteditable="true" class="w3-border w3-padding" ></p>-->
									</input><br>
									<br> <input type="submit" class="w3-button w3-theme"
										value="Post"> </input>
								</form>
							</div>
						</div>
					</div>
				</div>

				<div class="w3-container w3-card w3-white w3-round w3-margin">
					<br>




					<!-- <span class="w3-right w3-opacity">1 min</span> -->


					<!--    <h4><%int name = (int)session.getAttribute("prn_no"); out.println(name); %>-->
					<hr class="w3-clear">

			<%
			try{
			connection = DriverManager.getConnection(connectionUrl+database, userid, password);
			statement=connection.createStatement();
			//String sql ="select post_desc from posts_table where prn_no="+prn_no+" order by post_id desc;";
			String sql="select name, post_desc,post_id from posts_table, user_login where posts_table.prn_no = user_login.prn_no order by post_id desc;";
			
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
			%>
					<div class="w3-container w3-card w3-white w3-round w3-margin">
						<br>
						<h4><%=resultSet.getString("name") %></h4>
						<p><%=resultSet.getString("post_desc") %></p>

						<button type="button"
							class="w3-button w3-theme-d1 w3-margin-bottom">
							<i class="fa fa-thumbs-up"></i>  Like
						</button>
						<form action="CommentController" method="post">
						<br> <input type="text" name="content" size="80"><br>
						<br>
						<input type="submit" value="Comment"
							class="w3-button w3-theme-d2 w3-margin-bottom">
						
						</form>
						<br>
						<div class="w3-container w3-card w3-white w3-round w3-margin">
							<h4><%=resultSet.getString("name") %></h4>
							<p><%=resultSet.getString("post_desc")%></p>
						</div>
						<br>


					</div>
					<%
			}
			connection.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
			%>
					<div class="w3-row-padding" style="margin: 0 -16px">

<!--   </div>
         
      </div>
      
      <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
      
        <span class="w3-right w3-opacity">16 min</span>
        <h4>Jane Doe</h4><br>
        <hr class="w3-clear">
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
        <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i>  Like</button> 
        <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i>  Comment</button> 
      </div>  

      <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
      
        <span class="w3-right w3-opacity">32 min</span>
        <h4>Angie Jane</h4><br>
        <hr class="w3-clear">
        <p>Have you seen this?</p>
        <img src="/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom">
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
        <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i>  Like</button> 
        <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i>  Comment</button> 
      </div> 
    -->
						<!-- End Middle Column -->
					</div>

					<!-- Right Column -->


					<!-- End Grid -->
				</div>

				<!-- End Page Container -->
			</div>
			<br>

			<!-- Footer -->
			<!--  <footer class="w3-container w3-theme-d3 w3-padding-16">
  <h5>Footer</h5>
</footer>

<footer class="w3-container w3-theme-d5">
  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
</footer>
 
<script>
// Accordion
function myFunction(id) {
  var x = document.getElementById(id);
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
    x.previousElementSibling.className += " w3-theme-d1";
  } else { 
    x.className = x.className.replace("w3-show", "");
    x.previousElementSibling.className = 
    x.previousElementSibling.className.replace(" w3-theme-d1", "");
  }
}

// Used to toggle the menu on smaller screens when clicking on the menu button
function openNav() {
  var x = document.getElementById("navDemo");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else { 
    x.className = x.className.replace(" w3-show", "");
  }
}
</script>
-->
</body>
</html>