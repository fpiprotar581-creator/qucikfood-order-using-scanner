<%@ Page Language="VB" AutoEventWireup="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QR Metrics | QuickServe Portal</title>
    <link rel="stylesheet" href="../css/qrmetrics.css">
</head>
<body>
    <div class="portal-layout">
        <aside class="sidebar">
            <a class="portal-brand" href="dashboard.aspx">
                <span>
                    <strong>QuickServe Portal</strong>
                    <small>Management Console</small>
                </span>
            </a>
            <nav class="sidebar-nav" aria-label="Portal navigation">
                <a class="nav-link" href="dashboard.aspx">Dashboard</a>
                <a class="nav-link" href="menu.aspx">Menu Management</a>
                <a class="nav-link" href="orders.aspx">Order Tracking</a>
                <a class="nav-link active" href="qrmetrics.aspx" aria-current="page">QR Metrics</a>
                <a class="nav-link" href="feedback.aspx">Feedback</a>
                <a class="nav-link" href="settings.aspx">Settings</a>
            </nav>
            <div class="sidebar-bottom">
                <a class="upgrade-button" href="index.aspx#portals">Workspace Options</a>
                <a class="bottom-link" href="index.aspx">Back to Home</a>
                <a class="bottom-link" href="index.aspx#support">Help Center</a>
                <a class="bottom-link" href="login.aspx">Logout</a>
            </div>
        </aside>

        <main class="metrics-main">
            <header class="page-heading">
                <div>
                    <h1>Live QR Metrics</h1>
                    <p>Explore sample table activity and estimated order revenue.</p>
                </div>
                <div class="summary-cards">
                    <article class="summary-stat">
                        <p class="stat-label">ACTIVE TABLES</p>
                        <strong class="stat-value" id="active-scans">0</strong>
                    </article>
                    <article class="summary-stat">
                        <p class="stat-label">REVENUE (EST)</p>
                        <strong class="stat-value" id="estimated-revenue">&#8377;0.00</strong>
                    </article>
                </div>
            </header>

            <div class="metrics-workspace">
                <section class="floor-activity" aria-labelledby="activity-title">
                    <div class="section-header">
                        <h2 id="activity-title">Floor Activity</h2>
                        <div class="activity-tabs" role="group" aria-label="Filter activity">
                            <button class="activity-tab selected" type="button" data-filter="all" aria-pressed="true">All</button>
                            <button class="activity-tab" type="button" data-filter="scanning" aria-pressed="false">Scanning</button>
                            <button class="activity-tab" type="button" data-filter="ordering" aria-pressed="false">Ordering</button>
                        </div>
                    </div>

                    <div class="table-list" id="table-list">
                        <article class="table-row" data-filter="scanning">
                            <div class="table-number">12</div>
                            <div class="table-info">
                                <strong>Table 12</strong>
                                <p>2 Patrons • Arrived 5m ago</p>
                            </div>
                            <span class="status-badge scanning">Scanning Menu</span>
                        </article>

                        <article class="table-row" data-filter="ordering">
                            <div class="table-number">04</div>
                            <div class="table-info">
                                <strong>Table 04</strong>
                                <p>4 Patrons • Ordering (3 items in cart)</p>
                            </div>
                            <span class="status-badge ordering">Ordering</span>
                            <span class="revenue">&#8377;45.00</span>
                        </article>

                        <article class="table-row" data-filter="all">
                            <div class="table-number">09</div>
                            <div class="table-info">
                                <strong>Table 09</strong>
                                <p>2 Patrons • Preparing to leave</p>
                            </div>
                            <span class="status-badge paid">Paid</span>
                            <span class="revenue">&#8377;62.50</span>
                        </article>

                        <article class="table-row" data-filter="ordering">
                            <div class="table-number">22</div>
                            <div class="table-info">
                                <strong>Table 22</strong>
                                <p>8 Patrons • Dining (12 items in cart)</p>
                            </div>
                            <span class="status-badge ordering">Ordering</span>
                            <span class="revenue">&#8377;210.00</span>
                        </article>
                    </div>
                </section>

                <section class="trending-section" aria-labelledby="trending-title">
                    <h2 id="trending-title">Trending Now</h2>
                    <div class="trending-items">
                        <article class="trending-item">
                            <img src="https://images.unsplash.com/photo-1579751626657-72bc17010498?auto=format&amp;fit=crop&amp;w=300&amp;h=200&amp;q=85" alt="Artisan Margherita">
                            <div class="item-info">
                                <h3>Artisan Margherita</h3>
                                <p class="active-orders">12 Active Orders</p>
                                <p class="price">&#8377;18.00</p>
                            </div>
                            <button class="add-button" type="button">Feature</button>
                        </article>

                        <article class="trending-item">
                            <img src="https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?auto=format&amp;fit=crop&amp;w=300&amp;h=200&amp;q=85" alt="Rosemary Gin Spritz">
                            <div class="item-info">
                                <h3>Rosemary Gin Spritz</h3>
                                <p class="active-orders">8 Active Orders</p>
                                <p class="price">&#8377;12.00</p>
                            </div>
                            <button class="add-button" type="button">Feature</button>
                        </article>

                        <article class="trending-item">
                            <img src="https://images.unsplash.com/photo-1573080496219-bb080dd4f877?auto=format&amp;fit=crop&amp;w=300&amp;h=200&amp;q=85" alt="Truffle Fries">
                            <div class="item-info">
                                <h3>Truffle Fries</h3>
                                <p class="active-orders">6 Active Orders</p>
                                <p class="price">&#8377;9.00</p>
                            </div>
                            <button class="add-button" type="button">Feature</button>
                        </article>
                    </div>
                </section>
            </div>
        </main>
    </div>

    <script>
        const tableRows = [...document.querySelectorAll(".table-row")];
        const currency = amount => `\u20B9${amount.toFixed(2)}`;
        document.getElementById("active-scans").textContent = String(tableRows.filter(row => row.dataset.filter === "scanning" || row.dataset.filter === "ordering").length);
        document.getElementById("estimated-revenue").textContent = currency(tableRows.reduce((total, row) => {
            const revenue = row.querySelector(".revenue");
            return total + (revenue ? Number(revenue.textContent.replace(/[\u20B9,]/g, "")) : 0);
        }, 0));

        const featuredKey = "quickserveFeaturedItems";
        const savedFeaturedItems = localStorage.getItem(featuredKey);
        const featuredItems = savedFeaturedItems === null ? [] : JSON.parse(savedFeaturedItems);
        if (!Array.isArray(featuredItems)) throw new TypeError("Saved featured-item data is invalid.");

        document.querySelectorAll(".trending-item").forEach(item => {
            const button = item.querySelector(".add-button");
            const title = item.querySelector("h3").textContent;
            const updateButton = () => {
                const isFeatured = featuredItems.includes(title);
                button.textContent = isFeatured ? "Featured" : "Feature";
                button.setAttribute("aria-pressed", String(isFeatured));
            };
            updateButton();
            button.addEventListener("click", () => {
                const index = featuredItems.indexOf(title);
                if (index < 0) featuredItems.push(title);
                else featuredItems.splice(index, 1);
                localStorage.setItem(featuredKey, JSON.stringify(featuredItems));
                updateButton();
            });
        });

        document.querySelectorAll(".activity-tab").forEach(tab => {
            tab.addEventListener("click", () => {
                document.querySelector(".activity-tab.selected").classList.remove("selected");
                tab.classList.add("selected");
                document.querySelectorAll(".activity-tab").forEach(item => item.setAttribute("aria-pressed", String(item === tab)));
                const filter = tab.dataset.filter;
                tableRows.forEach(row => {
                    row.hidden = filter !== "all" && row.dataset.filter !== filter;
                });
            });
        });
    </script>
</body>
</html>
