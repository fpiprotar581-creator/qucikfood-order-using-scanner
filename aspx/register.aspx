<%@ Page Language="VB" AutoEventWireup="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account | QuickServe</title>
    <link rel="stylesheet" href="../css/register.css">
</head>
<body>
    <main class="account-layout login-layout">
        <section class="account-story login-story" aria-label="QuickServe customer story">
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

        <section class="account-panel login-panel" aria-labelledby="register-title">
            <div class="account-card login-card">
                <nav class="auth-tabs" aria-label="Account options">
                    <a class="auth-tab" href="login.aspx">Login</a>
                    <a class="auth-tab is-active" href="register.aspx" aria-current="page">Create Account</a>
                </nav>
                <h1 id="register-title">Create your account</h1>
                <p class="intro">Get started with QuickServe.</p>
                <form id="register-form" action="#" method="post">
                    <div class="field-group">
                        <label for="name">Full Name</label>
                        <input id="name" name="name" type="text" placeholder="Your name" autocomplete="name" minlength="2" required>
                    </div>
                    <div class="field-group">
                        <label for="email">Email Address</label>
                        <input id="email" name="email" type="email" placeholder="name@restaurant.com" autocomplete="email" required>
                    </div>
                    <div class="field-group">
                        <label for="password">Password</label>
                        <input id="password" name="password" type="password" placeholder="At least 8 characters" autocomplete="new-password" minlength="8" required>
                    </div>
                    <div class="field-group">
                        <label for="confirm-password">Confirm Password</label>
                        <input id="confirm-password" name="confirmPassword" type="password" placeholder="Enter your password again" autocomplete="new-password" minlength="8" required>
                    </div>
                    <button class="account-submit" type="submit">Create Account</button>
                    <p class="form-status" id="register-status" role="status" aria-live="polite"></p>
                </form>
                <p class="login-prompt">
                    Already have an account? <a href="login.aspx">Login</a>
                </p>
                <p class="demo-notice">Demo preview: account creation is not connected to a server, so these details are not registered.</p>
            </div>
        </section>
    </main>
    <script>
        const registerForm = document.getElementById("register-form");
        const password = document.getElementById("password");
        const confirmPassword = document.getElementById("confirm-password");

        function validatePasswordMatch() {
            confirmPassword.setCustomValidity(
                confirmPassword.value && confirmPassword.value !== password.value
                    ? "Passwords do not match."
                    : ""
            );
        }

        password.addEventListener("input", validatePasswordMatch);
        confirmPassword.addEventListener("input", validatePasswordMatch);
        registerForm.addEventListener("submit", function (event) {
            event.preventDefault();
            document.getElementById("register-status").textContent = "Your details are valid. Account creation is not connected in this static demo.";
        });
    </script>
</body>
</html>
