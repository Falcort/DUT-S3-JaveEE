<jsp:include page="template/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    if (request.getAttribute("Panier") == null)
    {
%>
<div id="card-alert" class="card red">
    <div class="card-content white-text center-align">
        <p><i class="material-icons">report_problem</i> ERREUR : Votrez panier est vide</p>
    </div>
</div>
<%
}
else
{
%>
<div class="row" style="margin-top: 25px">
    <div class="col s12">
        <nav>
            <div class="nav-wrapper center-align">
                <div class="col s12">
                    <a href="./Panier" class="breadcrumb" id="panier">Panier</a>
                    <a href="#!" class="breadcrumb">Adresse de livraison</a>
                    <a href="#!" class="breadcrumb">Payement</a>
                    <a href="#!" class="breadcrumb">Confirmation</a>
                </div>
            </div>
        </nav>
    </div>
</div>
<table class="striped">
    <thead>
        <tr>

            <th>Nom de l'article</th>
            <th>Action</th>
            <th>Prix</th>
        </tr>
    </thead>
    <tfoot style="border-top: 2px solid black">
        <tr>
            <td></td>
            <td><b>Total :</b></td>
            <td><b>${Total}</b></td>
        </tr>
    </tfoot>
    <tbody>
        <c:forEach items="${Panier}" var="article" >
            <tr>
                <td><c:out value="${article['nomArticle']}"/></td>
                <td>
                    <form action="./SupprimerArticlePanier" method="POST">
                        <input hidden type="text" name="id" value="<c:out value="${article['idArticle']}"/>">
                        <input hidden type="text" name="nom" value="<c:out value="${article['nomArticle']}"/>">
                        <button class="btn waves-effect waves-light" type="submit" name="action">Supprimer
                            <i class="material-icons right">clear</i>
                        </button>
                    </form>
                </td>
                <td><c:out value="${article['prixArticle']}"/></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<div class="row center-align" style="margin-top: 25px">
    <div class="col s6">
        <a class="waves-effect waves-light btn"><i class="material-icons left">playlist_add</i>Sauvegarder le panier</a>
    </div>
    <div class="col s6">
        <a class="waves-effect waves-light btn"><i class="material-icons right">payment</i>Payer !</a>
    </div>
</div>
<%
    }
%>
<jsp:include page="template/footer.jsp" />
