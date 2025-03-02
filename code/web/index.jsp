<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Academic Project Management</title>
    <!-- Updated Font: Playwrite GB S -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playwrite+GB+S:ital,wght@0,100..400;1,100..400&display=swap" rel="stylesheet">
    
    <style>
        /* Reset default browser margin and padding */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Playwrite GB S', sans-serif;
            color: white;
        }

        /* Background Image and Heading Style */
        .hero-section {
            height: 100vh;
            background-image:url("https://www.arenasolutions.com/wp-content/uploads/What-is-approval-1080x670.jpg");
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            text-align: center;
            color: white;
            position: relative;
        }

        .hero-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5); /* Add a dark overlay to make text stand out */
        }

        .hero-section h1 {
            font-size: 3.5em;
            font-weight: 400;
            margin-bottom: 10px;
            z-index: 1;
        }

        .hero-section p {
            font-size: 1.5em;
            z-index: 1;
            font-weight: 300;
        }

        /* Navigation bar */
        nav {
            background-color: rgba(0, 0, 0, 0.8);
            padding: 15px;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 2;
            margin-left: 250px;
        }

        nav ul {
            list-style-type: none;
            text-align: center;
        }

        nav ul li {
            display: inline-block;
            margin: 0 25px;
        }

        nav ul li a {
            text-decoration: none;
            color: white;
            font-size: 1.2em;
            transition: color 0.3s ease;
        }

        nav ul li a:hover {
            color: #ffcc00;
        }

        /* Footer Section */
        .footer {
            background-color: #2c3e50;
            padding: 30px 0;
            text-align: center;
            color: white;
        }

        .footer h2 {
            font-size: 2em;
            margin-bottom: 15px;
            color: #ffcc00;
        }

        .footer p {
            font-size: 1.1em;
            max-width: 600px;
            margin: 0 auto;
            font-weight: 300;
            line-height: 1.8;
        }

        .footer-links {
            margin-top: 15px;
        }

        .footer-links a {
            color: white;
            margin: 0 15px;
            text-decoration: none;
            font-size: 1.1em;
            transition: color 0.3s ease;
        }

        .footer-links a:hover {
            color: #ffcc00;
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <nav>
        <ul>
            <li><a href="home.jsp">Home</a></li>
            <li><a href="AdminLogin.jsp">Admin</a></li>
            <li><a href="StudentLogin.jsp">Student</a></li>
            <li><a href="InChargeLogin.jsp">Project-in-Charge</a></li>
            <li><a href="HODLogin.jsp">HOD</a>
        </ul>
    </nav>

    <!-- Hero Section with Background Image and Heading -->
    <div class="hero-section">
        <h1>Academic Project Management</h1>
        <p>Manage your academic projects with ease and efficiency</p>
    </div>

    <!-- Footer Section with About Us -->
    <div class="footer">
        <h2>About Us</h2>
        <p class="lines">We provide an efficient platform to manage academic projects, from submission to approval, offering comprehensive tracking and collaboration features for students and faculty alike.</p>
        <br>
            <p class="lines">Submit, track, and approve projects with ease.</p><br>
            <p class="lines">Your journey to successful project completion starts here!</p>
       
    </div>

</body>
</html>