        <section id="inscription">
        <div class="container card-panel" style="padding: 15px;">
            <div class="col s6 center">
                <h1>Inscription</h1>
            <form action="./inscriptionScript" method="GET">
            <div class="row">
                <div class="input-field col s6">
                    <i class="material-icons prefix">account_circle</i>
                    <input id="prenom" type="text" name="prenom" class="validate">
                    <label for="prenom">Prenom</label>
                </div>
                <div class="input-field col s6">
                    <i class="material-icons prefix">account_circle</i>
                    <input id="nom" type="text" name="nom" class="validate">
                    <label for="nom">Nom</label>
                </div>
            </div>
                <div class="row">
                <div class="input-field col s6">
                    <i class="material-icons prefix">perm_identity</i>
                    <input id="pseudo" type="text" name="pseudo" class="validate">
                    <label for="pseudo">Pseudo</label>
                </div>
                <div class="input-field col s6">
                    <i class="material-icons prefix">phone</i>
                    <input id="telephone" type="tel" name="telephone" class="validate">
                    <label for="telephone">Telephone</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <i class="material-icons prefix">email</i>
                    <input id="email" type="email" name="email" class="validate">
                    <label for="email">Email</label>
                </div>
            </div>
                <div class="row">
                <div class="input-field col s12">
                    <i class="material-icons prefix">email</i>
                    <input id="emailRe" type="email" name="emailRe" class="validate">
                    <label for="emailRe">Confirmez Email</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <i class="material-icons prefix">lock</i>
                    <input id="password" type="password" name="password" class="validate">
                    <label for="password">Mot de passe</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <i class="material-icons prefix">lock</i>
                    <input id="password" type="password" name="passwordRe" class="validate">
                    <label for="passwordRe">Confirmez mot de passe</label>
                </div>
            </div>
            <button class="btn waves-effect waves-light" type="submit" name="action">Inscription
    <i class="material-icons right">send</i>
  </button>
        </form>
        </div>
        </div>
        </section>