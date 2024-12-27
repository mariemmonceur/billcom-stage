<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.tel.res.entities.Boutique" %>
<%@ page import="com.tel.res.entities.Ressource" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Vos Boutiques</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
body{
    font-family: Poppins;
    margin: 0;
    background-color: #010101;
    color: #000000;
}
svg{
    width: 25px;
}


/* css slider */
.slider{
    height: 100vh;
    margin-top: -50px;
    position: relative;
}
.slider .list .item{
    position: absolute;
    inset: 0 0 0 0;
    overflow: hidden;
    opacity: 0;
    transition: .5s;
}
.slider .list .item img{
    width: 100%;
    height: 100%;
    object-fit: cover;
}
.slider .list .item::after{
    content: '';
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    bottom: 0;
    background-image: linear-gradient(
        to top, #000 40%, transparent
    );
}
.slider .list .item .content{
    position: absolute;
    left: 10%;
    top: 20%;
    width: 500px;
    max-width: 80%;
    z-index: 1;
}
.slider .list .item .content p:nth-child(1){
    text-transform: uppercase;
    letter-spacing: 10px;
}
.slider .list .item .content h2{
    font-size: 100px;
    margin: 0;
}
.slider .list .item.active{
    opacity: 1;
    z-index: 10;
}
@keyframes showContent {
    to{
        transform: translateY(0);
        filter: blur(0);
        opacity: 1;
    }
}
.slider .list .item.active p:nth-child(1),
.slider .list .item.active h2,
.slider .list .item.active p:nth-child(3){
    transform: translateY(30px);
    filter: blur(20px);
    opacity: 0;
    animation: showContent .5s .7s ease-in-out 1 forwards;
}
.slider .list .item.active h2{
    animation-delay: 1s;
}
.slider .list .item.active p:nth-child(3){
    animation-duration: 1.3s;
}
.arrows{
    position: absolute;
    top: 30%;
    right: 50px;
    z-index: 100;
}
.arrows button{
    background-color: #eee5;
    border: none;
    font-family: monospace;
    width: 40px;
    height: 40px;
    border-radius: 5px;
    font-size: x-large;
    color: #eee;
    transition: .5s;
}
.arrows button:hover{
    background-color: #eee;
    color: black;
}
.thumbnail{
    position: absolute;
    bottom: 50px;
    z-index: 11;
    display: flex;
    gap: 10px;
    width: 100%;
    height: 250px;
    padding: 0 50px;
    box-sizing: border-box;
    overflow: auto;
    justify-content: center;
}
.thumbnail::-webkit-scrollbar{
    width: 0;
}
.thumbnail .item{
    width: 150px;
    height: 220px;
    filter: brightness(.5);
    transition: .5s;
    flex-shrink: 0;
}
.thumbnail .item img{
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 10px;
}
.thumbnail .item.active{
    filter: brightness(1.5);
}
.thumbnail .item .content{
    position: absolute;
    inset: auto 10px 10px 10px;
}
@media screen and (max-width: 678px) {
    .thumbnail{
        justify-content: start;
    }
    .slider .list .item .content h2{
        font-size: 60px;
    }
    .arrows{
        top: 10%;
    }
}

.slider {
    height: 80vh; /* Ajustez la hauteur en fonction de vos besoins */
    margin-top: 0; /* Supprimez la marge négative */
}


            .card {
                border: 1px solid #FF8C00;
                border-radius: 10px;
            }
            .card-header {
                background-color: #FF8C00;
                color: black;
                text-align: center;
            }
            .sidebar {
                min-width: 300px;
                max-width: 300px;
                background-color: #000000;
                color: #ffffff;
                min-height: 100vh;
                padding-top: 20px;
            }
            .sidebar a {
                color: #ffffff;
                font-size: larger;
                padding: 10px 20px;
                display: block;
                text-decoration: none;
                transition: background-color 0.3s, padding-left 0.3s;
            }
            .sidebar a:hover {
                background-color: #939291;
                color: #000000;
                padding-left: 30px;
            }
            .profile-img {
                border-radius: 50%;
                width: 150px;
                margin: 20px auto;
                display: block;
            }
            .container {
                margin-top: 20px;
            }
            .btn-primary {
                margin-bottom: 20px;
                background-color: #FF8C00;
                border-color: #FF8C00;
            }
            .btn-primary:hover {
                background-color: #e77a00;
                border-color: #e77a00;
            }
            .card-body h3 {
                color: #000;
                font-weight: bold;
            }
            .card-body ul {
                padding-left: 0;
                list-style-type: none;
            }
            .card-body li {
                padding: 5px 0;
            }
            /* Custom styles for the modal */
            .modal-dialog {
                max-width: 90%; /* Make the modal larger */
                margin: 1.75rem auto; /* Center it vertically */
            }
            .modal-content {
                border-radius: 10px;
            }
        </style>
    </head>
    <header>
        <%@ include file="headerV.jsp" %>
    </header>
    <body>
       
        
    
    <div style="padding-top: 200px;"> <!-- Ajouter un espace en haut pour aligner la mise en page -->
   <!-- slider -->

   <div class="slider">
    <!-- list Items -->
    <div class="list">
        <div class="item active">
            <img src="image/img1.png">
            <div class="content">
                <p>design</p>
                <h2>Slider 01</h2>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Labore, neque?
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum, ex.
                </p>
            </div>
        </div>
        <div class="item">
            <img src="image/img2.jpg">
            <div class="content">
                <p>design</p>
                <h2>Slider 02</h2>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Labore, neque?
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum, ex.
                </p>
            </div>
        </div>
        <div class="item">
            <img src="image/img3.jpg">
            <div class="content">
                <p>design</p>
                <h2>Slider 03</h2>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Labore, neque?
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum, ex.
                </p>
            </div>
        </div>
        <div class="item">
            <img src="image/img4.jpg">
            <div class="content">
                <p>design</p>
                <h2>Slider 04</h2>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Labore, neque?
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum, ex.
                </p>
            </div>
        </div>
        <div class="item">
            <img src="image/img5.jpg">
            <div class="content">
                <p>design</p>
                <h2>Slider 05</h2>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Labore, neque?
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum, ex.
                </p>
            </div>
        </div>
    </div>
    <!-- button arrows -->
    <div class="arrows">
        <button id="prev"><</button>
        <button id="next">></button>
    </div>
    <!-- thumbnail -->
    <div class="thumbnail">
        <div class="item active">
            <img src="image/img1.png">
            <div class="content">
                Name Slider
            </div>
        </div>
        <div class="item">
            <img src="image/img2.jpg">
            <div class="content">
                Name Slider
            </div>
        </div>
        <div class="item">
            <img src="image/img3.jpg">
            <div class="content">
                Name Slider
            </div>
        </div>
        <div class="item">
            <img src="image/img4.jpg">
            <div class="content">
                Name Slider
            </div>
        </div>
        <div class="item">
            <img src="image/img5.jpg">
            <div class="content">
                Name Slider
            </div>
        </div>
    </div>
</div>
   
    </div>
        <!-- Modal for Adding a New Boutique -->
        <div class="modal fade" id="addBoutiqueModal" tabindex="-1" aria-labelledby="addBoutiqueModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered"> <!-- Added modal-lg and modal-dialog-centered -->
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addBoutiqueModalLabel">Ajouter une nouvelle boutique</h5>
                        <button type="button" class="btn-primary" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="<%= request.getContextPath() %>/add" method="post">
                            <div class="form-group">
                                <label for="name">Nom de la boutique:</label>
                                <input type="text" class="form-control" id="name" name="name" required>
                            </div>
                            <div class="form-group">
                                <label for="delegation">Délégation (Location):</label>
                                <input type="text" class="form-control" id="delegation" name="delegation" required>
                            </div>
                            <button type="submit" class="btn-primary">Ajouter</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="container-fluid">
            <div class="row">
               
                
                <div class="col">
                    <div class="container">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addBoutiqueModal">
                            <i class="lni lni-add-files"></i>  Ajouter une nouvelle boutique
                        </button>
                        
                        <div class="card-body">
                            <% 
                                List<Boutique> boutiques = (List<Boutique>) request.getAttribute("boutiques");
                                if (boutiques == null || boutiques.isEmpty()) { 
                            %>
                                <div class="alert alert-warning" role="alert">
                                    Aucune boutique disponible. <a href="#" data-toggle="modal" data-target="#addBoutiqueModal">Ajoutez une nouvelle boutique</a>.
                                </div>
                            <% } else { %>
                                <p class="mb-4">Nombre de boutiques disponibles : <%= boutiques.size() %></p>
                                <div class="row">
                                    <% for (Boutique boutique : boutiques) { %>
                                        <div class="col-md-6 col-lg-4">
                                            <div class="card mb-3">
                                                <div class="card-header">
                                                    <h3><%= boutique.getName() %> - <%= boutique.getDelegation() %></h3>
                                                </div>
                                                <div class="card-body">
                                                    <h5>Ressources assignées :</h5>
                                                    <ul>
                                                        <% List<Ressource> ressources = boutique.getRessources();
                                                            for (Ressource ressource : ressources) { %>
                                                                <li>SIM: <%= ressource.getSim() %> - MSISDN: <%= ressource.getMsisdn() %></li>
                                                        <% } %>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    <% } %>
                                </div>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Bootstrap JS and dependencies (jQuery, Popper.js, Bootstrap) -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </body>
    <script>
        let items = document.querySelectorAll('.slider .list .item');
let next = document.getElementById('next');
let prev = document.getElementById('prev');
let thumbnails = document.querySelectorAll('.thumbnail .item');

// config param
let countItem = items.length;
let itemActive = 0;
// event next click
next.onclick = function(){
    itemActive = itemActive + 1;
    if(itemActive >= countItem){
        itemActive = 0;
    }
    showSlider();
}
//event prev click
prev.onclick = function(){
    itemActive = itemActive - 1;
    if(itemActive < 0){
        itemActive = countItem - 1;
    }
    showSlider();
}
// auto run slider
let refreshInterval = setInterval(() => {
    next.click();
}, 5000)
function showSlider(){
    // remove item active old
    let itemActiveOld = document.querySelector('.slider .list .item.active');
    let thumbnailActiveOld = document.querySelector('.thumbnail .item.active');
    itemActiveOld.classList.remove('active');
    thumbnailActiveOld.classList.remove('active');

    // active new item
    items[itemActive].classList.add('active');
    thumbnails[itemActive].classList.add('active');

    // clear auto time run slider
    clearInterval(refreshInterval);
    refreshInterval = setInterval(() => {
        next.click();
    }, 5000)
}

// click thumbnail
thumbnails.forEach((thumbnail, index) => {
    thumbnail.addEventListener('click', () => {
        itemActive = index;
        showSlider();
    })
})
    </script>
</html>
