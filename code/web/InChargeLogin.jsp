<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="style.css">
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;300;400;500;600;700&display=swap");
        @import url("https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;600;700&display=swap");

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Open Sans", sans-serif;
        }

        body {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            width: 100%;
            padding: 0 10px;
            background: #000;
            position: relative;
        }

        body::before {
            content: "";
            position: absolute;
            width: 100%;
            height: 100%;
           background-image: url("https://img.freepik.com/premium-vector/girl-with-laptop-memphis-style-vector-illustration_946657-1941.jpg?w=900");
            background-size: cover;
            opacity: 0.5;
            z-index: -1;
        }

        .wrapper {
            width: 400px;
            border-radius: 8px;
            padding: 30px;
            text-align: center;
            border: 1px solid rgba(255, 255, 255, 0.5);
            backdrop-filter: blur(8px);
            -webkit-backdrop-filter: blur(8px);
            position: relative;
            z-index: 1;
        }

        h2 {
            font-size: 2rem;
            margin-bottom: 20px;
            color: #fff;
        }

        .input-field {
            position: relative;
            border-bottom: 2px solid #ccc;
            margin: 15px 0;
        }

        .input-field label {
            position: absolute;
            top: 50%;
            left: 0;
            transform: translateY(-50%);
            color: #fff;
            font-size: 16px;
            pointer-events: none;
            transition: 0.15s ease;
        }

        .input-field input {
            width: 100%;
            height: 40px;
            background: transparent;
            border: none;
            outline: none;
            font-size: 16px;
            color: #fff;
        }

        .input-field input:focus ~ label,
        .input-field input:valid ~ label {
            font-size: 0.8rem;
            top: 10px;
            transform: translateY(-120%);
        }

        button {
            background: #fff;
            color: #000;
            font-weight: 600;
            border: none;
            padding: 12px 20px;
            cursor: pointer;
            border-radius: 3px;
            font-size: 16px;
            border: 2px solid transparent;
            transition: 0.3s ease;
        }

        button:hover {
            color: #fff;
            border-color: #fff;
            background: rgba(255, 255, 255, 0.15);
        }

        .wrapper a {
            color: #efefef;
            text-decoration: none;
        }

        .wrapper a:hover {
            text-decoration: underline;
        }

        .account-option {
            text-align: center;
            margin-top: 20px;
            font-size: 16px;
        }

        .account-option a {
            color: #FFFFFF;
            text-decoration: none;
            font-weight: bold;
        }

        .account-option a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <form action="InChargeLoginServlet" method="POST">
            <h2>Login</h2>
            <div class="input-field">
                <input type="text" name="email" required> <!-- Added name="email" -->
                <label>Enter your email</label>
            </div>
            <div class="input-field">
                <input type="password" name="password" required> <!-- Added name="password" -->
                <label>Enter your password</label>
            </div>
            <button type="submit">Log In</button>
            <div class="account-option">
                <a href="index.jsp">Back to Home</a>
            </div>
        </form>
    </div>
</body>
</html>

