<%@ Page Language="VB" AutoEventWireup="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="QuickServe helps restaurants manage menus, orders, table QR codes, and customer feedback.">
    <title>QuickServe | Restaurant Management, Made Simpler</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
    <div class="site-shell">
        <header class="site-header">
            <a class="brand" href="#home">QuickServe</a>
            <nav class="main-nav" aria-label="Main navigation">
                <a href="#features">Features</a>
                <a href="#portals">Portals</a>
                <a href="#support">Support</a>
            </nav>
            <div class="header-actions">
                <a class="login-button" href="login.aspx">Sign in</a>
                <a class="login-button secondary-login" href="superadmin.aspx">Super Admin</a>
            </div>
        </header>

        <main>
            <section class="hero" id="home">
                <div class="hero-copy">
                    <p class="eyebrow">A calmer way to run service</p>
                    <h1>
                        Give every table a better way to <span>order and dine.</span>
                    </h1>
                    <p>Keep your menu, incoming orders, table activity, and guest feedback together in one simple restaurant workspace.</p>
                    <div class="hero-actions">
                        <a class="button button-primary" href="login.aspx">Open restaurant portal</a>
                        <a class="button button-secondary" href="#features">Explore features</a>
                    </div>
                    <p class="hero-note">Menu updates and order handoffs stay easy to follow throughout every shift.</p>
                </div>
                <div class="hero-visual">
                    <img src="https://images.unsplash.com/photo-1559339352-11d035aa65de?auto=format&amp;fit=crop&amp;w=1100&amp;q=85" alt="Guests enjoying a meal together in a restaurant">
                    <div class="hero-caption">
                        <strong>One connected workspace</strong>
                        <span>From first scan to final feedback</span>
                    </div>
                </div>
            </section>

            <section class="features" id="features">
                <div class="section-heading">
                    <p class="eyebrow">Made for the pace of hospitality</p>
                    <h2>Everything your team needs, in one place.</h2>
                    <p>Spend less time switching tools and more time looking after your guests.</p>
                </div>
                <div class="feature-grid">
                    <article class="feature-card">
                        <h3>Menu management</h3>
                        <p>Update dishes, prices, descriptions, and photos. Find items quickly by category or search.</p>
                    </article>
                    <article class="feature-card">
                        <h3>Order tracking</h3>
                        <p>Review incoming tickets, adjust item quantities, send orders to the kitchen, and keep status visible.</p>
                    </article>
                    <article class="feature-card">
                        <h3>Table and guest insights</h3>
                        <p>See sample table activity, explore service trends, and follow up on guest comments from the portal.</p>
                    </article>
                </div>
            </section>

            <section class="workflow-section">
                <div>
                    <p class="eyebrow">A simple flow</p>
                    <h2>Set up your shift in a few clear steps.</h2>
                    <p>Start with your restaurant profile, keep your menu current, then review orders and activity as service unfolds.</p>
                </div>
                <ol class="workflow-list">
                    <li>
                        <strong>Set up</strong>
                        <span>Add your restaurant details and contact information.</span>
                    </li>
                    <li>
                        <strong>Prepare</strong>
                        <span>Review menu items, prices, categories, and photos.</span>
                    </li>
                    <li>
                        <strong>Serve</strong>
                        <span>Track orders, table activity, and feedback in the portal.</span>
                    </li>
                </ol>
            </section>

            <section class="plans-section" id="portals">
                <div>
                    <p class="eyebrow">Choose your workspace</p>
                    <h2>Restaurant or platform administration?</h2>
                    <p>Open the portal that matches your role. This project currently runs as a front-end demo with sample records.</p>
                </div>
                <div class="plan-actions">
                    <a class="button button-primary" href="login.aspx">Restaurant portal</a>
                    <a class="button button-secondary" href="superadmin.aspx">Super Admin portal</a>
                </div>
            </section>

            <section class="support-section" id="support">
                <p class="eyebrow">Need a hand?</p>
                <h2>Start with the page you need.</h2>
                <p>Use the portal navigation to move between your dashboard, menu, orders, metrics, feedback, and restaurant profile.</p>
                <a class="button button-primary" href="login.aspx">Go to sign in</a>
            </section>
        </main>
        <footer class="site-footer">© 2026 QuickServe. Restaurant tools for a smoother service.</footer>
    </div>
</body>
</html>
