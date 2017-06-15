<jsp:include page="template/header.jsp" />
<section id="home">
    <div class="container center" style="padding: 15px;">
        <h1>Animalus</h1>
        <div class="slider">
            <ul class="slides">
                <li>
                    <img src="images/chiot.jpg"> <!-- random image -->
                    <div class="caption center-align">
                        <h3>Husky</h3>
                        <h5 class="light grey-text text-lighten-3">Il aime les câlins</h5>
                    </div>
                </li>
                <li>
                    <img src="images/chats.jpg"> <!-- random image -->
                    <div class="caption left-align">
                        <h3>Européen</h3>
                        <h5 class="light grey-text text-lighten-3">Il court vite</h5>
                    </div>
                </li>
                <li>
                    <img src="images/fritefrite.jpg"> <!-- random image -->
                    <div class="caption right-align">
                        <h3>Laveur de vitre</h3>
                        <h5 class="light grey-text text-lighten-3">Blop</h5>
                    </div>
                </li>
                <li>
                    <img src="images/oiseau.jpg"> <!-- random image -->
                    <div class="caption center-align">
                        <h3>Perruche</h3>
                        <h5 class="light grey-text text-lighten-3">Il vole toujours plus haut</h5>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</section>

<div id="modal1" class="modal">
    <div class="modal-content center-align">
      <img class="responsive-img" style="max-width: 70%" src="images/affiche.png">
    </div>
    <div class="modal-footer">
      <a href="#!" class="modal-action modal-close waves-effect waves-light btn"><i class="material-icons left">clear</i><i class="material-icons right">clear</i>COMPRIS</a>
    </div>
  </div>

<script>
    $(document).ready(function () {
        $('.slider').slider();
        $('.modal').modal();
        $('#modal1').modal('open');
    });

</script>
<jsp:include page="template/footer.jsp" />