<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>HEADER | E-COMMERCE WEBSITE</title>
    <!-- favicon -->
    <link rel="icon" href="https://yt3.ggpht.com/a/AGF-l78km1YyNXmF0r3-0CycCA0HLA_i6zYn_8NZEg=s900-c-k-c0xffffffff-no-rj-mo" type="image/gif" sizes="16x16">
    <!-- EXTERNAL LINKS -->
    <link rel="stylesheet" href="css/header.css">
    <script src="https://kit.fontawesome.com/4a3b1f73a2.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Lato&display=swap" rel="stylesheet">
</head>
<body>
    <header>
        <section>
            
            <div id="container">
                <div id="shopName"><a href="#"> <b>C</b>entre de ressources telecom </a></div>
                <div id="collection">
                    <div><a href="recherche"> Recherche </a></div>
                    <div><a href="consultation"> Consultation des reservations </a></div>
                    <div><a href="list"> boutiques </a></div>
                </div>
                <!-- SEARCH SECTION -->
                <div id="search">
                    <i class="fas fa-search search"></i>
                    <input type="text" id="input" name="searchBox" placeholder="chercher une boutique ">
                </div>
                <!-- USER SECTION (CART AND USER ICON) -->
                <div id="user">
                    <a class="" href="/ressource/profil">
                        <img class="profil" src="data:image/jpeg;base64,${base64Image}" alt="Photo de profil" class="profiles-img"> 
                    </a>
                </div>
            </div>
        </section>
    </header>
</body>
</html>
<style>
    .profil {
    width: 60px;
    height: 60px;
    border-radius: 50%;
    object-fit: cover; /* Cela garantit que l'image remplit bien le conteneur sans être étirée */
    margin-right: 10px;
}

    body {
       
  


       
    padding-top: 0px; /* Ajustez cette valeur en fonction de la hauteur du header */
}

    #container {
        background-color: rgb(0, 0, 0);
        margin: auto;
        text-align: center;
        width: 100%;
        display: grid;
        grid-gap: 60px;
        grid-template-columns: 3fr 5fr 5fr 0.5fr;
        font-family:Arial, Helvetica, sans-serif ;
        z-index: 1;
        justify-content: space-between;
        align-items: center;
        margin-top: 0px;
        padding:15px 40px;
        box-sizing: border-box;
        position: fixed;
        box-shadow: 0 1px 2px 0 rgba(60, 64, 67, 0.302), 0 2px 6px 2px rgba(60, 64, 67, 0.149); 
    }
    #shopName {
        font-size: 25px; 
        font-family: 'Lato', sans-serif;
    }
    #shopName a {
        text-decoration: none;
        color:#ff8c00;
    }

    #collection {
        font-weight: bold;
        display: flex;
        font-family: Arial, Helvetica, sans-serif;
        
        gap: 30px;
    }
    #collection a {
     text-decoration:none;
        color: rgb(188, 161, 161);
       
        display:inline-flex flexbox;
        transition: color 0.6s, background-color 0.5s;
    }
    #collection a:hover {
        color: #ffffff;
        font-size: larger;
        border-radius: 10px;
    }
    .search {
        padding: 14px;
        color: #ff8c00;
        min-width: 25px;
        text-align: center;
        position: absolute;
    }
    #input {
    width: 100%;
    max-width: 35em; /* Pour une limite maximale sur les grands écrans */
    height: 3em;
    padding: 2px 50px;
    background-color: rgb(241, 241, 241);
    border: none;
    border-radius: 5px;
    transition: width 0.4s ease; /* Animation de la largeur au focus */
}
#input:focus {
    width: 40em; /* Augmente la taille lorsque l'utilisateur clique dessus */
    outline: none;
}

    #input::placeholder {
        font-weight: bold;
    }
  
    #user {
        display: flex;
        align-items: center;
    }
    
</style>

