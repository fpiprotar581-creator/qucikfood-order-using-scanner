<%@ Page Language="VB" AutoEventWireup="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Service Analytics | QuickServe Portal</title>
    <link rel="stylesheet" href="../css/feedback.css">
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
                <a class="nav-link" href="qrmetrics.aspx">QR Metrics</a>
                <a class="nav-link active" href="feedback.aspx" aria-current="page">Feedback</a>
                <a class="nav-link" href="settings.aspx">Settings</a>
            </nav>
            <div class="sidebar-bottom">
                <a class="upgrade-button" href="index.aspx#portals">Workspace Options</a>
                <a class="bottom-link" href="index.aspx">Back to Home</a>
                <a class="bottom-link" href="index.aspx#support">Help Center</a>
                <a class="bottom-link" href="login.aspx">Logout</a>
            </div>
        </aside>

        <main class="feedback-main">
            <header class="page-heading">
                <div>
                    <h1>Service Analytics</h1>
                    <p>Explore sample guest sentiment, service trends, and customer comments.</p>
                </div>
                <div class="header-actions">
                    <label class="date-picker">
                        <select id="date-range" aria-label="Date range">
                            <option value="7">Last 7 Days</option>
                            <option value="30">Last 30 Days</option>
                            <option value="90">Last 90 Days</option>
                        </select>
                    </label>
                    <button class="export-button" id="export-button" type="button">Export</button>
                </div>
            </header>

            <section class="overview-grid" aria-label="Feedback analytics overview">
                <div class="metric-stack">
                    <article class="metric-card">
                        <p>AVG RATING</p>
                        <strong><span id="average-rating">4.6</span> / 5.0</strong>
                        <small>+0.2 vs last week</small>
                    </article>
                    <article class="metric-card">
                        <p>TOTAL FEEDBACK</p>
                        <strong id="total-feedback">342</strong>
                        <small>12% increase</small>
                    </article>
                </div>

                <section class="chart-card" aria-labelledby="sentiment-title">
                    <div class="chart-header">
                        <h2 id="sentiment-title">Sentiment Trend</h2>
                        <div class="chart-controls" role="group" aria-label="Chart interval">
                            <button class="chart-tab active" type="button" data-interval="daily" aria-pressed="true">Daily</button>
                            <button class="chart-tab" type="button" data-interval="weekly" aria-pressed="false">Weekly</button>
                        </div>
                    </div>
                    <div class="chart" id="sentiment-chart" aria-label="Customer sentiment chart">
                        <div class="chart-gridline line-one"></div>
                        <div class="chart-gridline line-two"></div>
                        <div class="chart-gridline line-three"></div>
                        <div class="chart-gridline line-four"></div>
                        <div class="chart-columns" id="chart-columns"></div>
                    </div>
                    <div class="chart-labels" id="chart-labels" aria-hidden="true"></div>
                </section>
            </section>

            <section class="lower-grid">
                <section class="issues-card" aria-labelledby="issues-title">
                    <h2 id="issues-title">Top Service Issues</h2>
                    <article class="issue-item">
                        <div>
                            <h3>Wait Time</h3>
                            <strong>12 Reports</strong>
                        </div>
                        <p>Primarily during dinner rush (6pm-8pm).</p>
                    </article>
                    <article class="issue-item">
                        <div>
                            <h3>Order Accuracy</h3>
                            <strong>8 Reports</strong>
                        </div>
                        <p>Missing modifiers on custom burgers.</p>
                    </article>
                    <article class="issue-item">
                        <div>
                            <h3>Table Cleanliness</h3>
                            <strong>3 Reports</strong>
                        </div>
                        <p>Patio seating area turnover slow.</p>
                    </article>
                </section>

                <section class="comments-card" aria-labelledby="comments-title">
                    <header class="comments-header">
                        <h2 id="comments-title">Recent Comments</h2>
                        <div class="comment-filters" role="group" aria-label="Filter comments">
                            <button class="comment-filter active" type="button" data-filter="all" aria-pressed="true">All</button>
                            <button class="comment-filter" type="button" data-filter="positive" aria-pressed="false">Positives</button>
                            <button class="comment-filter" type="button" data-filter="review" aria-pressed="false">Needs Review</button>
                        </div>
                    </header>
                    <div class="comment-list" id="comment-list">
                        <article class="comment" data-comment-id="1402" data-type="positive">
                            <div class="comment-avatar">JD</div>
                            <div class="comment-content">
                                <header class="comment-heading">
                                    <div>
                                        <strong>Rajesh Kumar</strong>
                                        <small>Today, 2:15 PM • Order #1402</small>
                                    </div>
                                    <span class="rating-stars">5/5</span>
                                </header>
                                <p class="comment-text">"Food was fantastic and came out super fast. The new ordering system at the table is a game changer for lunch breaks!"</p>
                                <div class="reply-area">
                                    <button class="reply-toggle" type="button">Reply</button>
                                    <form class="reply-form" hidden>
                                        <textarea required placeholder="Write a response..." aria-label="Write a response to Rajesh Kumar"></textarea>
                                        <div class="reply-actions">
                                            <button class="cancel-reply" type="button">Cancel</button>
                                            <button class="send-reply" type="submit">Send Reply</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </article>
                        <article class="comment" data-comment-id="1298" data-type="review">
                            <div class="comment-avatar">SW</div>
                            <div class="comment-content">
                                <header class="comment-heading">
                                    <div>
                                        <strong>Priya S.</strong>
                                        <small>Yesterday, 7:30 PM • Order #1298</small>
                                    </div>
                                    <span class="rating-stars">5/5</span>
                                </header>
                                <p class="comment-text">"Waited over 25 minutes for a simple salad. When it arrived, they forgot the dressing on the side as requested."</p>
                                <div class="reply-area">
                                    <button class="reply-toggle" type="button">Reply</button>
                                    <form class="reply-form" hidden>
                                        <textarea required placeholder="Write a response..." aria-label="Write a response to Priya S."></textarea>
                                        <div class="reply-actions">
                                            <button class="cancel-reply" type="button">Cancel</button>
                                            <button class="send-reply" type="submit">Send Reply</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </article>
                        <article class="comment" data-comment-id="1204" data-type="positive">
                            <div class="comment-avatar">MR</div>
                            <div class="comment-content">
                                <header class="comment-heading">
                                    <div>
                                        <strong>Amit R.</strong>
                                        <small>Yesterday, 1:15 PM • Order #1204</small>
                                    </div>
                                    <span class="rating-stars">5/5</span>
                                </header>
                                <p class="comment-text">"Good overall, consistent quality. Just wish there were more vegan options on the seasonal menu."</p>
                                <div class="reply-area">
                                    <button class="reply-toggle" type="button">Reply</button>
                                    <form class="reply-form" hidden>
                                        <textarea required placeholder="Write a response..." aria-label="Write a response to Amit R."></textarea>
                                        <div class="reply-actions">
                                            <button class="cancel-reply" type="button">Cancel</button>
                                            <button class="send-reply" type="submit">Send Reply</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </article>
                    </div>
                </section>
            </section>
            <p class="feedback-message" id="feedback-message" role="status" aria-live="polite"></p>
        </main>
    </div>

    <script>
        const rangeData = {
            7: { rating: "4.6", feedback: "342", labels: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"], values: [28, 42, 38, 55, 48, 90, 62] },
            30: { rating: "4.5", feedback: "1,286", labels: ["Week 1", "Week 2", "Week 3", "Week 4"], values: [50, 68, 58, 85] },
            90: { rating: "4.4", feedback: "3,602", labels: ["Month 1", "Month 2", "Month 3"], values: [56, 72, 90] }
        };
        let chartInterval = "daily";
        let commentFilter = "all";
        const replyStorageKey = "quickserveFeedbackReplies";
        const savedReplies = localStorage.getItem(replyStorageKey);
        const feedbackReplies = savedReplies === null ? {} : JSON.parse(savedReplies);
        if (!feedbackReplies || Array.isArray(feedbackReplies) || typeof feedbackReplies !== "object") {
            throw new TypeError("Saved feedback replies are invalid.");
        }

        document.querySelectorAll(".comment").forEach(comment => {
            const response = feedbackReplies[comment.dataset.commentId];
            if (response) {
                const reply = document.createElement("p");
                reply.className = "reply-message";
                reply.textContent = `Your reply: ${response}`;
                comment.querySelector(".reply-area").append(reply);
            }
        });

        function renderChart() {
            const range = rangeData[document.getElementById("date-range").value];
            let labels = range.labels;
            let values = range.values;
            if (chartInterval === "weekly" && labels.length > 4) {
                labels = ["Week 1", "Week 2", "Week 3", "Week 4"];
                values = [38, 60, 55, 86];
            }
            const columns = document.getElementById("chart-columns");
            const labelRow = document.getElementById("chart-labels");
            columns.replaceChildren();
            labelRow.replaceChildren();
            values.forEach((value, index) => {
                const column = document.createElement("span");
                column.className = `chart-bar${value === Math.max(...values) ? " peak" : ""}`;
                column.style.height = `${value}%`;
                column.setAttribute("aria-label", `${labels[index]}: ${value} feedback responses`);
                columns.append(column);
                const label = document.createElement("span");
                label.textContent = labels[index];
                labelRow.append(label);
            });
        }

        function updateCommentFilter() {
            document.querySelectorAll(".comment").forEach(comment => {
                comment.hidden = commentFilter !== "all" && comment.dataset.type !== commentFilter;
            });
        }

        document.getElementById("date-range").addEventListener("change", event => {
            const range = rangeData[event.target.value];
            document.getElementById("average-rating").textContent = range.rating;
            document.getElementById("total-feedback").textContent = range.feedback;
            renderChart();
        });

        document.querySelectorAll(".chart-tab").forEach(tab => {
            tab.addEventListener("click", () => {
                document.querySelector(".chart-tab.active").classList.remove("active");
                document.querySelector(".chart-tab[aria-pressed='true']").setAttribute("aria-pressed", "false");
                tab.classList.add("active");
                tab.setAttribute("aria-pressed", "true");
                chartInterval = tab.dataset.interval;
                renderChart();
            });
        });

        document.querySelectorAll(".comment-filter").forEach(button => {
            button.addEventListener("click", () => {
                document.querySelector(".comment-filter.active").classList.remove("active");
                document.querySelector(".comment-filter[aria-pressed='true']").setAttribute("aria-pressed", "false");
                button.classList.add("active");
                button.setAttribute("aria-pressed", "true");
                commentFilter = button.dataset.filter;
                updateCommentFilter();
            });
        });

        document.querySelectorAll(".comment").forEach(comment => {
            const replyToggle = comment.querySelector(".reply-toggle");
            const replyForm = comment.querySelector(".reply-form");
            const responseBox = replyForm.querySelector("textarea");
            replyToggle.addEventListener("click", () => {
                replyForm.hidden = false;
                replyToggle.hidden = true;
                responseBox.focus();
            });
            comment.querySelector(".cancel-reply").addEventListener("click", () => {
                responseBox.value = "";
                replyForm.hidden = true;
                replyToggle.hidden = false;
            });
            replyForm.addEventListener("submit", event => {
                event.preventDefault();
                const response = responseBox.value.trim();
                if (!response) return;
                const reply = document.createElement("p");
                reply.className = "reply-message";
                reply.textContent = `Your reply: ${response}`;
                comment.querySelector(".reply-area").append(reply);
                feedbackReplies[comment.dataset.commentId] = response;
                localStorage.setItem(replyStorageKey, JSON.stringify(feedbackReplies));
                replyForm.hidden = true;
                replyToggle.hidden = false;
                responseBox.value = "";
                document.getElementById("feedback-message").textContent = "Reply sent.";
            });
        });

        document.getElementById("export-button").addEventListener("click", () => {
            const rows = [["Customer", "Date", "Order", "Rating", "Comment"]];
            document.querySelectorAll(".comment").forEach(comment => {
                const heading = comment.querySelector(".comment-heading");
                const details = heading.querySelector("small").textContent.split("•");
                const customer = heading.querySelector("strong").textContent;
                const rating = comment.querySelector(".rating-stars").textContent.match(/\d+/)?.[0] ?? "";
                const text = comment.querySelector(".comment-text").textContent;
                rows.push([customer, details[0].trim(), details[1].trim(), `${rating}/5`, text]);
            });
            const csv = rows.map(row => row.map(value => `"${String(value).replace(/"/g, '""')}"`).join(",")).join("\r\n");
            const url = URL.createObjectURL(new Blob([csv], { type: "text/csv;charset=utf-8" }));
            const download = document.createElement("a");
            download.href = url;
            download.download = "quickserve-feedback.csv";
            document.body.append(download);
            download.click();
            download.remove();
            window.setTimeout(() => URL.revokeObjectURL(url), 1000);
        });

        renderChart();
    </script>
</body>
</html>
