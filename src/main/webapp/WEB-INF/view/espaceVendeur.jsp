<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
   
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Tailwind Profile Card Template : Tailwind Toolbox</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <title>Espace Vendeur</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/0faddc1af8.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css"/> 
    <style>
        :root {
            --primary-color: #FF8C00; /* Orange */
            --secondary-color: #000000; /* Noir */
            --text-color: #000000; /* Noir pour le texte */
        }

        body {
            background-color: #ece3d9; /* Couleur de fond générale */
        }

        .card {
            border: 1px solid var(--primary-color);
            border-radius: 5px;
        }

        .card-header {
            background-color: var(--primary-color);
            color: var(--text-color);
            text-align: center;
        }

        .sidebar {
            min-width: 320px;
            max-width: 320px;
            background-color: #000000;
            color: var(--text-color);
            min-height: 100vh;
            padding-top: 20px;
        }

        .sidebar a {
            color: #ffffff;
            font-size: larger;
            padding-top: 20px;
            display: block;
            font-family: 'Open Sans', Arial, sans-serif; /* Police Open Sans avec fallback sur Arial */
        }

        .sidebar a:hover {
            background-color: #939291;
            color: #000000;
            padding-left: 40px; /* Ajuste la valeur pour déplacer le texte vers la droite */
        }

        .profile-img {
            width: 150px;
            height: 100px;
            border-radius: 10%;
        }
    </style>
     
</head>

<body class="font-sans antialiased text-gray-900 leading-normal tracking-wider bg-cover" style="background-image:url(${pageContext.request.contextPath}/images/polygonal-background_53876-60251.jpg);">

    <%@ include file="headerV.jsp" %> <!-- Inclure l'en-tête du vendeur -->

    <div style="padding-top: 200px;"> <!-- Ajouter un espace en haut pour aligner la mise en page -->
    </div>


    <div class="max-w-4xl flex items-center h-auto lg:h-screen flex-wrap mx-auto my-32 lg:my-0">
        
        <!--Main Col-->
        <div id="profile" class="w-full lg:w-3/5 rounded-lg lg:rounded-l-lg lg:rounded-r-none shadow-2xl bg-white opacity-75 mx-6 lg:mx-0">
            <div class="p-4 md:p-12 text-center lg:text-left">
                <!-- Image for mobile view-->
                <div class="block rounded-full shadow-xl mx-auto -mt-16 h-48 w-48 bg-cover bg-center" style="background-image: url(data:image/jpeg;base64,${base64Image})"></div>

                
                <h1 class="text-3xl font-bold pt-8 lg:pt-0">Bienvenue, ${vendeur.nom} ${vendeur.prenom}!</h1>
                <div class="mx-auto lg:mx-0 w-4/5 pt-3 border-b-2 border-red-500 opacity-25"></div>
                
                <p class="pt-4 text-base font-bold flex items-center justify-center lg:justify-start">
                    <svg class="h-4 fill-current text-red-700 pr-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                        <path d="M9 12H1v6a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-6h-8v2H9v-2zm0-1H0V5c0-1.1.9-2 2-2h4V2a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v1h4a2 2 0 0 1 2 2v6h-9V9H9v2zm3-8V2H8v1h4z"/>
                    </svg>Email:</strong> ${vendeur.email}
                </p>
                
                <p class="pt-2 text-gray-600 text-xs lg:text-sm flex items-center justify-center lg:justify-start">
                    <svg class="h-4 fill-current text-red-700 pr-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                        <path d="M10 20a10 10 0 1 1 0-20 10 10 0 0 1 0 20zm7.75-8a8.01 8.01 0 0 0 0-4h-3.82a28.81 28.81 0 0 1 0 4h3.82zm-.82 2h-3.22a14.44 14.44 0 0 1-.95 3.51A8.03 8.03 0 0 0 16.93 14zm-8.85-2h3.84a24.61 24.61 0 0 0 0-4H8.08a24.61 24.61 0 0 0 0 4zm.25 2c.41 2.4 1.13 4 1.67 4s1.26-1.6 1.67-4H8.33zm-6.08-2h3.82a28.81 28.81 0 0 1 0-4H2.25a8.01 8.01 0 0 0 0 4zm.82 2a8.03 8.03 0 0 0 4.17 3.51c-.42-.96-.74-2.16-.95-3.51H3.07zm13.86-8a8.03 8.03 0 0 0-4.17-3.51c.42.96.74 2.16.95 3.51h3.22zm-8.6 0h3.34c-.41-2.4-1.13-4-1.67-4S8.74 3.6 8.33 6zM3.07 6h3.22c.2-1.35.53-2.55.95-3.51A8.03 8.03 0 0 0 3.07 6z"/>
                    </svg>${vendeur.adresse}, ${vendeur.city}, ${vendeur.state}
                </p>
                
                
                
                <p class="pt-4 text-base font-bold flex items-center justify-center lg:justify-start">
                    <svg class="h-4 fill-current text-red-700 pr-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                        <path d="M2.5 0C1.12 0 0 1.12 0 2.5v15c0 1.38 1.12 2.5 2.5 2.5h15c1.38 0 2.5-1.12 2.5-2.5v-15C20 1.12 18.88 0 17.5 0h-15zM10 17.5c-.41 0-.75-.34-.75-.75V15c0-.41.34-.75.75-.75s.75.34.75.75v1.75c0 .41-.34.75-.75.75zm.75-5h-1.5v-6h1.5v6z"/>
                    </svg>
                    Téléphone:</strong> ${vendeur.telephone}
                </p>
                
                <p class="pt-2 text-gray-600 text-xs lg:text-sm flex items-center justify-center lg:justify-start">
                    <svg class="h-4 fill-current text-red-700 pr-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                        <path d="M10 20a10 10 0 1 1 0-20 10 10 0 0 1 0 20zm2.5-7.5h-5v-5h5v5zm0 2.5h-5v-1.25h5V15z"/>
                    </svg>
                    Catégorie:</strong> ${vendeur.categorie}
                </p>
                
                <div class="pt-12 pb-8">
                    <button class="bg-red-800 hover:bg-green-700 text-white font-bold py-2 px-4 rounded-full">
                       modifier les informations
                    </button>
                </div>
                
                <div class="mt-6 pb-16 lg:pb-0 w-4/5 lg:w-full mx-auto flex flex-wrap items-center justify-between">
                    <a class="link" href="#" data-tippy-content="@facebook_handle">
                        <svg class="h-6 fill-current text-gray-600 hover:text-red-700" role="img" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <title>Facebook</title>
                            <path d="M22.676 0H1.324C.593 0 0 .593 0 1.324v21.352C0 23.408.593 24 1.324 24h11.494v-9.294H9.689v-3.621h3.129V8.41c0-3.099 1.894-4.785 4.659-4.785 1.325 0 2.464.097 2.796.141v3.24h-1.921c-1.5 0-1.792.721-1.792 1.771v2.311h3.584l-.465 3.63H16.56V24h6.115c.733 0 1.325-.592 1.325-1.324V1.324C24 .593 23.408 0 22.676 0"/>
                        </svg>
                    </a>
                    <a class="link" href="#" data-tippy-content="@twitter_handle">
                        <svg class="h-6 fill-current text-gray-600 hover:text-red-700" role="img" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <title>Twitter</title>
                            <path d="M23.954 4.569c-.885.389-1.83.654-2.825.775 1.014-.611 1.794-1.574 2.163-2.723-.951.564-2.005.973-3.127 1.193-.896-.956-2.17-1.557-3.582-1.557-2.71 0-4.9 2.191-4.9 4.897 0 .384.044.76.127 1.12-4.075-.204-7.686-2.158-10.1-5.12-.423.727-.666 1.572-.666 2.478 0 1.707.869 3.216 2.19 4.098-.807-.026-1.566-.247-2.232-.616v.062c0 2.375 1.687 4.355 3.922 4.804-.411.111-.844.171-1.287.171-.314 0-.624-.031-.928-.088.628 1.953 2.445 3.377 4.6 3.415-1.682 1.317-3.803 2.101-6.106 2.101-.396 0-.788-.023-1.176-.068 2.185 1.398 4.779 2.214 7.548 2.214 9.057 0 14-7.51 14-14 0-.213-.004-.426-.013-.637.961-.694 1.797-1.56 2.457-2.549z"/>
                        </svg>
                    </a>
                    <a class="link" href="#" data-tippy-content="@linkedin_handle">
                        <svg class="h-6 fill-current text-gray-600 hover:text-red-700" role="img" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <title>LinkedIn</title>
                            <path d="M22.23 0h-20.46C.74 0 0 .74 0 1.23v21.54C0 23.26.74 24 1.23 24h20.54c.49 0 .73-.74.73-1.23V1.23C23 0 .74.74 0 1.23v21.54c0 .49.24.73.73.73h20.54c.49 0 .73-.24.73-.73V1.23C23 1.74 22.74 1.23 22.23 1.23H1.77C1.26 1.23 1 1.74 1 2.23v20.54c0 .49.24.73.73.73h20.54c.49 0 .73-.24.73-.73V2.23c0-.49-.24-.73-.73-.73zm-6.32 20.64H13.78v-7.67c0-1.83-.03-4.18-2.55-4.18-2.55 0-2.95 1.99-2.95 4.05v7.78h-3.67V12h3.53v1.6h.05c.49-.93 1.69-1.92 3.48-1.92 3.72 0 4.41 2.45 4.41 5.62v6.55zM5.5 8.41c-1.21 0-2.19.99-2.19 2.22 0 1.22.98 2.22 2.19 2.22 1.21 0 2.19-.99 2.19-2.22s-.98-2.22-2.19-2.22zm-1.83 11.03H8.1v-7.67H3.67v7.67zm19.9-11.42v-.06c-.05-.66-.27-1.24-.62-1.76-.65-.79-1.5-1.24-2.48-1.24-1.51 0-2.86.99-3.2 2.43-.07.28-.11.58-.11.88v.06c0 .66.26 1.24.69 1.7.64.72 1.5 1.1 2.47 1.1 1.51 0 2.86-.99 3.2-2.43.05-.27.08-.56.08-.85z"/>
                        </svg>
                    </a>
                </div>
            </div>
        </div>
    </div>
    
    
        <script src="https://unpkg.com/popper.js@1/dist/umd/popper.min.js"></script>
        <script src="https://unpkg.com/tippy.js@4"></script>
        <script>
            //Init tooltips
            tippy('.link',{
              placement: 'bottom'
            })
    
            //Toggle mode
            const toggle = document.querySelector('.js-change-theme');
            const body = document.querySelector('body');
            const profile = document.getElementById('profile');
            
            
            toggle.addEventListener('click', () => {
    
              if (body.classList.contains('text-gray-900')) {
                toggle.innerHTML = "☀️";
                body.classList.remove('text-gray-900');
                body.classList.add('text-gray-100');
                profile.classList.remove('bg-white');
                profile.classList.add('bg-gray-900');
              } else
              {
                toggle.innerHTML = "🌙";
                body.classList.remove('text-gray-100');
                body.classList.add('text-gray-900');
                profile.classList.remove('bg-gray-900');			
                profile.classList.add('bg-white');
                
              }
            });
            
        </script>
        
    
    
    

   
    
</body>
</html>
