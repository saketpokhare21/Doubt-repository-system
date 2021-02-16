<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.TimeZone"%>
<%@ page import="java.util.Base64"%>  

<%
	String id = request.getParameter("userid");
	String driver = "com.mysql.cj.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/doubt_repository?serverTimezone=" + TimeZone.getDefault().getID();
	//String database = "doubt_repository";
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
	Blob image = null;
	byte[ ] imgData = null ;
	ServletOutputStream sos = null;
	ResultSet resultSet = null;
	ResultSet resultset1 = null;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to Doubt Repository</title>

<!-- <meta charset="UTF-8"> -->
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
img {
  max-width:50%;
  height: auto;
}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

</style>

</head>
<body class="w3-theme-l5">

<%
	if(session.getAttribute("prn_no")== null)
	{
		response.sendRedirect("login.jsp");
	}
		
%>

<%
	response.setHeader("cache-control","no-cache,no-store,must-revalidate");
	response.setHeader("Pragma","no-cache");
	response.setHeader("Expires","0");
%>

<!-- Navbar -->
<div class="w3-top">
 <div class="w3-bar w3-theme-d2 w3-left-align w3-large">
  <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
  
  <!--commented part  -->
  <a href="welcome.jsp" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>YCP DOUBT REPOSITORY</a>
  
  <a href="Java_doubts.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Java">Java</a>
  <a href="Cpp_doubts.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="C++">C++</a>
  <a href="Dbt_doubts.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="DBT">DBT</a>
  <!-- <div class="w3-dropdown-hover w3-hide-small">
    <button class="w3-button w3-padding-large" title="Notifications"><i class="fa fa-bell"></i><span class="w3-badge w3-right w3-small w3-green">3</span></button>     
    <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
      <a href="#" class="w3-bar-item w3-button">One new friend request</a>
      <a href="#" class="w3-bar-item w3-button">John Doe posted on your wall</a>
      <a href="#" class="w3-bar-item w3-button">Jane likes your post</a>
    </div>
  </div> -->
  
  <a href="LogoutConrtoller" class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" title="My Account">LOGOUT
    <!-- <img src="/w3images/avatar2.png" class="w3-circle" style="height:23px;width:23px" alt="Avatar"> -->
  </a>
 </div>
</div>
<!-- Navbar ends here-->

<div class= "w3-container w3-card w3-white w3-round w3-margin">
    <center>
    <br><br><br>
        <h1><u>POST YOUR DOUBT HERE	</u></h1>
        <form method="post" action="WelcomeController" enctype="multipart/form-data">
            <table border="0">
            	<tr>
            		<td><label for="subject_id">Select a subject:</label></td>
            		<td>
            			<select name="subject_id" id="subject_id">
	            			<option value="1">Java</option>
	    					<option value="2">C++</option>
	    					<option value="3">DBT</option>
    					</select>
            		</td>
            	</tr>
                <tr>
                    <td>Doubt description: </td>
                    <td><textarea name="description" placeholder="Describe your doubt here..." rows="4" cols="35"></textarea></td>
                </tr>
                <tr>
                    <td>Upload image: </td>
                    <td><input type="file" name="image" size="50"/></td>
                </tr>
                <tr>
                	<td></td>
                    <td><input type="submit" class="w3-button w3-theme" value="Post"></td>
                </tr>
            </table>
        </form>
        <br><br><br>
    </center>
</div>    
    <div class="w3-container w3-card w3-white w3-round w3-margin">
    	
    	<%
			try{
			connection = DriverManager.getConnection(connectionUrl, userid, password);
			statement=connection.createStatement();
			String sql="select name, post_desc, post_id, post_img, doubt_table.created_date from doubt_table, user_login where user_login.prn_no = doubt_table.prn_no order by post_id desc";

			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
				System.out.println("Image:"+resultSet.getBlob(4));
		%>
					
				<!-- Post box -->
				<div class="w3-container w3-card w3-white w3-round w3-margin">
						<br>
						
						<h4><%=resultSet.getString("name") %></h4>
						
						<p style="text-align:left">Posted on:<b> <%= resultSet.getDate("doubt_table.created_date") %></b></p>
						<p><%=resultSet.getString("post_desc") %></p>
						
						<%-- <p><%=resultSet.getInt("post_id") %></p> --%>
					
						<%
							//int post_id = resultSet.getInt("post_id");
							//request.setAttribute("post_id",post_id);
						%>
						
						<%
						
							Blob img = resultSet.getBlob("post_img");
							byte[] bdata = img.getBytes(1, (int) img.length());
							String s = new String(bdata);
							if(s != null)
							{
						%>
						<img src="getImage.jsp?post_id=<%=resultSet.getInt("post_id")%>" style="width:100%" class="w3-margin-bottom"><br>
						<!-- Delete button code -->
						<div>
							<form action = "DeleteDao" method="post">
								<input type="hidden" hidden="hidden" id="post_id" name="post_id" value="<%= resultSet.getInt("post_id")%>">
								<input type="submit" value="Delete Post" class="w3-button w3-theme-d2 w3-margin-bottom">
							</form>
						</div>
						<% }
							else
							{ %>
								<p>img not uploaded</p>	
							<% }
						%>
						<%-- <p><%=resultSet.getInt("subject_id") %></p> --%>

						<!-- <button type="button"
							class="w3-button w3-theme-d1 w3-margin-bottom"> 
							<i class="fa fa-thumbs-up"></i>  Like
						</button> -->
						
						<!-- comment box -->
						<form action="CommentController" method="post">
							<br> <input type="text" name="comment" placeholder="Comment your suggestions here.."><br>
							<br>
							<input type="hidden" hidden="hidden" id="post_id" name="post_id" value="<%= resultSet.getInt("post_id")%>">
							<%-- <input type="hidden" hidden="hidden" id="subject_id" name="subject_id" value="<%= resultSet.getInt("subject_id")%>"> --%>
							<input type="submit" value="Comment" class="w3-button w3-theme-d2 w3-margin-bottom">
						</form>
						<br>
						<%
							try
							{
								connection = DriverManager.getConnection(connectionUrl, userid, password);
								statement=connection.createStatement();
								String commentSql = "SELECT name, comments, comments_table.created_date FROM comments_table, user_login WHERE comments_table.prn_no = user_login.prn_no and post_id="+resultSet.getInt("post_id")+"";				
								resultset1 = statement.executeQuery(commentSql);
								while(resultset1.next()){
						%>
						
									<div class="w3-container w3-card w3-white w3-round w3-margin">
										<h4><u><%=resultset1.getString("name") %>:</u></h4>
										<p style="text-align:right"><%= resultset1.getDate("comments_table.created_date") %></p>
										<p><%=resultset1.getString("comments")%></p>
									</div>
							<%
								}
								//connection.close();//END OF WHILE
							}//END OF TRY
							catch(Exception e)
							{e.printStackTrace();}
							%>
						

				</div>
			<%
			}
			//connection.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
			%>
					<!-- <div class="w3-row-padding" style="margin: 0 -16px"> -->
    </div>
    
</body>
</html>