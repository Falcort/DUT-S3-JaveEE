<%@page import="java.util.ArrayList"%>
<%@page import="Class.Article"%>
<jsp:include page="template/header.jsp" />
<%
    ArrayList<Article> list = (ArrayList<Article>) request.getAttribute("Chat");
    for(Article article : list)
    {
        System.out.println(article.getIdArticle());
        System.out.println(article.getNomArticle());
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="template/footer.jsp" />