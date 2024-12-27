<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Créer une ressource</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <style>
        /* Couleurs principales */
        :root {
            --primary-color: #FF8C00; /* Orange */
            --secondary-color: #000000; /* Noir */
            --text-color: #ffffff; /* Blanc pour le texte */
            font-family: Arial, Helvetica, sans-serif;
     
        }
        
        body {
            background-color: #eee7e3; /* Couleur de fond générale */
        }
         .btn-custom {
            background-color: #FF8C00; /* Couleur de fond par défaut (orange) */
            color: #000000; /* Couleur du texte par défaut (noir) */
            font-size: 18px;
            font-family: Arial, Helvetica, sans-serif;
            border: 2px solid #000000; /* Bordure noire par défaut */
            transition: background-color 0.3s, color 0.3s; /* Transition fluide pour les changements de couleur */
        }

        .btn-custom:hover {
            background-color: #000000; /* Couleur de fond au survol (noir) */
            color: #FF8C00; /* Couleur du texte au survol (orange) */
            border: 2px solid #FF8C00; /* Bordure orange au survol */
        }
        
        .card {
            border: 1px solid var(--primary-color);
            border-radius: 5px;
            border-color: #000000;
        }

        .card-header {
            background-color: var(--primary-color);
            color: var(--text-color);
            font-family: Arial, Helvetica, sans-serif;
            font-size: 24px;
            text-align: center;
        }

        .btn-outline-dark {
            border-color: var(--secondary-color);
            color: var(--secondary-color);
        }

        .btn-outline-dark:hover {
            background-color: var(--secondary-color);
            color: var(--text-color);
        }

        .modal-content {
            border: 1px solid var(--primary-color);
        }

        .modal-header {
            background-color: var(--primary-color);
            color: var(--text-color);
        }

        .modal-footer .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .toast-container {
            position: absolute;
            top: 20px;
            right: 20px;
        }

        .toast-header {
            background-color: var(--primary-color);
            color: var(--text-color);
        }

        .toast-body {
            background-color: var(--secondary-color);
            color: var(--text-color);
        }

        .form-check-input:checked ~ .form-check-label {
            color: var(--primary-color);
        }

        .category-container {
            border: 2px solid var(--primary-color);
            border-radius: 5px;
            padding: 15px;
            background-color: #ffffff; /* Couleur de fond du conteneur */
        }

        .form-check-label {
            font-size: 16px;
        }

        .form-check-input {
            margin-right: 10px;
        }

        .form-check-input:focus {
            box-shadow: 0 0 0 0.2rem rgba(255, 102, 0, 0.25);
        }

        .hidden {
            display: none;
        }
        .form-check-inline {
    margin-right: 20px; /* Ajustez l'espacement selon vos préférences */
}

.form-check-input {
    margin-right: 5px; /* Ajustez l'espacement entre le bouton et le label */
}

    </style>
</head>
<body style="background-color: #ece3d9;">


<%@ include file="navbarr.jsp" %>

<div class="container mt-4">
    <div class="card" style="border-color: #ff6600;">
        <div class="card-header "  style="color: #FF8C00; background-color: #000000;">Ajouter une ressource</div>
        <div class="card-body" >
            <form id="modeSelectionForm" class="mb-3">
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="addMode" id="addManually" value="manual" checked onclick="toggleForms()">
                    <label class="form-check-label" for="addManually">Ajouter manuellement</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="addMode" id="addViaFile" value="file" onclick="toggleForms()">
                    <label class="form-check-label" for="addViaFile">Ajouter via fichier Excel</label>
                </div>
            </form>
            

            <form id="resourceForm" action="saveRessource" method="post" class="mt-3">
                <div class="form-group">
                    <label for="sim">MSISDN :</label>
                    <input type="text" id="sim" name="sim" class="form-control">
                    <label for="range">Nombre de ressources :</label>
                    <input type="number" id="range" name="range" class="form-control">
                </div>
                <input type="hidden" id="resources" name="resources">
                <button type="button" class="btn-custom" onclick="confirmAddResource()">Ajouter</button>
            </form>

            <form id="uploadForm" action="uploadRessourceFile" method="post" enctype="multipart/form-data" class="mt-3 hidden">
                <div class="form-group">
                    <label for="resourceFile">apporter fichier Excel :</label>
                    <input type="file" id="resourceFile" name="resourceFile" class="form-control-file">
                </div>
                <button type="submit" class="btn-custom"> Ajouter</button>
            </form>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="confirmationModal" tabindex="-1" role="dialog" aria-labelledby="confirmationModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="confirmationModalLabel">Confirmation d'ajout de ressource</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p id="modalBodyText"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn-custom" data-dismiss="modal">Annuler</button>
                <button type="button" class="btn-custom" onclick="submitForm()">Confirmer</button>
            </div>
        </div>
    </div>
</div>

<!-- Toast Notification -->
<div class="toast-container">
    <div id="successToast" class="toast fade" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-header">
            <strong class="mr-auto">Notification</strong>
            <small>Juste maintenant</small>
            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="toast-body">
            ${msg}
        </div>
    </div>
</div>

<script>
    function generateMSISDNs(baseSim, n) {
        var resources = [];
        var baseSimNumber = parseInt(baseSim, 10);

        for (var i = 0; i < n; i++) {
            var sim = (baseSimNumber + i).toString();
            var msisdn = "898821" + Math.random().toString().substr(2, 15);
            resources.push({ sim: sim, msisdn: msisdn });
        }
        return resources;
    }

    function confirmAddResource() {
        var baseSim = document.getElementById("sim").value;
        var range = parseInt(document.getElementById("range").value);
        var resources = generateMSISDNs(baseSim, range);
        var confirmationMessage = "Ressources générées:\n" + resources.map(r => "MSISDN: " + r.sim + ", SIM: " + r.msisdn).join("\n") + "\nConfirmer l'ajout de ces ressources ?";

        document.getElementById("modalBodyText").innerText = confirmationMessage;

        $('#confirmationModal').modal('show');
    }

    function submitForm() {
        var baseSim = document.getElementById("sim").value;
        var range = parseInt(document.getElementById("range").value);
        var resources = generateMSISDNs(baseSim, range);
        document.getElementById("resources").value = JSON.stringify(resources);
        document.getElementById("resourceForm").submit();
    }

    function toggleForms() {
        var manualForm = document.getElementById('resourceForm');
        var fileForm = document.getElementById('uploadForm');
        var isManual = document.getElementById('addManually').checked;

        if (isManual) {
            manualForm.classList.remove('hidden');
            fileForm.classList.add('hidden');
        } else {
            manualForm.classList.add('hidden');
            fileForm.classList.remove('hidden');
        }
    }

    $(document).ready(function() {
        var msg = '${msg}';
        if (msg) {
            $('#successToast').toast({ delay: 3000 });
            $('#successToast').toast('show');
        }
    });
</script>

</body>
</html>
