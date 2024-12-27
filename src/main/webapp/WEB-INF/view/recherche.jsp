<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>

<%@ page import="com.tel.res.entities.Ressource" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recherche de Ressources Télécom</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/0faddc1af8.js" crossorigin="anonymous"></script>
    <style>
        /* Styles personnalisés pour l'espace vendeur */
        :root {
            --primary-color: #FF8C00; /* Orange */
            --secondary-color: #000000; /* Noir */
            --text-color: #ffffff; /* Blanc pour le texte */
        }
        
        body {
            background-color: #ece3d9; /* Couleur de fond générale */
        }
        
        .card {
            border: 1px solid var(--primary-color);
            border-radius: 10px;
        }

        .card-header {
            background-color: var(--primary-color);
            color: black;
            font-family: Arial, Helvetica, sans-serif;
            text-align: center;
        }
       
        /* Hide the radio button */
        input[type="radio"] {
            visibility: hidden;
            position: absolute; /* Keep the input accessible for screen readers */
        }

        /* Style pour le texte "Recherche par" */
.search-label {
    font-size: 1.4rem; /* Augmente la taille du texte */
  /* Rend le texte en gras */
    margin-right: 0px; /* Espace entre le texte et les boutons */
}

/* Style pour les boutons radio */
.btn-outline-custom {
    border: 2px  black; /* Définir la couleur de la bordure */
    background-color: rgb(255, 255, 255); /* Couleur de fond blanche */
    /*padding: 10px 20px; /* Augmenter la taille des boutons */
    border-radius: 0px; /* Angles de bordure carrés */
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s;

    font-weight: normal; /* Assurez-vous que le texte n'est pas en gras */
     font-size:25px ;

}

/* Style du label lorsqu'il est sélectionné */
input[type="radio"]:checked + .btn-outline-custom {
    background-color: black; /* Arrière-plan noir lorsqu'il est sélectionné */
    color: white; /* Texte blanc lorsqu'il est sélectionné */
    font-weight: normal;
    border-color: #000000
}

/* Style du label lorsqu'il est survolé */
.btn-outline-custom:hover {
    background-color: black; /* Arrière-plan noir lorsqu'il est survolé */
    color: white; /* Texte blanc lorsqu'il est survolé */
}

       /* Style the label to look like a clickable option */
        .search-option label {
            cursor: pointer;
          padding: 5px 10px;
          
            border-radius: 0px;
            border: 1px solid black;
            color: var(--secondary-color);
            display: inline-block;
           /* margin-right: 10px; /* Space between radio buttons */
        }
/* Ensure icons are styled correctly */
.icon {
    color: black; /* Default color for icons */
}

/* Change icon color to red when the radio button is checked */
input[type="radio"]:checked + label .icon {
    color: rgb(255, 4, 50); /* Change icon color to red when active */
}

/* Style for label when radio is checked */
input[type="radio"]:checked + label {
    background-color: black;
    color: white;
    font-weight: bold;
}


        /* Style the label when hovered or clicked */
        .search-option label:hover {
            background-color: black;
            color: white;
        }

        .sidebar {
            min-width: 320px;
            max-width:320px;
            background-color: #000000;
            color: var(--text-color);
            min-height: 100vh;
            padding-top: 10px;
        }

        .sidebar a {
            color: #ffffff;
            font-size: larger;
            padding-top: 20px;
            display: block;
            font-family: 'Open Sans', Arial, sans-serif; /* Example using Open Sans with Arial fallback */
        }


        .sidebar a:hover {
            background-color: #939291;
            color: #000000;
            padding-left: 40px; /* Adjust the value to move the text to the right */
        }

        .search-input {
            margin-bottom: 20px;
            margin-top: 20px;
            background-color: #e7e7e7 ;
            padding: 20px ;
           
        }

        .results-table {
            margin-top: 20px;
        }
       
        


      
    </style>
    <script>
        function toggleSearchOptions() {
            const searchType = document.querySelector('input[name="search-type"]:checked').value;
            const numberInput = document.getElementById('number-input');
            const rangeInputs = document.getElementById('range-inputs');

            if (searchType === 'number') {
                numberInput.style.display = 'block';
                rangeInputs.style.display = 'none';
            } else if (searchType === 'range') {
                numberInput.style.display = 'none';
                rangeInputs.style.display = 'block';
            }
        }
    </script>
</head>
<body>
  
    <%@ include file="headerV.jsp" %>
    <div style="padding-top: 200px;"> <!-- Ajouter un espace en haut pour aligner la mise en page -->
    </div>
    <div class="container-fluid">
        <div class="row flex-nowrap">
           
            <div class="col">
                <div class="card mt-4">
                    <h2 class="card-header">Recherche de Ressources Télécom</h2>

                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/search" method="GET">
                            
                            <div class="search-option">
                                <span class="search-label">Recherche par : </span>
                                <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                                    <input type="radio" class="btn-check" name="search-type" id="search-by-number" value="number" checked onclick="toggleSearchOptions()">
                                    <label class="btn btn-outline-custom" for="search-by-number"> <i  class="lni lni-phone icon"  id="icon-number"></i>  numéro unique</label>
                                    
                                    <input type="radio" class="btn-check" name="search-type" id="search-by-range" value="range" onclick="toggleSearchOptions()">
                                    <label class="btn btn-outline-custom" for="search-by-range"> <i class="lni lni-inbox icon"  id="icon-range"></i> plage de numéros</label>
                                </div>
                            </div>
                            
                        
                            <div id="number-input"   class="search-input">
                                <label for="number">Numéro de ressource :</label>
                                <input type="text" id="number" name="number" class="form-control" placeholder="Entrez un numéro">
                            </div>
                        
                            <div id="range-inputs" class="search-input range-inputs" style="display: none;">
                                <label for="start-range">De :</label>
                                <input type="text" id="start-range" name="start-range" class="form-control" placeholder="Numéro de début">
                                <br>
                                <label for="end-range">À :</label>
                                <input type="text" id="end-range" name="end-range" class="form-control" placeholder="Numéro de fin">
                            </div>
                        
                            <button type="submit" class="btn btn-outline-dark">Rechercher</button>
                        </form>
                        
                        <!-- Display search results -->
                        <div class="results-table">
                            <% 
                                List<Ressource> results = (List<Ressource>) request.getAttribute("results");
                                if (results != null && !results.isEmpty()) { 
                            %>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            
                                            <th>SIM</th>
                                            <th>Numéro MSISDN</th>
                                            <th>Action</th>
                                            <th>Annulation</th> <!-- New column for cancellation -->
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% 
                                        Map<Long, Boolean> reservedResources = (Map<Long, Boolean>) request.getAttribute("reservedResources");
                                        if (reservedResources == null) {
                                            reservedResources = new HashMap<>(); // Initialiser si null
                                        }
                                        for (Ressource r : results) { 
                                    %>
                                        <tr>
                                            <td><%= r.getId() %></td>
                                            <td><%= r.getMsisdn() %></td>
                                            <td><%= r.getSim() %></td>
                                            <td>
                                                <% boolean isReserved = reservedResources.getOrDefault(r.getId(), false); %>
                                                <% if (isReserved) { %>
                                                    <span>Vous avez déjà fait une réservation de cette ressource.</span>
                                                    <button class="btn btn-secondary" disabled>Réserver</button>
                                                <% } else { %>
                                                    <form action="${pageContext.request.contextPath}/reservations/reserve" method="POST" class="reserve-form">
                                                        <input type="hidden" name="vendeurId" value="${vendeurId}" />
                                                        <input type="hidden" name="ressourceId" value="<%= r.getId() %>" />
                                                        <button type="submit" class="btn btn-success">Réserver</button>
                                                    </form>
                                                <% } %>
                                            </td>
                                            <td>
                                                <% if (isReserved) { %>
                                                    <form action="${pageContext.request.contextPath}/cancel" method="post" class="cancel-form">
                                                        <input type="hidden" name="reservationId" value="<%= r.getId() %>">
                                                        <button type="submit" class="btn btn-danger">Annuler la réservation</button>
                                                    </form>
                                                    
                                                <% } %>
                                            </td>
                                            
                                            
                                        </tr>
                                    <% } %>
                                    </tbody>
                                </table>
                            <% } else { %>
                                <p>Aucun résultat trouvé.</p>
                            <% } %>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
 

// Appel des fonctions lors du chargement de la page
document.addEventListener('DOMContentLoaded', function () {
    restoreSidebarSelection();
    document.querySelectorAll('.sidebar a').forEach(item => {
        item.addEventListener('click', function () {
            saveSidebarSelection();
        });
    });
});

    document.addEventListener('DOMContentLoaded', function () {
        const forms = document.querySelectorAll('.reserve-form');

        forms.forEach(form => {
            form.addEventListener('submit', function (event) {
                event.preventDefault(); // Empêche le formulaire de se soumettre normalement
                
                const formData = new FormData(this);

                fetch(this.action, {
                    method: 'POST',
                    body: formData
                })
                .then(response => response.json())
                .then(data => {
                    alert(data.message);
                    if (data.message === "Réservation effectuée avec succès.") {
                        // Rafraîchir la page en cas de succès
                        window.location.reload();
                    }
                })
                .catch(error => {
                    console.error('Erreur:', error);
                    alert('Une erreur est survenue.');
                });
            });
        });
    });
</script>
</html>
