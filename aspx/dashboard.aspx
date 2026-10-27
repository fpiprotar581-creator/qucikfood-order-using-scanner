<%@ Page Language="VB" AutoEventWireup="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | QuickServe Portal</title>
    <link rel="stylesheet" href="../css/dashboard.css">
</head>
<body>
    <div class="portal-layout">
        <aside class="sidebar">
            <a class="portal-brand" href="dashboard.aspx">
                <span>
                    <strong>QuickServe<br>Portal</strong>
                    <small>Management Console</small>
                </span>
            </a>
            <nav class="sidebar-nav" aria-label="Portal navigation">
                <a class="nav-link active" href="#dashboard">Dashboard</a>
                <a class="nav-link" href="menu.aspx">Menu Management</a>
                <a class="nav-link" href="orders.aspx">Order Tracking</a>
                <a class="nav-link" href="qrmetrics.aspx">QR Metrics</a>
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

        <main class="dashboard-main" id="dashboard">
            <header class="page-heading">
                <div>
                    <h1>Dashboard Overview</h1>
                    <p>Sample shift overview. Manage today's menu, orders, and guest activity.</p>
                </div>
                <div class="heading-actions">
                    <a class="qr-button" href="qrmetrics.aspx">View QR Metrics</a>
                    <a class="add-button" href="menu.aspx">New Menu Item</a>
                </div>
            </header>

            <section class="summary-grid" aria-label="Today's summary">
                <article class="summary-card">
                    <div>
                        <p class="card-label">Total Orders</p>
                        <strong class="metric-value">1,284</strong>
                        <p class="trend positive">12% increase vs yesterday</p>
                    </div>
                </article>
                <article class="summary-card" id="metrics">
                    <div>
                        <p class="card-label">Today's Revenue</p>
                        <strong class="metric-value">&#8377;4,520</strong>
                        <p class="trend positive">8% increase vs yesterday</p>
                    </div>
                </article>
                <article class="summary-card" id="feedback">
                    <div>
                        <p class="card-label">New Feedback</p>
                        <strong class="metric-value">42</strong>
                        <p class="trend negative">2% decrease vs yesterday</p>
                    </div>
                </article>
            </section>

            <section class="content-card orders-card" id="orders">
                <div class="section-title">
                    <h2>Sample Order Feed</h2>
                    <a href="orders.aspx">View All Orders</a>
                </div>
                <div class="table-wrap">
                    <table>
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Table</th>
                                <th>Items</th>
                                <th>Total</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>#1024</td>
                                <td>Table 12</td>
                                <td><a href="orders.aspx">3 items</a></td>
                                <td class="amount">&#8377;45.50</td>
                                <td><span class="status active-status">Active</span></td>
                            </tr>
                            <tr>
                                <td>#1025</td>
                                <td>Table 08</td>
                                <td><a href="orders.aspx">5 items</a></td>
                                <td class="amount">&#8377;82.00</td>
                                <td><span class="status pending-status">Pending</span></td>
                            </tr>
                            <tr>
                                <td>#1023</td>
                                <td>Takeaway</td>
                                <td><a href="orders.aspx">1 item</a></td>
                                <td class="amount">&#8377;12.00</td>
                                <td><span class="status completed-status">Completed</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>

            <section class="content-card trending-card" id="trending">
                <h2>Trending Items</h2>
                <article class="trending-item">
                    <img src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&amp;fit=crop&amp;w=120&amp;h=120&amp;q=80" alt="Truffle burger">
                    <div>
                        <h3>Truffle Burger</h3>
                        <p>42 orders today</p>
                    </div>
                    <strong>#1</strong>
                </article>
                <article class="trending-item">
                    <img src="https://images.unsplash.com/photo-1512621776951-a57141f2eefd?auto=format&amp;fit=crop&amp;w=120&amp;h=120&amp;q=80" alt="Salmon poke bowl">
                    <div>
                        <h3>Salmon Poke</h3>
                        <p>28 orders today</p>
                    </div>
                    <strong>#2</strong>
                </article>
            </section>

            <aside class="order-alert" aria-label="Order alert">
                <strong>Table 08 - Ticket #1025</strong>
                <span>1x Truffle Burger</span>
                <span class="elapsed">12m Elapsed</span>
            </aside>
        </main>
    </div>
</body>
</html>
