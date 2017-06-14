<jsp:include page="template/header.jsp" />
<div class="row" style="margin-top: 25px">
    <div class="col s12">
        <nav>
            <div class="nav-wrapper center-align">
                <div class="col s12">
                    <a href="./Panier" class="breadcrumb">Panier</a>
                    <a href="#!" class="breadcrumb" id="address">Adresse de livraison</a>
                    <a href="#!" class="breadcrumb">Payement</a>
                    <a href="#!" class="breadcrumb">Confirmation</a>
                </div>
            </div>
        </nav>
    </div>
</div>

<section id="adresseLivraison" class="col s12">
    <div class="container card-panel" style="padding: 15px;">
        <div class="col s10 center">
            <h1>Adresse de livraison</h1>
            <form action="./adresseLivraisonController" method="POST">
                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">account_circle</i>
                        <input id="prenom" type="text" name="prenom" class="validate">
                        <label for="prenom">Prenom</label>
                        <span class="erreur" >${formu.erreurs['prenom']}</span>
                    </div>
                    <div class="input-field col s6">
                        <i class="material-icons prefix">account_circle</i>
                        <input id="nom" type="text" name="nom" class="validate">
                        <label for="nom">Nom</label>
                        <span class="erreur">${formu.erreurs['nom']}</span>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">phone</i>
                        <input id="telephone" type="tel" name="telephone" class="validate">
                        <label for="telephone">Telephone</label>
                        <span class="erreur">${formu.erreurs['telephone']}</span>
                    </div>
                    <div class="input-field col s6">
                        <i class="material-icons prefix">location_on</i>
                        <input id="adresse" type="text" name="adresse" class="validate">
                        <label for="adresse">Adresse</label>
                        <span class="erreur">${formu.erreurs['adresse']}</span>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">location_on</i>
                        <input id="adresse" type="text" name="cp" class="validate">
                        <label for="cp">Code Postal</label>
                        <span class="erreur">${formu.erreurs['cp']}</span>
                    </div>
                    <div class="input-field col s6">
                        <i class="material-icons prefix">location_on</i>
                        <input id="ville" type="text" name="ville" class="validate">
                        <label for="ville">Ville</label>
                    <span class="erreur">${formu.erreurs['ville']}</span>
                    </div>
                </div>
                <button class="btn waves-effect waves-light" type="submit" name="action">Valider
                    <i class="material-icons right">send</i>
                </button>
            </form>
        </div>
    </div>
</section>
<jsp:include page="template/footer.jsp" />