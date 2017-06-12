<jsp:include page="template/header.jsp" />
<%-- 
    Document   : panier
    Created on : Jun 12, 2017, 9:35:44 AM
    Author     : Jennifer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <body>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <section>

            <div class="col-10 panier">
                <h1>Votre panier :</h1>
                <jsp:useBean id="cart" scope="session"/>
                <c:choose>
                    <c:when test="${cart.lineItemCount==0}" > 
                        Votre panier est vide.
                    </c:when> 
                    <c:otherwise>
                        <c:forEach var="cartItem" items="${cart.cartItems}" varStatus="counter">
                            <form name="item" method="POST" action="#">
                                <c:out value="${cartItem.partNumber}"/> </BR>
                                <c:out value="${cartItem.modelDescription}"/> </BR>
                                <input type='hidden' name='itemIndex' value='<c:out value="${counter.count}"/>'><input type='text' name="quantity" value='<c:out value="${cartItem.quantity}"/>' size='2'> <input class="button" type="submit" name="action" value="Delete"><input class="button" type="submit" name="action" value="Update"></BR>

                                Prix unitaire : <c:out value="${cartItem.unitCost}"/> euros</BR>
                                Prix total : <c:out value="${cartItem.totalCost}"/> euros</BR></BR>
                            </form>
                        </c:forEach>   
                        Total: $<c:out value="${cart.orderTotal}"/>

                        <c:choose>
                            <c:when test="${empty sessionScope.sessionUtilisateur}" >
                                Connectez-vous pour accéder au paiement.
                            </c:when>
                            <c:otherwise>
                                <a href="./PaiementControle"><button class="button"><span>Payer ?</span></button></a>
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="col-2 achat">
                <a href="./index" title="achat"><p>Poursuivez vos achats.</p></a>
            </div>

        </section>

    </body>

</html>

<jsp:include page="template/footer.jsp" />
