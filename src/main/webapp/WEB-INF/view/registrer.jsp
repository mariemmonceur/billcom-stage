<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Créer une ressource</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <style>
        body {
            background-color: #eee7e3;
        }
        .toast-container {
            position: absolute;
            top: 20px;
            right: 20px;
        }
        .card {
            border: 2px solid #FF8C00;
        }
        .card-header {
            background-color: #FF8C00;
            color: rgb(255, 255, 255);
            font-size: 24px;
            font-family: Arial, Helvetica, sans-serif;
        } 

        .font{
            font-family: Arial, Helvetica, sans-serif;
            
        }
        .btn-custom {
        background-color: #FF8C00; /* Couleur de fond par défaut (blanc) */
        color: #000000; /* Couleur du texte par défaut (noir) */
        color: rgb(0, 0, 0);
            font-size: 18px;
            font-family: Arial, Helvetica, sans-serif;
        border: 2px solid #000000; /* Bordure noire par défaut */
        transition: background-color 0.3s, color 0.3s; /* Transition fluide pour les changements de couleur */
    }

    .btn-custom:hover {
        background-color: #000000; /* Couleur de fond au survol (noir) */
        color: #FF8C00; /* Couleur du texte au survol (orange) */
        border: 2px solid #FF8C00; /* Bordure orange au survol */
    } .category-container {
        border: 2px solid #000000; /* Couleur de la bordure */
        border-radius: 5px; /* Coins arrondis de la bordure */
        padding: 15px; /* Espacement interne autour des éléments */
        background-color: #f8f9fa; /* Couleur de fond du conteneur */
    }

    .category-container .form-check {
        margin-bottom: 10px; /* Espacement entre les boutons radio */
    }

    .category-container .form-check-input {
        margin-right: 10px; /* Espacement entre le bouton radio et l'étiquette */
    }

    .category-container .form-check-label {
        font-size: 16px; /* Taille de la police des étiquettes */
    }

    .category-container .form-check-input:checked ~ .form-check-label {
        font-weight: bold; /* Texte en gras pour l'option sélectionnée */
    }
        .btn-primary {
            background-color: #FF8C00;
            border-color: #FF8C00;
            font-family: Arial, Helvetica, sans-serif;
            color: rgb(0, 0, 0);
            font-size: 20px;
        }
        .form-label, .form-check-label {
            color: #000000;
            font-family: Arial, Helvetica, sans-serif;
            font-size:20px;
        }
        .form-control, .form-select {
            border: 1px solid #000000;
        }
        .form-check-input:checked {
            background-color: #FF8C00;
            border-color: #FF8C00;
        }
        .form-check-input:focus {
            box-shadow: 0 0 0 0.2rem rgba(255, 102, 0, 0.25);
        }
    </style>
</head>

<body>
   
    <%@ include file="navbarr.jsp" %>

    <div class="container mt-4">
        <div class="card" style="background-color: antiquewhite;">
            <div class="card-header text-center">Ajouter un vendeur</div>
            <div class="card-body">
                <form class="row g-3" method="post"  modelAttribute="vendeur"  enctype="multipart/form-data" action="/ressource/register">

                    
                    <div class="col-md-3">
                        <label for="name" class="form-label">nom</label>
                        <input type="text" class="form-control" id="name" name="nom">
                    </div>
                    
                    <div class="col-md-3">
                        <label for="surname" class="form-label">prénom</label>
                        <input type="text" class="form-control" id="surname" name="prenom">
                    </div>
                    <div class="col-md-3">
                        <label for="phone" class="form-label">telephone: </label>
                        <input type="tel" class="form-control" id="phone" name="telephone">
                    </div>
                    
                    <div class="col-md-6">
                        <label for="inputEmail4" class="form-label">Email</label>
                        <input type="email" class="form-control" id="inputEmail4" name="email">
                    </div>
                  
                    <div class="col-md-6">
                        <label for="inputPassword4" class="form-label">mot de passe</label>
                        <input type="password" class="form-control" id="inputPassword4" name="mdp">
                    </div>
                    <div class="col-12">
                        <label for="inputAddress" class="form-label">Adresse</label>
                        <input type="text" class="form-control" id="inputAddress" name="adresse" placeholder="Tunisie, Sousse, Jawhara">
                    </div>
                    
                    
                        <div class="col-md-6">
                            <label for="inputCity" class="form-label">Gouvernorat</label>
                            <select id="inputCity" name="city" class="form-control" onchange="updateStates()">
                               
                                <option value="Ariana">Ariana</option>
                                <option value="Béja">Béja</option>
                                <option value="Ben Arous">Ben Arous</option>
                                <option value="Bizerte">Bizerte</option>
                                <option value="Gabes">Gabes</option>
                                <option value="Gafsa">Gafsa</option>
                                <option value="Jendouba">Jendouba</option>
                                <option value="Kairouan">Kairouan</option>
                                <option value="Kasserine">Kasserine</option>
                                <option value="Kebili">Kebili</option>
                                <option value="La Manouba">La Manouba</option>
                                <option value="Le Kef">Le Kef</option>
                                <option value="Mahdia">Mahdia</option>
                                <option value="Médenine">Médenine</option>
                                <option value="Monastir">Monastir</option>
                                <option value="Nabeul">Nabeul</option>
                                <option value="Sfax">Sfax</option>
                                <option value="Sidi Bouzid">Sidi Bouzid</option>
                                <option value="Siliana">Siliana</option>
                                <option value="Sousse">Sousse</option>
                                <option value="Tataouine">Tataouine</option>
                                <option value="Tozeur">Tozeur</option>
                                <option value="Tunis">Tunis</option>
                                <option value="Zaghouan">Zaghouan</option>
                               
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label for="inputState" class="form-label">Délégation</label>
                            <select id="inputState" class="form-control" name="state">
                                <option value="" selected>Choose...</option>
                            </select>
                        </div>
                    
                   
                    
                    <div class="col-md-12">
                        <label class="form-label">Catégorie du Vendeur</label>
                        <div class="category-container">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="categorie" id="vipExclusive" value="exclusive">
                                <label class="form-check-label" for="vipExclusive">
                                    Accès Exclusif (Choix des numéros permis)
                                </label>
                                
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="categorie" id="vipStandard" value="standard" checked>
                                <label class="form-check-label" for="vipStandard">
                                    Accès Standard (Numéros attribués automatiquement)
                                </label>
                                
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <label for="profilePicture" class="form-label">Photo de Profil</label>
                        <input type="file" class="form-control" id="pdp" name="pdp" accept="image/*">
                    </div>
                    
                    <div  class="col-md-12"> </div>
                    <div class="col-12">
                        <button type="submit" class="btn btn-custom mt-3">Enregistrer</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script>
    function updateStates() {
        var city = document.getElementById("inputCity").value;
        var stateSelect = document.getElementById("inputState");

        // Effacer les options actuelles
        stateSelect.innerHTML = '<option value="" selected>Choisir...</option>';

        // Définir les états associés à chaque ville
        var states = {
            "Beja": ["Amdoun", "Beja Nord", "Beja Sud", "Goubellat", "Mejez El Bab", "Nefza", "Teboursouk", "Testour", "Thibar"],
            "Ben Arous": ["Ben Arous", "Bou Mhel El Bassatine", "El Mourouj", "Ezzahra", "Fouchana", "Hammam Chatt", "Hammam Lif", "Megrine", "Mohamadia", "Mornag", "Nouvelle Medina", "Rades"],
            "Bizerte": ["Bizerte Nord", "Bizerte Sud", "El Alia", "Ghar El Melh", "Ghezala", "Jarzouna", "Joumine", "Mateur", "Menzel Bourguiba", "Menzel Jemil", "Ras Jebel", "Sejnane", "Tinja", "Utique"],
            "Gabes": ["El Hamma", "El Metouia", "Gabes Medina", "Gabes Ouest", "Gabes Sud", "Ghannouche", "Mareth", "Matmata", "Menzel Habib", "Nouvelle Matmata"],
            "Gafsa": ["Belkhir", "El Guettar", "El Ksar", "El Mdhilla", "Gafsa Nord", "Gafsa Sud", "Metlaoui", "Moulares", "Redeyef", "Sidi Aich", "Sned"],
            "Jendouba": ["Ain Draham", "Balta Bou Aouene", "Bou Salem", "Fernana", "Ghardimaou", "Jendouba", "Jendouba Nord", "Oued Mliz", "Tabarka"],
            "Kairouan": ["Bou Hajla", "Chebika", "Cherarda", "El Ala", "Haffouz", "Hajeb El Ayoun", "Kairouan Nord", "Kairouan Sud", "Nasrallah", "Oueslatia", "Sbikha"],
            "Kasserine": ["El Ayoun", "Ezzouhour", "Feriana", "Foussana", "Haidra", "Hassi El Frid", "Jediliane", "Kasserine Nord", "Kasserine Sud", "Mejel Bel Abbes", "Sbeitla", "Sbiba", "Thala"],
            "Kebili": ["Douz", "El Faouar", "Kebili Nord", "Kebili Sud", "Souk El Ahad"],
            "La Manouba": ["Borj El Amri", "Douar Hicher", "El Battan", "Jedaida", "Mannouba", "Mornaguia", "Oued Ellil", "Tebourba"],
            "Le Kef": ["Dahmani", "El Ksour", "Jerissa", "Kalaa El Khasba", "Kalaat Sinane", "Le Kef Est", "Le Kef Ouest", "Le Sers", "Nebeur", "Sakiet Sidi Youssef", "Tajerouine", "Touiref"],
            "Mahdia": ["Bou Merdes", "Chorbane", "El Jem", "Hbira", "Ksour Essaf", "La Chebba", "Mahdia", "Melloulech", "Ouled Chamakh", "Sidi Alouene", "Souassi"],
            "Médenine": ["Ajim", "Ben Guerdane", "Beni Khedache", "Houmet Essouk", "Medenine Nord", "Medenine Sud", "Midoun", "Sidi Makhlouf", "Zarzis"],
            "Monastir": ["Bekalta", "Bembla", "Beni Hassen", "Jemmal", "Ksar Helal", "Ksibet El Mediouni", "Moknine", "Monastir", "Ouerdanine", "Sahline", "Sayada", "Lamta", "Bou Hajar", "Teboulba", "Zeramdine"],
            "Nabeul": ["Beni Khalled", "Beni Khiar", "Bou Argoub", "Dar Chaabane Elfehri", "El Haouaria", "El Mida", "Grombalia", "Hammam El Ghezaz", "Hammamet", "Kelibia", "Korba", "Menzel Bouzelfa", "Menzel Temime", "Nabeul", "Soliman", "Takelsa"],
            "Sfax": ["Agareb", "Bir Ali Ben Khelifa", "El Amra", "El Hencha", "Esskhira", "Ghraiba", "Jebeniana", "Kerkenah", "Mahras", "Menzel Chaker", "Sakiet Eddaier", "Sakiet Ezzit", "Sfax Est", "Sfax Sud", "Sfax Ville"],
            "Sidi Bouzid": ["Ben Oun", "Bir El Haffey", "Cebbala", "Jilma", "Maknassy", "Menzel Bouzaiene", "Mezzouna", "Ouled Haffouz", "Regueb", "Sidi Bouzid Est", "Sidi Bouzid Ouest", "Souk Jedid"],
            "Siliana": ["Bargou", "Bou Arada", "El Aroussa", "Gaafour", "Kesra", "Le Krib", "Makthar", "Rohia", "Sidi Bou Rouis", "Siliana Nord", "Siliana Sud"],
            "Sousse": ["Akouda", "Bou Ficha", "Enfidha", "Hammam Sousse", "Hergla", "Kalaa El Kebira", "Kalaa Essghira", "Kondar", "Msaken", "Sidi Bou Ali", "Sidi El Heni", "Sousse Jaouhara", "Sousse Riadh", "Sousse Ville"],
            "Tataouine": ["Bir Lahmar", "Dhehiba", "Ghomrassen", "Remada", "Smar", "Tataouine Nord", "Tataouine Sud"],
            "Tozeur": ["Degueche", "Hezoua", "Nefta", "Tameghza", "Tozeur"],
            "Tunis": ["Bab Bhar", "Bab Souika", "Carthage", "Cite El Khadra", "El Hrairia", "El Kabbaria", "El Kram", "El Menzah", "El Omrane", "El Omrane Superieur", "El Ouerdia", "Essijoumi", "Ettahrir", "Ezzouhour", "Jebel Jelloud", "La Goulette", "La Marsa", "La Medina", "Le Bardo", "Sidi El Bechir", "Sidi Hassine"],
            "Zaghouan": ["Bir Mcherga", "El Fahs", "Ennadhour", "Hammam Zriba", "Saouef", "Zaghouan"]
          
        };

        // Ajouter les nouvelles options
        if (states[city]) {
            states[city].forEach(function(state) {
                var option = document.createElement("option");
                option.value = state;
                option.text = state;
                stateSelect.appendChild(option);
            });
        }
    }
</script>
</body>

</html>
