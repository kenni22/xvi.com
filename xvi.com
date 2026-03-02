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
            <img src="3.png" id="menu-trigger" class="flower-icon" alt="Menu">
            <nav class="top-nav">
                <a href="#" onclick="showPage('home')">HOME</a>
                <a href="#" onclick="showPage('history')">HISTORY</a>
                <a href="#" onclick="showPage('minecraft')">MINECRAFT</a>
                <a href="#" onclick="showPage('games')">GAMES</a>
                <a href="#" onclick="showPage('shop')">SHOP</a>
            </nav>
            <div class="user-controls">
                <button id="login-btn" class="action-btn">LOGIN</button>
            </div>
        </div>
    </header>

    <div id="side-menu" class="side-menu">
        <div class="menu-header">
            <img src="3.png" class="flower-mini">
            <h2>XVI</h2>
        </div>
        <ul>
            <li><a href="#" onclick="showPage('games')">- GAMES</a></li>
            <li><a href="#" onclick="showPage('history')">- HISTORY</a></li>
            <li><a href="#" onclick="showPage('minecraft')">- MINECRAFT</a></li>
            <li><a href="#" onclick="showPage('shop')">- SHOP</a></li>
        </ul>
    </div>

    <div id="content-area">
        <section id="page-home" class="page active">
            <img src="1.png" class="full-bg-image">
        </section>

        <section id="page-history" class="page">
            <img src="4.jpg" class="full-bg-image">
        </section>

        <section id="page-minecraft" class="page">
            <img src="5.jpg" class="full-bg-image">
        </section>

        <section id="page-games" class="page">
            <img src="6.jpg" class="full-bg-image">
        </section>

        <section id="page-shop" class="page">
            <img src="7.jpg" class="full-bg-image">
        </section>
    </div>

    <footer>
        <div class="newsletter-section">
            <img src="2.jpg" class="footer-bg">
            <div class="footer-overlay">
                <a href="#" class="privacy-link">Privacy Policy</a>
                <a href="#" class="legal-link">Legal</a>
            </div>
        </div>
    </footer>

    <script>
        // Funzione per cambiare pagina
        function showPage(pageId) {
            document.querySelectorAll('.page').forEach(p => p.classList.remove('active'));
            document.getElementById('page-' + pageId).classList.add('active');
            document.getElementById('side-menu').classList.remove('active');
        }

        // Fiore apre menu
        document.getElementById('menu-trigger').onclick = () => {
            document.getElementById('side-menu').classList.toggle('active');
        };

        // Login base
        const btn = document.getElementById('login-btn');
        btn.onclick = () => {
            let user = prompt("Username:");
            if(user) btn.innerText = "LOGOUT (" + user + ")";
        };
    </script>
</body>
</html>
