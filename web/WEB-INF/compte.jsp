<jsp:include page="template/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="row">
    <div class="col s12">
      <ul class="tabs">
        <li class="tab col s3"><a href="#test1">Informations Compte</a></li>
        <li class="tab col s3"><a class="active" href="#test2">Informations Livraison</a></li>
        <li class="tab col s3"><a href="#test4">Dernières commandes</a></li>
      </ul>
    </div>
    <div id="test1" class="col s12">Informations Compte</div>
    <div id="test2" class="col s12">Informations Livraison</div>
    <div id="test4" class="col s12">Dernières commandes</div>
  </div>
<jsp:include page="template/footer.jsp" />



 <%--> <jsp:useBean id="client" scope="session" class="Modele.ClientModele" />
        <c:choose>
            <c:when test="${empty sessionScope.sessionUtilisateur }" >
                <section>	
                    <div class="accueil">
                        <div>
                            <div class="col-4 inscrire">
                                <form action="./ConnexionServlet" method="POST">
                                    <label>Login :</label><input type="text" placeholder="Nom d'utilisateur" name="login">
                                            ${form.erreurs['email']}
                                    <label>Mot de passe :</label><input type="password" placeholder="Mot de passe" name="motdepasse"></li>
                                            ${form.erreurs['motdepasse']}
                                        <a href=""><input type="submit" class="button" value="Se connecter"></a>
                                                <c:if test="${!empty requestScope.intervalleConnexions}">
                                            <li>Vous ne vous êtes pas connecté depuis ce navigateur depuis ${requestScope.intervalleConnexions}</li>
                                            </c:if>
                                            <c:if test="${empty requestScope.intervalleConnexions}">
                                            <li>Se souvenir de moi <input type="checkbox" name="memoire" /></li>
                                            </c:if>
                                </form> 
                            </div>

                            <a class="col-4 inscrire" href="./InscriptionServlet" title="Inscription">Se créer un compte</a>
                        </div>
                    </div>
                </section>
            </c:when>
            <c:otherwise>
                <section>	
                    <div class="col-4 inscrire">
                        <div>                    
                                <c:if test="${client.typeMembre.equals('CLIENT')}">
                                    <h1> Bienvenue <c:out value="${client.login}"/> ! ${client.typeMembre}</h1>
                                    <p><a href="./InfoClientServlet">Voir mon compte</></p>
                                    <p><a href="./CommandeClientServlet">Voir mes commandes</p> 
                                </c:if>
                                                
                                    <c:if test="${client.typeMembre.equals('ADMIN')}">
                                    <h1> Bienvenue <c:out value="${client.login}"/> ! ${client.typeMembre}</h1>
                                    <p><a href="./InfoAdminServlet">Gérer le site</></p>
                                            </c:if>

                                        <li><a href="./DeconnexionServlet"><div class="button"><span>Déconnexion</span></div></a></li>                                    
                        </div>
                    </div>
                </section>
            </c:otherwise>
        </c:choose>
    </body>
</html>