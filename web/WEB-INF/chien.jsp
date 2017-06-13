<jsp:include page="template/header.jsp" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>

  <body>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<div class="col-12">
                    <c:forEach items="${liste}" var="produit" >
                        <section>	
                            <div>
                                <div>
                                    <form name="model1" method="POST" action="./PanierControle">							
                                        <a href="./ProductServlet?i=<c:out value="${dogProd['idDog']}"/>"><img class="ballons"src="<c:out value="${dogProd['photoDog']}"/>" alt=""></a>                                      
                                        <div>
                                            <input type="hidden" name="modelNo" value="<c:out value="${dogProd['raceProd']}"/>">
                                            <p><c:out value="${dogProd['raceDog']}"/></p>
                                            <input type="hidden" size="2" value="1" name="quantity">

                                            <input type="hidden" name="price" value="<c:out value="${dogProd['priceDog']}"/>">
                                            <p>Prix :<c:out value="${dogProd['priceDog']}"/> euros</p> 
                                            
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