<%@ Page Language="VB" AutoEventWireup="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | QuickServe</title>
    <link rel="stylesheet" href="../css/login.css">
</head>
<body>
    <main class="login-layout">
        <section class="login-story" aria-label="QuickServe customer story">
            <div class="story-background" role="img" aria-label="Restaurant chefs working in a busy kitchen"></div>
            <a class="story-brand" href="index.aspx">
                <svg viewBox="0 0 32 32" aria-hidden="true">
                    <path d="M7 4v8m4-8v8M5 9h8M9 12v16M22 4c-3 4-4 8-4 12h8c0-4-1-8-4-12Zm0 12v12" />
                </svg>
                <span>QuickServe</span>
            </a>
            <div class="story-quote">
                <blockquote>"QuickServe transformed our kitchen operations. We cut ticket times by 30% in the first week. It's the silent partner every successful restaurant needs."</blockquote>
                <div class="story-author">
                    <img src="https://images.unsplash.com/photo-1551836022-d5d88e9218df?auto=format&amp;fit=crop&amp;w=96&amp;h=96&amp;q=80" alt="">
                    <span>Owner, The Daily Table</span>
                </div>
            </div>
        </section>

        <section class="login-panel" aria-labelledby="login-title">
            <div class="login-card">
                <nav class="auth-tabs" aria-label="Account options">
                    <a class="auth-tab is-active" href="login.aspx" aria-current="page">Login</a>
                    <a class="auth-tab" href="register.aspx">Create Account</a>
                </nav>
                <h1 id="login-title">Welcome back</h1>
                <p class="intro">Enter your credentials to access your portal.</p>
                <form id="login-form" action="#" method="post">
                    <div class="field-group">
                        <label for="email">Email Address</label>
                        <input id="email" name="email" type="email" placeholder="name@restaurant.com" autocomplete="email" required>
                    </div>
                    <div class="field-group">
                        <div class="password-label">
                            <label for="password">Password</label>
                            <a href="index.aspx#support">Need help?</a>
                        </div>
                        <input id="password" name="password" type="password" placeholder="••••••••" autocomplete="current-password" minlength="8" required>
                    </div>
                    <div class="field-group">
                        <label for="portal">Sign in to</label>
                        <select id="portal" name="portal">
                            <option value="dashboard.aspx">Restaurant Dashboard</option>
                            <option value="superadmin.aspx">Super Admin Portal</option>
                        </select>
                    </div>
                    <button class="sign-in-button" type="submit">
                        Sign In <span aria-hidden="true">→</span>
                    </button>
                    <p class="form-status" id="login-status" role="status" aria-live="polite"></p>
                </form>
                <p class="demo-notice">Demo preview: sign-in routes to your selected portal; authentication is not connected.</p>
            </div>
        </section>
    </main>
    <script>
        document.getElementById("login-form").addEventListener("submit", function (event) {
            event.preventDefault();
            window.location.href = document.getElementById("portal").value;
        });
    </script>
</body>
</html>
