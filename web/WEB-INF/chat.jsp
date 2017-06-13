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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach items="${Chat}" var="produit" >
    <h1><c:out value="${produit['nomArticle']}"/></h1>
</c:forEach>
<jsp:include page="template/footer.jsp" />