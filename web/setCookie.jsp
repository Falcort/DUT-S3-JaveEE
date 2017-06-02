<%
   // Create cookies for first and last names.      
   Cookie username = new Cookie("username", request.getParameter("userame"));
   
   // Set expiry date after 24 Hrs for both the cookies.
   username.setMaxAge(60*60*24*365); 
   
   // Add both the cookies in the response header.
   response.addCookie( username );
%>

<html>
   <head>
      <title>Setting Cookies</title>
   </head>
   
   <body>
      <center>
         <h1><%= request.getParameter("username")%></h1>
      </center>
   </body>
</html>