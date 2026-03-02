<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>XVI TEAM - Official Site</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap" rel="stylesheet">
</head>
<body>

    <header>
        <div class="nav-container">
            <img src="fiore.png" id="menu-trigger" class="flower-icon" alt="Menu">
            
            <nav class="top-nav">
                <a href="#">HOME</a>
                <a href="#">HISTORY</a>
                <a href="#">MINECRAFT</a>
                <a href="#">GAMES</a>
                <a href="#">SHOP</a>
            </nav>
            
            <div class="search-bar">
                <input type="text" placeholder="SEARCH...">
            </div>
            
            <div class="user-controls">
                <button id="login-btn" class="action-btn">LOGIN</button>
            </div>
        </div>
    </header>

    <div id="side-menu" class="side-menu">
        <div class="menu-header">
            <img src="fiore.png" class="flower-mini" alt="Mini Fiore">
            <h2>XVI</h2>
        </div>
        <ul>
            <li><a href="#">- GAMES</a></li>
            <li><a href="#">- HISTORY</a></li>
            <li><a href="#">- MINECRAFT</a></li>
            <li><a href="#">- SHOP</a></li>
        </ul>
    </div>

    <main class="hero">
        <div class="logo-container">
            <img src="logo.png" alt="XVI TEAM LOGO" class="main-logo">
        </div>
    </main>

    <footer>
        <div class="newsletter">
            <h3>STAY UPDATED</h3>
            <input type="email" placeholder="EMAIL ADDRESS">
            <button class="action-btn">SIGN-UP</button>
        </div>
        <div class="footer-links">
            <a href="#">Contact us</a>
            <a href="#">Support</a>
            <a href="#">Privacy Policy</a>
            <a href="#">Legal</a>
        </div>
        <p>© XVI Team 2026. All rights reserved.</p>
    </footer>

    <script>
        // 1. Logica per aprire/chiudere il menù col fiore
        const menuTrigger = document.getElementById('menu-trigger');
        const sideMenu = document.getElementById('side-menu');
        
        menuTrigger.onclick = function() {
            sideMenu.classList.toggle('active');
        };

        // 2. Logica finta per il Login / Logout
        const loginBtn = document.getElementById('login-btn');
        let isLoggedIn = false;

        loginBtn.onclick = function() {
            if(!isLoggedIn) {
                let user = prompt("Inserisci il tuo Username:");
                if(user && user.trim() !== "") {
                    loginBtn.innerText = "LOGOUT (" + user + ")";
                    loginBtn.style.backgroundColor = "#ff6b81"; // Cambia colore da loggato
                    isLoggedIn = true;
                }
            } else {
                loginBtn.innerText = "LOGIN";
                loginBtn.style.backgroundColor = "#ffb6c1"; // Torna al colore base
                isLoggedIn = false;
                alert("Ti sei disconnesso con successo!");
            }
        };
    </script>
</body>
</html>
