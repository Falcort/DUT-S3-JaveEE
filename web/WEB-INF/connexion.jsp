
<section id="connexion">
    <div class="container card-panel" style="padding: 15px;">
        <div class="col s6 center">
            <h1>Connexion</h1>
            <form action="./connexionScript" method="GET">
                <div class="row">
                    <div class="input-field col s12">
                        <i class="material-icons prefix">email</i>
                        <input id="email" type="email" name="email" class="validate">
                        <label for="email">Email</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <i class="material-icons prefix">lock</i>
                        <input id="password" type="password" name="password" class="validate">
                        <label for="password">Mot de passe</label>
                    </div>
                </div>
                <button class="btn waves-effect waves-light" type="submit" name="action">Connexion
                    <i class="material-icons right">send</i>
                </button>
            </form>
        </div>
    </div>
</section>