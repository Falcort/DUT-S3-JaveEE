<%
    Boolean connected = false;
    if (request.getCookies() != null)
    {
        Cookie[] cookies = request.getCookies();
        Boolean id = false;
        Boolean isLogged = false;

        for (int i = 0; i < cookies.length; i++)
        {
            System.out.println("HEADER : " + i);
            Cookie cookieTmp = cookies[i];
            if (cookieTmp.getName().equals("id"))
            {
                id = true;
            }
            if (cookieTmp.getName().equals("isLogged"))
            {
                isLogged = true;
            }
        }
        if (id && isLogged)
        {
            connected = true;
        }
    }
%>

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
                <a href="./index" class="brand-logo center">
                    <img src="images/logo.gif" style="max-height: 60px;" />
                </a>
                <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="fa fa-bars" aria-hidden="true"></i></a>

                <ul class="left hide-on-med-and-down">
                    <li><a href="Chiens">Chiens</a></li>
                    <li><a href="./Chat">Chats</a></li>
                    <li><a href="Oiseaux">Oiseaux</a></li>
                    <li><a href="Poissons">Poissons</a></li>
                    <li><a href="Divers">Divers</a></li>
                </ul>
                <%
                    if (!connected)
                    { %>
                <ul class="right hide-on-med-and-down">
                    <li><a href="Panier"><i class="material-icons left">shopping_basket</i>  Panier</a></li>
                    <li>
                        <a class="dropdown-button" href="#!" data-activates="dropdown1">
                            <i class="material-icons left">person_pin</i>   Compte
                            <i class="material-icons right">arrow_drop_down</i>
                        </a>
                    </li>
                </ul>
                <ul id="dropdown1" class="dropdown-content z-depth-2" style="margin-top: 64px;">
                    <li><a href="./Connexion"><i class="material-icons left">lock_open</i>  Connexion</a></li>
                    <li><a href="./Inscription"><i class="material-icons left">perm_identity</i>   Inscription</a></li>
                </ul> 
                <ul class="side-nav" id="mobile-demo">
                    <li><a href="Chiens">Chiens</a></li>
                    <li><a href="Chats">Chats</a></li>
                    <li><a href="Oiseaux">Oiseaux</a></li>
                    <li><a href="Poissons">Poissons</a></li>
                    <li><a href="Divers">Divers</a></li>
                    <li><a href="Panier"><i class="material-icons left">shopping_cart</i> Panier</a></li>
                    <li><a href="./Connexion"> <i class="material-icons left">lock_open</i>Connexion</a></li>
                    <li><a href="./Inscription"><i class="material-icons left">perm_identity</i> Inscription</a></li>
                </ul>
                <%
                }
                else
                {
                %>
                <ul class="right hide-on-med-and-down">
                    <li><a href="Panier"><i class="material-icons left">shopping_cart</i>  Panier</a></li>
                    <li><a href="Panier"><i class="material-icons left">dashboard</i>  Mon compte</a></li>
                    <li>
                        <a class="waves-effect waves-light btn" href="./Deconnexion">
                            <i class="large material-icons right">power_settings_new</i>   Deconnexion
                        </a>
                    </li>
                </ul>
                <ul class="side-nav" id="mobile-demo">
                    <li><a href="Chiens">Chiens</a></li>
                    <li><a href="./Chat">Chats</a></li>
                    <li><a href="Oiseaux">Oiseaux</a></li>
                    <li><a href="Poissons">Poissons</a></li>
                    <li><a href="Divers">Divers</a></li>
                    <li><a href="Panier"><i class="material-icons left">shopping_cart</i> Panier</a></li>
                    <li><a href="Panier"><i class="material-icons left">dashboard</i>  Mon compte</a></li>
                    <li>
                        <a class="waves-effect waves-light btn" href="./Deconnexion">
                            <i class="large material-icons right">power_settings_new</i>   Deconnexion
                        </a>
                    </li>
                </ul>
                <%
                    }
                %>
            </div>
        </nav>
                    <!-- Element Showed -->
  <a id="menu" class="waves-effect waves-light btn btn-floating btn-large pulse" ><i class="material-icons">menu</i></a>

  <!-- Tap Target Structure -->
  <div class="tap-target" data-activates="menu" style="overflow: hidden">
    <div class="tap-target-content" style="overflow: hidden">
      <h4>ANIMALUS</h4>
      <h5>Lance sont service d'adoption !</h5>
      <p>Adoptez un animal en nous contactant au :</p><p>04 42 42 42 42</p>
    </div>
  </div>
        <script>
            $(document).ready(function () {
                $(".button-collapse").sideNav();
                $(".dropdown-button").dropdown();
                
                i = 0;
                $('#menu').on('click', function(e) {
                    if(i%2 == 0)
                    {
                       $('.tap-target').tapTarget('open'); 
                    }
                    else
                    {
                        $('.tap-target').tapTarget('close');
                    }
                });
            });
        </script>
 
        <main>
            <div class="container">