<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Already Exists</title>

    <!-- Google Fonts for elegant typography -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

    <style>
        /* Global Body Styling */
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background: #f4f7fa; /* Soft light background */
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
            text-align: center;
        }

        /* Main container with a box-shadow and rounded corners */
        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            width: 100%;
            margin-top: 50px;
        }

        /* Header Styling */
        h1 {
            font-size: 2.5em;
            color: #e74c3c; /* Red color for error */
            margin-bottom: 20px;
        }

        /* Error message styling */
        .error-message {
            font-size: 1.2em;
            line-height: 1.6;
            margin-bottom: 20px;
            color: #555;
        }

        /* Suggestion Box Styling */
        .suggestion {
            background-color: #e9f7ef;
            border: 1px solid #d5f6e3;
            padding: 20px;
            margin-top: 20px;
            border-radius: 6px;
            color: #2d6a4f;
            font-size: 1.1em;
        }

        .suggestion ul {
            list-style-type: none;
            padding-left: 0;
        }

        .suggestion ul li {
            margin-bottom: 12px;
        }

        /* Button Styling */
        .retry-link {
            display: inline-block;
            background-color: #3498db;
            color: white;
            padding: 12px 20px;
            text-decoration: none;
            border-radius: 6px;
            margin-top: 30px;
            font-size: 1.1em;
            transition: background-color 0.3s ease;
        }

        .retry-link:hover {
            background-color: #2980b9; /* Darker blue on hover */
        }

        /* Footer Styling */
        footer {
            position: absolute;
            bottom: 10px;
            font-size: 0.9em;
            color: #888;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                padding: 30px;
            }

            h1 {
                font-size: 2em;
            }

            .retry-link {
                padding: 10px 15px;
                font-size: 1em;
            }

            .suggestion {
                font-size: 1em;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>User Already Exists</h1>
        <div class="error-message">
            <p>
                The user you are trying to register already exists in our system. Please try again with a new set of credentials.
            </p>
        </div>

        <div class="suggestion">
            <h3>What to do next:</h3>
            <ul>
                <li>Ensure all required fields are filled in correctly.</li>
                <li>Check that the email address format is valid.</li>
                <li>If unsure about any field, please refer to the instructions or contact support.</li>
            </ul>
        </div>

        <a href="javascript:history.back()" class="retry-link">Try New Credentials</a>
       
    </div>

   
</body>
</html>
