<jsp:include page="template/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="row">
    <div class="col s12">
      <ul class="tabs">
        <li class="tab col s3"><a class="active" href="#test1">Informations Compte</a></li>
        <li class="tab col s3"><a href="#test2">Informations Livraison</a></li>
        <li class="tab col s3"><a href="#test4">Dernières commandes</a></li>
      </ul>
    </div>
    <div id="test1" class="col s12">
        <h3>Informations Compte</h3>
        <h5>Pseudo :</h5> ${Compte['pseudo']}
        <p><a class="waves-effect waves-light btn"><i class="material-icons right">perm_identity</i>Modifier</a></p>
        <h5>Nom :</h5> ${Compte['nom']}
        <p><a class="waves-effect waves-light btn"><i class="material-icons right">account_circle</i>Modifier</a></p>
        <h5>Prénom :</h5> ${Compte['prenom']}
        <p><a class="waves-effect waves-light btn"><i class="material-icons right">account_circle</i>Modifier</a></p>
        <h5>Email : </h5>${Compte['email']}
        <p><a class="waves-effect waves-light btn"><i class="material-icons right">email</i>Modifier</a></p>
        <h5>Tel : </h5>${Compte['telephone']}
        <p><a class="waves-effect waves-light btn"><i class="material-icons right">phone</i>Modifier</a></p>
        <h5>Adresse IP :</h5><%= request.getRemoteAddr() %>
        <h5>Mot de passe :</h5> <a class="waves-effect waves-light btn"><i class="material-icons right">lock</i>Modifier</a>
    </div>
    <div id="test2" class="col s12">
        <h3>Informations Livraison</h3>
        <p>Nom :</p>
        <a class="waves-effect waves-light btn"><i class="material-icons right">account_circle</i>Modifier</a>
        <p>Prénom :</p>
        <a class="waves-effect waves-light btn"><i class="material-icons right">account_circle</i>Modifier</a>
        <p>Tel :</p>
        <a class="waves-effect waves-light btn"><i class="material-icons right">phone</i>Modifier</a>
        <p>Adresse : </p> 
        <a class="waves-effect waves-light btn"><i class="material-icons right">location_on</i>Modifier</a>  
    </div>
    <div id="test4" class="col s12">
        <h3>Dernières commandes</h3>
        <table>
           <thead>
                <tr>
                    <th>Nom</th>
                    <th>Prix</th>
                </tr>
            </thead>
        </table>
    </div>
<jsp:include page="template/footer.jsp" />