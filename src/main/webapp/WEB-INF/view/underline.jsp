<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1AnmH/Dd8u5t8deCv59D2u1CAsUzfuHtvk9X9kxK8P58C3pMz3a" crossorigin="anonymous">
    <style>
        .nav-custom {
            height: 50px; 
            background-color: black;
        }
        .nav-link-custom {
            color: #FF8C00; /* Orange */
        }
        .nav-link-custom:hover {
            color: rgb(251, 92, 0); /* Change to white on hover and when active */
            font-size: 18px;
           


        }
        .nav-link-custom.active {
            color: white; /* Change to white on hover and when active */
            font-size: 18px;
            font-weight: bold;
           


        }
        .nav-item-center {
            text-align: center;
        }
    </style>
    <title>Navigation Bar</title>
</head>
<body>
    <div class="nav-custom">
        <ul class="nav nav-underline">
            <li class="nav-item nav-item-center">
                <a class="nav-link nav-link-custom" href="login_admin" id="admin-link">Espace Admin</a>
            </li>
            <li class="nav-item">
                <a class="nav-link nav-link-custom" href="login" id="vendeur-link">Espace Vendeur</a>
            </li>
        </ul>
    </div>

    <!-- Page Content Goes Here -->

    <script>
        // Get the current page's URL path
        const currentPath = window.location.pathname;

        // Select all nav links
        const navLinks = document.querySelectorAll('.nav-link-custom');

        // Loop through each link
        navLinks.forEach(link => {
            // Get the href attribute value (which is the link target)
            const linkPath = new URL(link.href).pathname;

            // Compare the current URL path with the link's path
            if (currentPath === linkPath) {
                // Add the 'active' class to the matching link
                link.classList.add('active');
            }
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>
