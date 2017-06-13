<%@page import="java.util.ArrayList"%>
<%@page import="Class.Article"%>
<jsp:include page="template/header.jsp" />
<%
    ArrayList<Article> list = (ArrayList<Article>) request.getAttribute("Chat");
    for(Article article : list)
    {
        System.out.println(article.getIdArticle());
        System.out.println(article.getNomArticle());
        System.out.println(article.getPrixArticle());
        System.out.println(article.getPhotoArticle());
    }
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <body>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <div class="row">
            <div class="col s12 m6">
              <c:forEach items="${Chat}" var="article" >
                  <div class="card">
                    <div class="card-image">
                      <img src="images/<c:out value="${article['photoArticle']}"/>" alt="">
                      <span class="card-title">Chat</span>
                      <a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">add</i></a>
                    </div>
                    <div class="card-content">
                      <div>
                          <input type="hidden" name="modelNo" value="<c:out value="${article['nomArticle']}"/>">
                          <p><c:out value="${article['nomArticle']}"/></p>
                          <input type="hidden" size="2" value="1" name="quantity">

                          <input type="hidden" name="price" value="<c:out value="${article['prixArticle']}"/>">
                          <p>Prix :<c:out value="${article['prixArticle']}"/> euros</p> 

                          <input type="hidden" name="action" value="add">
                          <input class="button" type="submit" name="addToCart" value="Ajouter" >
                      </div>
                  </div>
              </c:forEach>
            </div>
        </div>
    </body>
</html>
<jsp:include page="template/footer.jsp" />