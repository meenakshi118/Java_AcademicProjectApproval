<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Font Awesome Icons  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
        integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA=="
        crossorigin="anonymous" />

    <!-- Google Fonts  -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

    <title>Forgot Password UI</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-image: url('https://www.vecteezy.com/free-vector/login-background'); /* Set the background image */
            background-size: cover; /* Cover the entire screen */
            background-position: center; /* Center the image */
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 15rem 0;
        }

        .card {
            backdrop-filter: blur(16px) saturate(180%);
            -webkit-backdrop-filter: blur(16px) saturate(180%);
            background-color: rgba(0, 0, 0, 0.75);
            border-radius: 12px;
            border: 1px solid rgba(255, 255, 255, 0.125);
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 30px 40px;
        }

        .lock-icon {
            font-size: 3rem;
        }

        h2 {
            font-size: 1.5rem;
            margin-top: 10px;
            text-transform: uppercase;
        }

        p {
            font-size: 12px;
        }

        .passInput {
            margin-top: 15px;
            width: 80%;
            background: transparent;
            border: none;
            border-bottom: 2px solid deepskyblue;
            font-size: 15px;
            color: white;
            outline: none;
        }

        button {
            margin-top: 15px;
            width: 80%;
            background-color: deepskyblue;
            color: white;
            padding: 10px;
            text-transform: uppercase;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        button:hover {
            background-color: darkblue;
        }
        .account-option {
    text-align: center;
    margin-top: 20px;
    font-size: 16px;
}

.account-option a {
    color: #007BFF; /* Adjust the color as per your theme */
    text-decoration: none;
    font-weight: bold;
}

.account-option a:hover {
    text-decoration: underline;
}
        
    </style>
</head>

<body>
    <div class="card">
        <p class="lock-icon"><i class="fas fa-lock"></i></p>
        <h2>Forgot Password?</h2>
        <p>You can reset your Password here</p>
        <input type="text" class="passInput" placeholder="Email address">
        <button>Send My Password</button>
         <div class="footer">
            
            
        </div>
        <div class="account-option">
    <p>Already have an account? <a href="AdminLogin.jsp">Sign in</a></p>
    <a href="index.html">Back to Home</a> <!-- Added link below sign in -->
</div>
    </div>
    
</body>

</html>
