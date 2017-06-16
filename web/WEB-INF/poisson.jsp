<%@page import="java.util.ArrayList"%>
<%@page import="Class.Article"%>
<jsp:include page="template/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="row">
    <c:forEach items="${Poisson}" var="article" >
        <div class="col s3">
            <div class="card">
                <div class="card-image waves-effect waves-block waves-light">
                    <a class="btn-floating btn-large btn-price waves-effect waves-light red"><c:out value="${article['prixArticle']}"/>&euro;</a>
                    <a>
                        <img src="images/<c:out value="${article['photoArticle']}"/>" alt="">
                    </a>
                </div>
                <ul class="card-action-buttons">
                    <li>
                        <a class="tooltipped btn-floating waves-effect waves-light light-blue" data-position="top" data-delay="50" data-tooltip="<c:out value="${article['descriptionArticle']}"/>">
                            <i class="material-icons">
                                info_outline
                            </i>
                        </a>
                    </li>
                    <li>
                        <form action="./AjouterArticlePanier" method="POST">
                            <input hidden type="text" name="id" value="<c:out value="${article['idArticle']}"/>">
                            <input hidden type="text" name="nom" value="<c:out value="${article['nomArticle']}"/>">
                            <input hidden type="text" name="prix" value="<c:out value="${article['prixArticle']}"/>">
                            <input hidden type="text" name="type" value="poisson">
                            <button class="btn-floating btn waves-effect waves-light red" type="submit" name="action">
                                <i class="material-icons">
                                    add_shopping_cart
                                </i>
                            </button>
                        </form>
                    </li>
                </ul>
                <div class="card-content">
                    <div>
                        <h3><c:out value="${article['nomArticle']}"/></h3>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
<div class="center-align">
    <ul class="pagination">
        <li class="disabled"><a href="#!"><i class="material-icons">chevron_left</i></a></li>
        <li class="active"><a href="#!">1</a></li>
        <li class="waves-effect"><a href="#!">2</a></li>
        <li class="waves-effect"><a href="#!"><i class="material-icons">chevron_right</i></a></li>
    </ul>
</div>
<jsp:include page="template/footer.jsp" />