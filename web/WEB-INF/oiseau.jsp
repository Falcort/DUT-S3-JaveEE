<%@page import="java.util.ArrayList"%>
<%@page import="Class.Article"%>
<jsp:include page="template/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="row">
    <c:forEach items="${Oiseau}" var="article" >
        <div class="col s6">
            <div class="card">
                <div class="card-image">
                    <img src="images/<c:out value="${article['photoArticle']}"/>" alt="">
                    <span class="card-title">Oiseau</span>
                    <a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">add</i></a>
                </div>
                <div class="card-content">
                    <div>
                        <input type="hidden" name="modelNo" value="<c:out value="${article['nomArticle']}"/>">
                        <p><c:out value="${article['nomArticle']}"/></p>
                        <input type="hidden" size="2" value="1" name="quantity">

                        <input type="hidden" name="price" value="<c:out value="${article['prixArticle']}"/>">
                        <p>Prix :<c:out value="${article['prixArticle']}"/> euros</p> 
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
<jsp:include page="template/footer.jsp" />