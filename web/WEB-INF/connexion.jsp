<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/materialize.css">
        <link rel="stylesheet" href="css/font-awesome.css">
        <link rel="stylesheet" href="css/style.css">
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script type="application/javascript" src="js/jquery.js"></script>
        <script type="application/javascript" src="js/materialize.js"></script>
        <title>Animalus</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <nav>
            <div class="nav-wrapper">
                <a href="#!" class="brand-logo center">
                    <img src="images/logo.gif" style="max-height: 60px;" />
                </a>
                <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="fa fa-bars" aria-hidden="true"></i></a>
                <ul class="left hide-on-med-and-down">
                    <li><a href="Chiens">Chiens</a></li>
                    <li><a href="Chats">Chats</a></li>
                    <li><a href="Oiseaux">Oiseaux</a></li>
                    <li><a href="Poissons">Poissons</a></li>
                    <li><a href="Divers">Divers</a></li>
                </ul>
                <ul class="right hide-on-med-and-down">
                    <li><a href="Panier">Panier</a></li>
                    <li><a href="connexion">Connexion</a></li>
                    <li><a href="inscription">Inscription</a></li>
                </ul>
                <ul class="side-nav" id="mobile-demo">
                    <li><a href="Chiens">Chiens</a></li>
                    <li><a href="Chats">Chats</a></li>
                    <li><a href="Oiseaux">Oiseaux</a></li>
                    <li><a href="Poissons">Poissons</a></li>
                    <li><a href="Divers">Divers</a></li>
                    <li><a href="Panier">Panier</a></li>
                    <li><a href="connexion">Connexion</a></li>
                    <li><a href="inscription">Inscription</a></li>
                </ul>
            </div>
        </nav>
        <script>
        $( document ).ready(function(){
            $(".button-collapse").sideNav();
        })
        </script>
        <section id="connexion">
        <div class="container card-panel" style="padding: 15px;">
            <div class="col s6 center">
                <h1>Connexion</h1>
            <form action="./connexionScript" method="GET">
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
        </section>
    </body>
</html>