<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Accueil</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/0faddc1af8.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            background-color: #fff; /* White background for the page */
            color: #333; /* Dark text color */
            font-family: Arial, sans-serif;
        }
        .container {
            margin-top: 30px;
        }
        .card {
            
            margin-bottom: 20px;
            border-radius: 8px;
            border: 1px solid #FF8C00; /* Dark orange border */
        }
        .card-title {
            font-size: 1.5rem;
        
        }
        .card-header {
            background-color: #FF8C00; /* Dark orange background for header */
            color: #ffffff; /* White text color */
        }
        .card-body {
            background-color: #f5cdb2; /* White background for card body */
            border: 1px solid #000000; /* Light grey border */
        }
        .chart-container {
            position: relative;
            height: 200px;
            width: 100%;
        }
    </style>
</head>
<body>
    <%@ include file="navbarr.jsp" %>
    <div class="container">
        <h1 class="text-center mb-4">Bienvenue, ${admin.email}</h1>
        
        <div class="card">
            <div class="card-body ">
                <h5 class="card-title text-center">Statistiques des Ressources</h5>
                <div class="row">
                    <div class="col-md-4">
                        <div class="chart-container">
                            <canvas id="resourceChart"></canvas>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div  style="background-color: #000000;" class="card  mb-3">
                            <div style="color: #FF8C00;" class="card-header ">Nombre total de ressources</div>
                            <div style="background-color: #ffffff;" class="card-body">
                                <h5 class="card-title text-center">${totalRessources}</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="chart-container">
                            <canvas id="monthlyStatsChart"></canvas>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
    
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            fetch('/ressource/resource-stats')
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    console.log('Data received:', data);
                    const ctx = document.getElementById('resourceChart').getContext('2d');
                    const labels = Object.keys(data);
                    const values = Object.values(data);

                    new Chart(ctx, {
                        type: 'line',
                        data: {
                            labels: labels,
                            datasets: [{
                                label: 'Resources generees',
                                data: values,
                                backgroundColor: "#FF8C00", // Dark orange background
                                borderColor: "#FF8C00", // Black border
                                borderWidth: 3,
                                tension: 0.1 // Smooth curve
                            }]
                        },
                        options: {
                            scales: {
                                x: {
                                    beginAtZero: true,
                                    title: {
                                        display: true,
                                        text: 'Date',
                                        color: "#FF8C00"
                                    }
                                },
                                y: {
                                    beginAtZero: true,
                                    title: {
                                        display: true,
                                        text: 'nombres',
                                        color:"#FF8C00"
                                    }
                                }
                            }
                        }
                    });
                })
                .catch(error => console.error('Fetch error:', error));
      
      
            });
    </script>
</body>
</html>
