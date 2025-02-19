<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="URL_TO_PLAYWRITE_BE_WAL_FONT" rel="stylesheet">

    <style>
        /* Reset default browser margin and padding */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Courgette', cursive; /* Use Courgette font */
            color: #fff; /* White text for better contrast */
           	background-image: url("https://img.freepik.com/premium-vector/building-sustaining-effective-team-development-illustration_275655-480.jpg?w=900");
    background-size: cover;
            background-size: cover; /* Cover the entire background */
            background-position: center; /* Center the background image */
            background-repeat: no-repeat; /* Prevent repeating the background image */
            background-attachment: fixed; /* Keep the background fixed during scrolling */
        }

        /* Navigation Bar */
        nav {
            background-color: rgba(0, 0, 0, 0.8);
            padding: 15px;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 2;
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
            color: #ffcc00; /* Gold color for links */
            font-size: 1.2em;
            transition: color 0.4s ease, transform 0.4s ease; /* Enhanced transition */
        }

        nav ul li a:hover {
            color: #ffd700; /* Brighter gold on hover */
            transform: scale(1.1); /* Slight zoom effect */
        }

        /* Left-aligned Vertical Menu */
        .menu {
            position: fixed;
            left: 20px; /* Align to the left */
            top: 70px; /* Adjust based on the nav bar height */
            display: flex;
            flex-direction: column; /* Vertical alignment */
            gap: 10px; /* Space between menu items */
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent background for the menu */
            padding: 15px; /* Padding around the menu */
            border-radius: 5px; /* Rounded corners */
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3); /* Shadow for depth */
            z-index: 1; /* Ensure it's above other content */
        }

        .menu-title {
            color: #333;
            padding: 10px 15px;
            cursor: pointer;
            transition: background-color 0.4s ease, color 0.4s ease, transform 0.4s ease; /* Enhanced transition */
            border: 1px solid transparent; /* Border for spacing */
            border-radius: 5px; /* Rounded corners */
        }

        .menu-title:hover {
            background-color: #ffcc00; /* Gold background on hover */
            color: black;
            border: 1px solid #333; /* Border on hover */
            transform: translateY(-2px); /* Lift effect on hover */
        }

        /* Content Section */
        .content {
            margin-left: 200px; /* Space for the fixed menu */
            margin-top: 100px; /* Space for the fixed nav bar */
            padding: 20px;
        }

        /* Heading Style */
        h1 {
            margin-bottom: 20px; /* Add margin below the heading */
            font-size: 2.5em; /* Increased font size for visibility */
            text-align: center; /* Center the heading */
            color: #ffcc00; /* Gold color for heading */
        }

        /* Info Section */
        .info {
            display: none; /* Hidden by default */
            margin-top: 30px; /* Increased space above the info section */
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent background */
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
            max-width: 800px; /* Limit the width for better readability */
            margin-left: auto; /* Center the info section */
            margin-right: auto; /* Center the info section */
            transition: opacity 0.3s ease, transform 0.3s ease; /* Transition for effects */
        }

        .info h2 {
            color: #2980b9; /* Blue color for subheadings */
            margin-bottom: 15px; /* Space below the subheading */
        }

        .info p {
            line-height: 1.6; /* Improved line spacing */
            color: #34495e; /* Dark gray for paragraphs */
        }
        
        /* Highlighted Menu Heading */
        .menu-heading {
            font-size: 1.7em; /* Larger font size for emphasis */
            font-weight: bold; /* Bold text */
            color: #fff; /* White text */
            text-align: center; /* Center alignment */
            margin-bottom: 20px; /* More space below the heading */
            padding: 7px; /* Padding around the text */
            background-color: #ffcc00; /* Gold background color */
            border-radius: 5px; /* Rounded corners */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Subtle shadow for depth */
            text-transform: uppercase; /* Make the text uppercase */
            letter-spacing: 1px; /* Add letter spacing for emphasis */
            border: 2px solid #ffd700; /* Slightly brighter gold border */
            transition: transform 0.3s ease; /* Smooth transition for the effect */
        }

        .menu-heading:hover {
            transform: scale(1.05); /* Slightly enlarge on hover */
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <!-- Add more navigation links as needed -->
        </ul>
    </nav>

    <!-- Left-aligned Vertical Menu -->
    <div class="menu">
        <div class="menu-heading">Project Info</div> <!-- Highlighted heading -->
        <div class="menu-title" onclick="showInfo('systemArchitecture')">System Architecture</div>
        <div class="menu-title" onclick="showInfo('userAuth')">User Authentication</div>
        <div class="menu-title" onclick="showInfo('adminPanel')">Admin Panel</div>
        <div class="menu-title" onclick="showInfo('projectSubmission')">Project Submission</div>
        <div class="menu-title" onclick="showInfo('collaboration')">Collaboration</div>
        <div class="menu-title" onclick="showInfo('notifications')">Notifications</div>
        <div class="menu-title" onclick="showInfo('loginSecurity')">Login Security</div>
        <div class="menu-title" onclick="showInfo('approvalFlow')">Flow of Project Acceptance</div>
        <div class="menu-title" onclick="showInfo('signupIssues')">Signup Issues</div>
    </div>

    <!-- Content Section -->
    <div class="content">
        <h1></h1>
        <div id="info" class="info"></div>
    </div>

    <script>
        const infoContent = {
            systemArchitecture: `
                <h2>System Architecture Design</h2>
                <p>Define Roles and Access for users and establish a sequential workflow for project submissions.</p>
            `,
            userAuth: `
                <h2>User Authentication and Role Management</h2>
                <p>Create login and registration pages, implement AJAX for validation, and encrypt passwords.</p>
            `,
            adminPanel: `
                <h2>Admin Panel</h2>
                <p>Manage users, assign roles, and send notifications through the admin interface.</p>
            `,
            projectSubmission: `
                <h2>Project Submission and Workflow</h2>
                <p>Students submit projects through a dedicated form with a defined approval workflow.</p>
            `,
            collaboration: `
                <h2>Collaboration Workspace</h2>
                <p>Facilitate interaction between students and guides through a virtual workspace.</p>
            `,
            notifications: `
                <h2>Notifications and Messaging</h2>
                <p>Implement real-time notifications and email updates for project statuses.</p>
            `,
            loginSecurity: `
                <h2>Login Security</h2>
                <p>Ensure secure password storage, enable HTTPS, and manage user sessions effectively.</p>
            `,
            approvalFlow: `
                <h2>Flow of Project Acceptance</h2>
                <p>Students submit projects, followed by approvals from HOD, Project In-Charge, and Internal Guide in a sequential flow.</p>
            `,
            signupIssues: `
                <h2>Signup Issues</h2>
                <p>Contact admin for any signup-related issues through the support email or helpdesk.</p>
            `,
        };

        function showInfo(section) {
            const infoDiv = document.getElementById('info');
            infoDiv.innerHTML = infoContent[section];
            infoDiv.style.display = 'block'; // Show the info div
            infoDiv.style.opacity = 0; // Set initial opacity for transition
            infoDiv.style.transform = 'translateY(-10px)'; // Set initial position for transition
            setTimeout(() => {
                infoDiv.style.opacity = 1; // Fade in effect
                infoDiv.style.transform = 'translateY(0)'; // Move to position
            }, 10); // Delay to allow initial styles to take effect
        }
    </script>
</body>
</html>
