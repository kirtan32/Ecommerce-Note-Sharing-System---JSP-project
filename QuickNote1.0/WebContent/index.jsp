<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>QuickNote</title>
    <!-- CSS of body -->
    <style>
        @keyframes hidePreloader {
            0% {
                width: 100%;
                height: 100%;
            }

            100% {
                width: 0;
                height: 0;
            }
        }

        body>div.preloader {
            position: fixed;
            background: white;
            width: 100%;
            height: 100%;
            z-index: 1071;
            opacity: 0;
            transition: opacity .5s ease;
            overflow: hidden;
            pointer-events: none;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        body:not(.loaded)>div.preloader {
            opacity: 1;
        }

        body:not(.loaded) {
            overflow: hidden;
        }

        body.loaded>div.preloader {
            animation: hidePreloader .5s linear .5s forwards;
        }
    </style>
    
    <!-- Favicon -->
    <link rel="icon" href="images/mark3.png" type="image/png"><!-- Font Awesome -->
    <!-- Quick CSS -->
    <link rel="stylesheet" href="CSS/quick-website.css" id="stylesheet">
</head>

<body>

	<!-- Nav bar -->
	<jsp:include page="Header.jsp" />  
	    
    <!-- Main content -->
    <section class="slice py-7">
        <div class="container">
            <div class="row row-grid align-items-center">
                <div class="col-12 col-md-5 col-lg-6 order-md-2 text-center">
                    <!-- Image -->
                    <figure class="w-100">
                        <img alt="Image placeholder" src="images/mark4.png" class="img-fluid mw-md-120">
                    </figure>
                </div>
                <div class="col-12 col-md-7 col-lg-6 order-md-1 pr-md-5">
                    <!-- Heading -->
                    <h1 class="display-4 text-center text-md-left mb-3">
                        Book is a Gift<br> 
						you can<br>
<strong class="text-primary">Share and Earn</strong>
                    </h1>
                    <!-- Text -->
                    <p class="lead text-center text-md-left text-muted">
                        Share your Books and Hand-written Notes and earn Money.
                    </p>
                    <!-- Buttons -->
                    <div class="text-center text-md-left mt-5">
                        <a href="index.html" class="btn btn-primary btn-icon">
                            <span class="btn-inner--text">Get started</span>
                            <span class="btn-inner--icon"><i data-feather="chevron-right"></i></span>
                        </a>
                 
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="slice slice-lg pt-lg-6 pb-0 pb-lg-6 bg-section-secondary">
        <div class="container">
            <!-- Title -->
            <!-- Section title -->
            <div class="row mb-5 justify-content-center text-center">
                <div class="col-lg-6">
                    <span class="badge badge-soft-success badge-pill badge-lg">
                        Get started
                    </span>
                    <h2 class=" mt-4">Recently Added Notes</h2>
                    <div class="mt-2">
                        <p class="lead lh-180">it shows recently added top notes.</p>
                    </div>
                </div>
            </div>
            <!-- Card -->
            <div class="row mt-5">

				<!-- card1 start-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body pb-5">
                            <div class="pt-4 pb-5">
                                <img src="images/mark4.png" class="img-fluid img-center" style="height: 150px;" alt="Illustration" />
                            </div>
                            <h5 class="h4 lh-130 mb-3">Data Structure & Algo</h5>
                            <p class="text-muted mb-0">Contains all algorithms with code.<br>Collage : MSU<br>City : Vadodara</p>
                        </div>
                    </div>
                </div>
				<!-- card1 End -->

                <!-- add here -->
            </div>
        </div>
    </section>
    
    <!-- Footer  -->
    <jsp:include page="Footer.jsp" />  
	
        
</body>

</html>