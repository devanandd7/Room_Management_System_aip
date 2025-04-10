
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>room Management System</title>
    <style>
        /* Your existing CSS */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            /* background: linear-gradient(to right, #4facfe, #00f2fe); */ /* Removed static gradient */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            /* background-size: 200% 200%;  Removed from here */
            /* animation: animatedGradient 10s ease infinite;  Removed from here */
            background-color: #1a202c; /* Darker background */
            overflow: hidden; /* Prevent scrollbars */
            position: relative; /* Needed for absolute positioning of canvas */
        }

        /* @keyframes animatedGradient {
             0% { background-position: 0% 50%; }
             50% { background-position: 100% 50%; }
             100% { background-position: 0% 50%; }
         } */


        .container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 350px;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        #loginForm {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        input {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            width: 100%;
            margin-top: 10px;
        }

        button {
            background: #007bff;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: background 0.3s;
            margin-top: 10px;
        }

        button:hover {
            background: #0056b3;
        }

        p {
            margin-top: 10px;
        }

        a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        #canvas-animation {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
        }
    </style>
    <script src="https://cdn.tailwindcss.com"></script>



</head>
<body  class="bg-gradient-to-r from-blue-400 to-cyan-400 flex justify-center items-center h-screen">

<canvas id="canvas-animation"></canvas>
<div
        class="bg-white p-8 rounded-lg shadow-lg text-center w-96"
>
    <h2 class="text-2xl font-semibold text-gray-800 mb-6">
        Welcome to room Management System
        <br/> Agent
    </h2>
    <div
            id="loginForm"
            class="flex flex-col gap-4"
    >
        <h2 class="text-xl font-semibold text-gray-700 underline mb-2">Login</h2>
        <form id="login_Form" onsubmit="login(event)">
            <input type="text" name="action" value="login" hidden>
            <input
                    type="text"
                    name="username"
                    placeholder="Username"
                    required
                    class="border border-gray-300 rounded-md py-2 px-3 text-gray-700 focus:outline-none focus:ring-2 focus:ring-blue-500 w-full"
            />
            <input
                    type="password"
                    name="password"
                    placeholder="Password"
                    required
                    class="border border-gray-300 rounded-md py-2 px-3 text-gray-700 focus:outline-none focus:ring-2 focus:ring-blue-500 w-full"
            />
            <button
                    type="submit"
                    class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-md transition duration-300 mt-2"
            >
                Login
            </button>
        </form>
        <p class="text-gray-600 mt-4">
            Don't have an account?
            <a
                    href="registerPage.jsp"
                    class="text-blue-500 font-semibold hover:underline"
            >
                Register here
            </a>
        </p>
        <p class="text-gray-600">
            Admin Login -
            <a
                    href="AdminPage.jsp"
                    class="text-blue-500 font-semibold hover:underline"
            >
                Click here
            </a>
        </p>
    </div>
</div>

<%--<div class="container">--%>
<%--    <h2>Welcome to Student Management System</h2>--%>
<%--    <div id="loginForm">--%>
<%--        <h2><u>Login</u></h2>--%>
<%--        <form id="login_Form" onsubmit="login(event)">--%>
<%--            <input type="text" name="action" value="login" hidden>--%>
<%--            <input type="text" name="username" placeholder="Username" required>--%>
<%--            <input type="password" name="password" placeholder="Password" required>--%>
<%--            <button type="submit">Login</button>--%>
<%--        </form>--%>
<%--        <p>Don't have an account? <a href="registerPage.jsp">Register here</a></p>--%>
<%--        <p>Admin Login - <a href="AdminPage.jsp">Click here</a></p>--%>
<%--    </div>--%>
<%--</div>--%>




<script>
    function login(event) {
        event.preventDefault();
        const form = new FormData(document.getElementById('login_Form'));
        fetch("hello-servlet", {
            method: 'POST',
            body: new URLSearchParams(form),
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            }
        }).then((res) => {
            if (res.redirected) {
                window.location.href = res.url;
                return Promise.reject("Redirected")
            }
            return res.text()
        }).then(data => {
            alert(data)
        })
    }
</script>



<%--for animation --%>

<script>
    const canvas = document.getElementById('canvas-animation');
    const ctx = canvas.getContext('2d');

    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;

    const lines = [];
    const dots = [];
    const numLines = 60;  // Increased number of lines
    const numDots = 150;    // Increased number of dots
    const lineSpeed = 0.5;
    const dotSpeed = 0.8;
    const lineWidth = 1;
    const lineOpacity = 0.3;
    const dotOpacity = 0.5;
    const dotSize = 2;

    class Line {
        constructor(x, y, length, angle) {
            this.x = x;
            this.y = y;
            this.length = length;
            this.angle = angle;
            this.speed = lineSpeed;
        }

        update() {
            this.x += Math.cos(this.angle) * this.speed;
            this.y += Math.sin(this.angle) * this.speed;

            // Wrap around edges
            if (this.x > canvas.width) this.x = 0;
            if (this.x < 0) this.x = canvas.width;
            if (this.y > canvas.height) this.y = 0;
            if (this.y < 0) this.y = canvas.height;
        }

        draw() {
            ctx.strokeStyle = `rgba(100, 149, 237, ${lineOpacity})`; // SteelBlue
            ctx.lineWidth = lineWidth;
            ctx.beginPath();
            ctx.moveTo(this.x, this.y);
            ctx.lineTo(
                this.x + Math.cos(this.angle) * this.length,
                this.y + Math.sin(this.angle) * this.length
            );
            ctx.stroke();
        }
    }

    class Dot {
        constructor(x, y, radius) {
            this.x = x;
            this.y = y;
            this.radius = radius;
            this.speedX = (Math.random() - 0.5) * dotSpeed;
            this.speedY = (Math.random() - 0.5) * dotSpeed;
            this.color = `rgba(255, 255, 255, ${dotOpacity})`;
        }

        update() {
            this.x += this.speedX;
            this.y += this.speedY;

            // Bounce off edges
            if (this.x + this.radius > canvas.width || this.x - this.radius < 0) {
                this.speedX *= -1;
            }
            if (this.y + this.radius > canvas.height || this.y - this.radius < 0) {
                this.speedY *= -1;
            }
        }

        draw() {
            ctx.beginPath();
            ctx.arc(this.x, this.y, this.radius, 0, Math.PI * 2);
            ctx.fillStyle = this.color;
            ctx.fill();
        }
    }

    // Initialize lines
    for (let i = 0; i < numLines; i++) {
        lines.push(new Line(
            Math.random() * canvas.width,
            Math.random() * canvas.height,
            Math.random() * 50 + 20, // Random length between 20 and 70
            Math.random() * Math.PI * 2
        ));
    }

    // Initialize dots
    for (let i = 0; i < numDots; i++) {
        dots.push(new Dot(
            Math.random() * canvas.width,
            Math.random() * canvas.height,
            dotSize
        ));
    }

    function animate() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);

        for (let line of lines) {
            line.update();
            line.draw();
        }

        for (let dot of dots) {
            dot.update();
            dot.draw();
        }

        // Connect dots with lines
        for (let i = 0; i < dots.length; i++) {
            for (let j = i + 1; j < dots.length; j++) {
                const dx = dots[i].x - dots[j].x;
                const dy = dots[i].y - dots[j].y;
                const distance = Math.sqrt(dx * dx + dy * dy);

                if (distance < 120) { // Adjust this threshold as needed
                    ctx.strokeStyle = `rgba(150, 150, 150, ${0.2 * (1 - distance / 120)})`;  // Lighter lines, fade with distance
                    ctx.lineWidth = 0.8;
                    ctx.beginPath();
                    ctx.moveTo(dots[i].x, dots[i].y);
                    ctx.lineTo(dots[j].x, dots[j].y);
                    ctx.stroke();
                }
            }
        }

        requestAnimationFrame(animate);
    }

    animate();

    window.addEventListener('resize', () => {
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;
    });
</script>
</body>
</html>
