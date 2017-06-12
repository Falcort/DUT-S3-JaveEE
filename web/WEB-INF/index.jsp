<jsp:include page="template/header.jsp" />
<section id="home">
    <div class="container center" style="padding: 15px;">
        <h1>Animalus</h1>
        <div class="slider">
            <ul class="slides">
                <li>
                    <img src="images/chiot.jpg"> <!-- random image -->
                    <div class="caption center-align">
                        <h3>Race de chien</h3>
                        <h5 class="light grey-text text-lighten-3">Mangez les !</h5>
                    </div>
                </li>
                <li>
                    <img src="images/chats.jpg"> <!-- random image -->
                    <div class="caption left-align">
                        <h3>ptit batards</h3>
                        <h5 class="light grey-text text-lighten-3">Brulez les !</h5>
                    </div>
                </li>
                <li>
                    <img src="images/fritefrite.jpg"> <!-- random image -->
                    <div class="caption right-align">
                        <h3>Laveur de vitre</h3>
                        <h5 class="light grey-text text-lighten-3">Trop mignon <3 !</h5>
                    </div>
                </li>
                <li>
                    <img src="images/oiseau.jpg"> <!-- random image -->
                    <div class="caption center-align">
                        <h3>Truc qui vole</h3>
                        <h5 class="light grey-text text-lighten-3">Il ne reviendra jamais</h5>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</section>

<script>
    $(document).ready(function () {
        $('.slider').slider();
    });

</script>
<jsp:include page="template/footer.jsp" />