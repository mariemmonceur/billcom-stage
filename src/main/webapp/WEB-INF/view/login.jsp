<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.0/css/all.min.css">
    <style>
        
        body {
            background-image: url("${pageContext.request.contextPath}/images/polygonal-background_53876-60251.jpg");
            background-color: #cccccc;
            background-size: cover;
        }

        .hero.is-fullheight {
            align-items: center;
            justify-content: center;
        }

        .box {
            border-radius: 10px;
            padding: 2rem;
        }

        .button.is-custom {
            background-color: #FF8C00;
            color: #000000;
            border: 2px solid #000000;
            transition: background-color 0.3s, color 0.3s;
        }

        .button.is-custom:hover {
            background-color: #000000;
            color: #FF8C00;
            border-color: #FF8C00;
        }

        html, body {
            font-family: 'Quicksand', serif;
            font-size: 16px;
            font-weight: 300;
        }

        .hero.is-success {
            background: #f2f6fa;
        }

        input {
            font-weight: 300;
            font-size: 1.2rem;
        }

        p {
            font-weight: 700;
        }

        p.subtitle {
            padding-top: 1rem;
        }

        a {
            color: #fff;
        }

        a:hover {
            color: #bababa;
        }

        .footer-text {
            font-weight: initial;
        }
    </style>
</head>

<body>
    <%@ include file="navbar.jsp" %>

    <section class="hero is-fullheight">
        <div class="hero-body">
            <div class="container has-text-centered">
                <div class="column is-50 is-offset-1"> <!-- Colonne très large et centrée -->


                    <div class="box">
                        <p class="subtitle is-4">Veuillez vous connecter pour continuer.</p>
                        <form method="post" action="/ressource/login">
                            <div class="field">
                                <p class="control has-icons-left">
                                    <input class="input is-medium" type="email" id="exampleInputEmail1" name="email" placeholder="Email">
                                    <span class="icon is-small is-left">
                                        <i class="fas fa-envelope"></i>
                                    </span>
                                </p>
                            </div>
                            <div class="field">
                                <p class="control has-icons-left">
                                    <input class="input is-medium" type="password" id="exampleInputPassword1" name="mdp" placeholder="Mot de passe">
                                    <span class="icon is-small is-left">
                                        <i class="fas fa-lock"></i>
                                    </span>
                                </p>
                            </div>
                            <div class="field">
                                <label class="checkbox">
                                    <input type="checkbox" id="showPasswordCheck"> Afficher le mot de passe
                                </label>
                            </div>
                            <button class="button is-custom is-large is-fullwidth">Se connecter</button>
                        </form>

                        <c:if test="${not empty error}">
                            <div class="notification is-danger mt-3">
                                ${error}
                            </div>
                        </c:if>
                    
                </div>
            </div>
        </div>
    </section>

    <script>
        document.getElementById('showPasswordCheck').addEventListener('change', function () {
            var passwordField = document.getElementById('exampleInputPassword1');
            if (this.checked) {
                passwordField.type = 'text';
            } else {
                passwordField.type = 'password';
            }
        });
    </script>
</body>

</html>
