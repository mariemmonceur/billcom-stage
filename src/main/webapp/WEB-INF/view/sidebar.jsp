

<!-- sidebar.jsp -->
<link rel="stylesheet" href="https://cdn.lineicons.com/3.0/lineicons.css">

<!-- sidebar.jsp -->
<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap');
</style>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const currentPath = window.location.pathname;
        console.log('Current Path:', currentPath); // Debugging line
        const navLinks = document.querySelectorAll(".nav-link");

        navLinks.forEach(link => {
            const href = link.getAttribute("href");
            console.log('Link Href:', href); // Debugging line
            if (currentPath.startsWith(href)) {
                link.classList.add("active");
                console.log('Active Link:', href); // Debugging line
            }
        });
    });
</script>


<div class="sidebar">
    <ul class="nav flex-column">
        <li class="nav-item">
            <a class="nav-link" href="/ressource/profil">
                <img src="data:image/jpeg;base64,${base64Image}" alt="Photo de profil" class="profiles-img"> 
                Profil
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/ressource/recherche">
                <i class="lni lni-search-alt"></i> <!-- Icône de recherche -->
                Recherche
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/ressource/consultation">
                <i class="lni lni-eye"></i>Consultation des reservations
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/ressource/list"> boutiques</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/dashboard">Assistance et Support</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/ressource/logout">Déconnexion</a>
        </li>
    </ul>
</div>

<style>
    .nav-link.active {
    background-color: #FF8C00; /* Highlight color */
    color: #000000;
    font-weight: bold;
}

    .profiles-img {
        width: 30px; /* Ajustez la largeur selon vos besoins */
        height: 30px; /* Ajustez la hauteur selon vos besoins */
        border-radius: 50%; /* Arrondir l'image */
        margin-right: 10px; /* Espace entre l'image et le texte */
        vertical-align: middle; /* Aligner verticalement l'image au milieu du texte */
    }
    .nav-link i {
        margin-right: 8px; /* Espace entre l'icône et le texte */
        font-size: 16px; /* Taille de l'icône */
        vertical-align: middle; /* Aligner verticalement l'icône au milieu du texte */
    }
</style>
