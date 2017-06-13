<jsp:include page="template/header.jsp" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>

  <body>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<div class="col-12">
                    <c:forEach items="${liste}" var="produit" >
                        <section class="test">	
                            <div>
                                <div id="ballon">
                                    <form name="model1" method="POST" action="./PanierControle">							
                                        <a href="./ProductServlet?i=<c:out value="${produit['idProduit']}"/>"><img class="ballons" src="images\chaussures<c:out value="${produit['photoProduit']}"/>" alt=""></a>                                      
                                        <div class="case">
                                            <input type="hidden" name="modelNo" value="<c:out value="${produit['nomProduit']}"/>">
                                            <p class="nomproduit"><c:out value="${produit['nomProduit']}"/></p>
                                            <input type="hidden" size="2" value="1" name="quantity">

                                            <input type="hidden" name="price" value="<c:out value="${produit['prixProduit']}"/>">
                                            <p class="prixactuel">Prix :<c:out value="${produit['prixProduit']}"/> euros</p> 
                                            
                                            <input type="hidden" name="action" value="add">
                                            <input class="button" type="submit" name="addToCart" value="Ajouter" >
                                            
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </section>		
                    </c:forEach>   
		</div>
  </body>
</html>

<jsp:include page="template/footer.jsp" />