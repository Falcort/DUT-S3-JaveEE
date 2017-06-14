<%@page import="java.util.ArrayList"%>
<%@page import="Class.Article"%>
<jsp:include page="template/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="products" class="row">
    <c:forEach items="${Chat}" var="article" >
        <div class="col s6">
            <div class="card">
                <div class="card-image waves-effect waves-block waves-light">
                    <a class="btn-floating btn-large btn-price waves-effect waves-light red"><c:out value="${article['prixArticle']}"/></a>
                    <a>
                        <img src="images/<c:out value="${article['photoArticle']}"/>" alt="">
                    </a>
                </div>
                <ul class="card-action-buttons">
                    <form>
                        <li>
                            <a class="btn-floating waves-effect waves-light light-blue">
                                <i class="material-icons">
                                    info_outline
                                </i>
                            </a>
                        </li>
                    </form>
                    <form>
                        <li>
                            <a class="btn-floating waves-effect waves-light red">
                                <i class="material-icons">
                                    add
                                </i>
                            </a>
                        </li>
                    </form>
                </ul>
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