<jsp:include page="template/header.jsp" />

<%
    if(request.getAttribute("Panier") == null)
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
            <th>Quantity</th>
            <th>Prix</th>
        </tr>
    </thead>
    <tfoot style="border-top: 2px solid black">
        <tr>
            <td></td>
            <td><b>Total :</b></td>
            <td><b>$180</b></td>
        </tr>
    </tfoot>
    <tbody>
        <tr>
            <td>Alvin</td>
            <td>Eclair</td>
            <td>$0.87</td>
        </tr>
        <tr>
            <td>Alan</td>
            <td>Jellybean</td>
            <td>$3.76</td>
        </tr>
        <tr>
            <td>Jonathan</td>
            <td>Lollipop</td>
            <td>$7.00</td>
        </tr>
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
