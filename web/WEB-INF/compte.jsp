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

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
${Compte['nom']}
${Compte['prenom']}
${Compte['pseudo']}
${Compte['email']}
${Compte['telephone']}
<%= request.getRemoteAddr() %>
<jsp:include page="template/footer.jsp" />