<%-- 
    Document   : index
    Created on : 7 juin 2017, 09:23:45
    Author     : Thinkpad-Falcort
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/materialize.css">
        <link rel="stylesheet" href="css/font-awesome.css">
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
                    <li><a href="Connexion">Connexion</a></li>
                    <li><a href="inscription">Inscription</a></li>
                </ul>
                <ul class="side-nav" id="mobile-demo">
                    <li><a href="Chiens">Chiens</a></li>
                    <li><a href="Chats">Chats</a></li>
                    <li><a href="Oiseaux">Oiseaux</a></li>
                    <li><a href="Poissons">Poissons</a></li>
                    <li><a href="Divers">Divers</a></li>
                    <li><a href="Panier">Panier</a></li>
                    <li><a href="Connexion">Connexion</a></li>
                    <li><a href="inscription">Inscription</a></li>
                </ul>
            </div>
        </nav>
        <script>
        $( document ).ready(function(){
            $(".button-collapse").sideNav();
        })
        </script>
        <div class="container">
            <div class="col s6 center">
            <form method="GET">
            <div class="row">
                <div class="input-field col s6">
                    <input id="prenom" type="text" name="prenom" class="validate">
                    <label for="prenom">Prenom</label>
                </div>
                <div class="input-field col s6">
                    <input id="nom" type="text" name="nom" class="validate">
                    <label for="nom">Nom</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <input id="email" type="email" name="email" class="validate">
                    <label for="email">Email</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <input id="password" type="password" name="password" class="validate">
                    <label for="password">Mot de passe</label>
                </div>
            </div>
            <button class="btn waves-effect waves-light" type="submit" name="action">Submit
    <i class="material-icons right">send</i>
  </button>
        </form>
        </div>
        </div>
    </body>
</html>
