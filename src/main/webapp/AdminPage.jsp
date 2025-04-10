<%--
  Created by IntelliJ IDEA.
  User: HELLO
  Date: 07-04-2025
  Time: 01:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Page</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #1a202c;
            color: #f7fafc;
            margin: 0;
            padding: 0;
            background-size: cover;
            animation: animateBackground 20s linear infinite;
            position: relative;
            overflow: hidden;
        }

        @keyframes animateBackground {
            0% { background-position: 0 0; }
            100% { background-position: 100% 0; }
        }

        /* Updated Dots Styles */
        .dot {
            width: 8px; /* Slightly larger dots */
            height: 8px;
            border-radius: 50%;
            background-color: rgba(255, 255, 255, 0.7); /* Slightly brighter dots */
            position: absolute;
            animation: blink 1.5s infinite, move 10s linear infinite; /* Added move animation */
            z-index: 0;
        }

        @keyframes blink {
            0% { opacity: 0; }
            50% { opacity: 1; }
            100% { opacity: 0; }
        }

        @keyframes move {
            0% { transform: translate(0, 0); }
            100% { transform: translate(100vw, 100vh); } /* Dots move across the screen */
        }

        .container {
            max-width: 400px; /* Increased max-width */
            margin: 10rem auto; /* Increased margin-top and changed to auto */
            padding: 2rem;
            background-color: rgba(45, 55, 72, 0.8);
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4); /* Increased shadow */
            backdrop-filter: blur(12px); /* Slightly stronger blur */
            border: 1px solid #4a5568;
            position: relative;
            z-index: 1;
            animation: fadeIn 1s ease, pulse 2s infinite alternate; /* Added pulse animation to container */
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            100% { transform: scale(1.04); } /* Subtler pulse */
        }

        h2 {
            color: #f56565;
            text-align: center;
            margin-bottom: 2.5rem; /* Increased margin-bottom */
            font-weight: 600;
            font-size: 2rem; /* Increased font-size */
            letter-spacing: 0.5px;
            animation: slideInDown 1s ease;
        }

        @keyframes slideInDown {
            from {
                transform: translateY(-50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        form {
            margin-top: 0; /* Removed default form margin-top */
        }

        .form-group {
            margin-bottom: 2rem; /* Increased margin-bottom */
        }

        .form-group label {
            display: block;
            margin-bottom: 0.75rem; /* Increased margin-bottom */
            color: #fff;
            font-weight: 600;
            font-size: 1.2rem; /* Increased font-size */
            transition: color 0.3s ease; /* Added transition */
        }

        .form-group label:hover {
            color: #f56565; /* Label hover color */
        }

        .form-group input {
            width: 100%;
            padding: 0.9rem; /* Increased padding */
            border: 1px solid #4a5568;
            border-radius: 10px; /* More rounded corners */
            font-size: 1.1rem;
            background-color: #4a5568;
            color: #fff;
            transition: border-color 0.3s ease, box-shadow 0.3s ease, background-color 0.3s ease; /* Added background-color transition */
        }

        .form-group input:focus {
            outline: none;
            border-color: #f56565;
            box-shadow: 0 0 8px rgba(245, 101, 101, 0.7); /* Stronger shadow */
            background-color: #5a697d; /* Slightly lighter background on focus */
        }

        .submit-btn {
            background-color: #f56565;
            color: white;
            padding: 1rem 2rem; /* Increased padding */
            border: none;
            border-radius: 10px; /* More rounded corners */
            cursor: pointer;
            font-weight: 600;
            font-size: 1.2rem; /* Increased font-size */
            transition: background-color 0.3s ease, box-shadow 0.3s ease, transform 0.2s ease; /* Added transform */
            width: 100%;
            margin-top: 2rem; /* Increased margin-top */
            box-shadow: 0 5px 12px rgba(0, 0, 0, 0.3); /* Deeper shadow */
        }

        .submit-btn:hover {
            background-color: #e53e3e;
            box-shadow: 0 7px 15px rgba(0, 0, 0, 0.4); /* Increased shadow on hover */
            transform: translateY(-2px); /* Slight lift on hover */
        }

        .submit-btn:active {
            transform: translateY(0);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

    </style>
</head>
<body>
<div class="container">
    <h2>Admin Login</h2>
    <form id="loginForm" onsubmit="login(event)">
        <div class="form-group">
            <input type="text" name="action" value="adminLogin" hidden/>
            <label for="username">Admin Username:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="password">Admin Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <button type="submit" class="submit-btn">Login</button>
    </form>
</div>

<script>
    function login(event) {
        event.preventDefault();
        const data = new FormData(document.getElementById("loginForm"));
        fetch("hello-servlet", {
            method: "POST",
            body: new URLSearchParams(data),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            }
        }).then((res) => {
            if (res.redirected) {
                window.location.href = res.url;
                return Promise.reject(res);
            }
            return res.text()
        }).then((data) => {
            alert(data);
        })
    }
</script>
</body>
</html>
