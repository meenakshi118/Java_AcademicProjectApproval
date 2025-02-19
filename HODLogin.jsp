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
            background: url("https://img.freepik.com/premium-photo/employees-working-office-successful-team-business-illustration_432516-8136.jpg?w=900") no-repeat center center; /* Adjusted path if needed */
            background-size: cover;
            opacity: 0.5;
            z-index: -1; /* Ensure it is behind other content */
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
    		color: #000000; /* Adjust the color as per your theme */
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
        <form action="HOdLoginServlet" method="post">
            <h2>Login</h2>
            <div class="input-field">
                <input type="text" name = "email" required>
                <label>Enter your email</label>
            </div>
            <div class="input-field">
                <input type="password" name = "password" required>
                <label>Enter your password</label>
            </div>
            <button type="submit">Log In</button>
            
             <div class="account-option">
            
            <a href="index.jsp">Back to Home</a> <!-- Added link below sign in -->
            
        </div>
        </form>
    </div>
</body>
</html>
