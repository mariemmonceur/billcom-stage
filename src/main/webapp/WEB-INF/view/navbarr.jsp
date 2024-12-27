<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bootstrap 5 Navbar</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
        }

        img {
            max-width: 150px;
            width: 100%;
        }

        .nav-link {
            font-weight: 600;
            color: #FF8C00;
            font-size: large;
        }

        .nav-link:hover {
            font-weight: 600;
            color: #ffefdc;
            font-size: larger;
        }

        .nav-link.disabled, .dropdown-item.disabled {
            pointer-events: none;
            opacity: 0.5;
            color: rgb(169, 170, 171);
        }

        .navbar-toggler:focus {
            box-shadow: none;
        }

        .dropdown>.dropdown-menu {
            background-color: #000000;
            border: none;
            border-radius: 0;
        }

        .lni-grid-alt {
            font-size: 1.5rem;
        }

        .lni-cross-circle {
            font-size: 2rem;
        }

        #welcome {
            background-color: #eaeae9;
            color: #5172ce;
        }

        @media (min-width: 992px) {
            .dropdown>.dropdown-menu {
                visibility: hidden;
                opacity: 0;
                top: 100%;
                display: block;
                transition: all 0.1s ease-out;
            }

            .dropdown:hover>.dropdown-menu {
                padding: 20px 0;
                display: block;
                visibility: visible;
                opacity: 1;
                transition: all 0.3s ease-in-out;
            }

            .dropdown-item:hover {
                color: #000000;
                background-color: #FF8C00;
            }

            .dropdown-item {
                background-color: #000000;
                color: #FF8C00;
                font-size: large;
            }

            .nav-item.active .nav-link {
                color: #ffefdc;
            }
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-expand-lg py-4 py-lg-0 shadow" style="background-color: #000000;">
        <div class="container px-4">
            <a class="navbar-brand d-flex align-items-center" href="#">
                <img src="${pageContext.request.contextPath}/images/communication_tower.png" alt="Centre de Ressources Telecom" width="70" height="70" class="me-3">
                <span style="font-size: 24px; color: #FF8C00; line-height: 1.2;">Centre de Ressources Telecom</span>
            </a>
            <button class="navbar-toggler border-0" style="color: #FF8C00;" type="button" data-bs-toggle="offcanvas" data-bs-target="#top-navbar" aria-controls="top-navbar" aria-label="Toggle navigation">
                <i class="lni lni-grid-alt"></i>
            </button>
            <div class="offcanvas offcanvas-end" tabindex="-1" id="top-navbar" aria-labelledby="top-navbarLabel">
                <button class="navbar-toggler border-0" type="button" data-bs-toggle="offcanvas" data-bs-target="#top-navbar" aria-controls="top-navbar" aria-label="Close navigation">
                    <div class="d-flex justify-content-between p-3">
                        <a class="navbar-brand d-flex align-items-center" href="#">
                            <img src="${pageContext.request.contextPath}/images/communication_tower.png" alt="Centre de Ressources Telecom" width="90" height="70" class="me-3">
                            <span style="font-size: 24px; color: #FF8C00; line-height: 1.2;">Centre de Ressources Telecom</span>
                        </a>
                        <i class="lni lni-cross-circle"></i>
                    </div>
                </button>
                <ul class="navbar-nav ms-lg-auto p-4 p-lg-0">
                    <li class="nav-item px-3 px-lg-0 py-1 py-lg-4">
                        <a class="nav-link" href="admin_home">Acceuil</a>
                    </li>
                    <li class="nav-item px-3 px-lg-0 py-1 py-lg-4 dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Ressources
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="showCreate">Ajouter</a></li>
                            <li><a class="dropdown-item" href="listeRessource">Liste</a></li>
                            <li><a class="dropdown-item" href="reservation_admin">reservations</a></li>
                            <li><a class="dropdown-item" href="#">Statistiques</a></li>
                        </ul>
                    </li>

                    <li class="nav-item px-3 px-lg-0 py-1 py-lg-4 dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            vendeurs
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="register">Ajouter</a></li>
                            <li><a class="dropdown-item" href="listeVendeurs">Liste</a></li>
                            <li><a class="dropdown-item" href="#">Statistiques</a></li>
                        </ul>
                    </li>

                    <li class="nav-item px-3 px-lg-0 py-1 py-lg-4">
                        <a class="nav-link" href="/ressource/admin_logout">Déconnexion <i class="lni lni-exit"></i></a>
                    </li>
                    
                    
                   
                   
                    <button id="cancel-button" style= " margin: 25px; width: 40px; height: 40px;" class="btn btn-outline-secondary btn-sm" type="button">
                        <i class="lni lni-spinner-arrow"></i>
                    </button>
                 
                                    </ul>
               
            </div>
        </div>
    </nav>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const navLinks = document.querySelectorAll('.nav-link');
            const dropdownItems = document.querySelectorAll('.dropdown-item');
            const cancelButton = document.getElementById('cancel-button');

            // Load state from local storage
            const disabledNavLinks = JSON.parse(localStorage.getItem('disabledNavLinks') || '[]');
            const disabledDropdownItems = JSON.parse(localStorage.getItem('disabledDropdownItems') || '[]');

            disabledNavLinks.forEach(index => {
                navLinks[index].classList.add('disabled');
            });

            disabledDropdownItems.forEach(index => {
                dropdownItems[index].classList.add('disabled');
            });

            navLinks.forEach((link, index) => {
                link.addEventListener('click', function (event) {
                    const newDisabledNavLinks = Array.from(navLinks).map((l, i) => {
                        if (l !== event.target) {
                            l.classList.add('disabled');
                            return i;
                        }
                        return null;
                    }).filter(i => i !== null);

                    localStorage.setItem('disabledNavLinks', JSON.stringify(newDisabledNavLinks));
                });
            });

            dropdownItems.forEach((item, index) => {
                item.addEventListener('click', function (event) {
                    const newDisabledDropdownItems = Array.from(dropdownItems).map((d, i) => {
                        if (d !== event.target) {
                            d.classList.add('disabled');
                            return i;
                        }
                        return null;
                    }).filter(i => i !== null);

                    localStorage.setItem('disabledDropdownItems', JSON.stringify(newDisabledDropdownItems));
                });
            });

            cancelButton.addEventListener('click', function () {
                navLinks.forEach(link => link.classList.remove('disabled'));
                dropdownItems.forEach(item => item.classList.remove('disabled'));

                localStorage.removeItem('disabledNavLinks');
                localStorage.removeItem('disabledDropdownItems');
            });
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>

</html>