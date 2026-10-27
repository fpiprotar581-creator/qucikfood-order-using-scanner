<%@ Page Language="VB" AutoEventWireup="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Super Admin Dashboard - QuickServe Portal</title>
    <link rel="stylesheet" href="../css/superadmin.css">
</head>
<body>
    <div class="admin-container">
        <!-- Sidebar Navigation -->
        <aside class="sidebar">
            <div class="brand-logo">
                <div class="brand-text">
                    <h2>QuickServe<br>Portal</h2>
                    <p>Admin Console</p>
                </div>
            </div>

            <nav class="nav-menu">
                <a class="nav-link active" href="#dashboard" aria-current="page">Dashboard</a>
                <a class="nav-link" href="#restaurants">Restaurants</a>
                <a class="nav-link" href="#metrics">Users &amp; Analytics</a>
            </nav>

            <div class="sidebar-footer">
                <a class="upgrade-btn" href="index.aspx#portals">Workspace Options</a>
                <a href="index.aspx" class="footer-link">Back to Home</a>
                <a href="login.aspx" class="footer-link logout">Logout</a>
            </div>
        </aside>

        <!-- Main Content -->
        <main class="main-content" id="dashboard">
            <!-- Header -->
            <header class="dashboard-header">
                <div class="header-top">
                    <div>
                        <h1>Super Admin Dashboard</h1>
                        <p>Manage sample platform records. Changes are saved in this browser demo.</p>
                    </div>
                    <div class="header-actions">
                        <button class="new-restaurant-btn" id="openAddRestaurant" type="button">New Restaurant</button>
                    </div>
                </div>
            </header>

            <!-- Metrics Cards -->
            <section class="metrics-section" id="metrics" aria-label="Platform metrics">
                <div class="metric-card">
                    <div class="metric-content">
                        <p class="metric-label">Total Restaurants</p>
                        <p class="metric-value" id="totalRestaurants">1,248</p>
                    </div>
                    <div class="metric-change positive" id="restaurantChange">Current records</div>
                </div>

                <div class="metric-card">
                    <div class="metric-content">
                        <p class="metric-label">Restaurant Owners</p>
                        <p class="metric-value" id="totalUsers">84.2K</p>
                    </div>
                    <div class="metric-change positive">Unique owners</div>
                </div>

                <div class="metric-card">
                    <div class="metric-content">
                        <p class="metric-label">Monthly Platform Revenue</p>
                        <p class="metric-value" id="platformRevenue">&#8377;2.4M</p>
                    </div>
                    <div class="metric-change positive">Monthly recurring</div>
                </div>
            </section>

            <!-- Restaurant Registry Section -->
            <section class="registry-section" id="restaurants">
                <div class="registry-header">
                    <h2>Restaurant Registry</h2>
                    <div class="search-filter-bar">
                        <label class="search-box">
                            <span class="visually-hidden">Search restaurants</span>
                            <input type="search" id="searchRestaurants" placeholder="Search restaurants, IDs..." class="search-input">
                        </label>
                        <label class="filter-label">
                            <span class="visually-hidden">Filter by status</span>
                            <select class="filter-btn" id="statusFilter" aria-label="Filter restaurants by status">
                                <option value="all">All statuses</option>
                                <option value="Active">Active</option>
                                <option value="Pending Review">Pending Review</option>
                                <option value="Suspended">Suspended</option>
                            </select>
                        </label>
                    </div>
                </div>

                <!-- Restaurant Table -->
                <div class="table-wrapper">
                    <table class="restaurants-table">
                        <thead>
                            <tr>
                                <th>Restaurant Name</th>
                                <th>Owner / ID</th>
                                <th>Plan</th>
                                <th>MRR</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody id="restaurantTableBody">
                            <!-- Populated by JavaScript -->
                        </tbody>
                    </table>
                </div>

                <!-- Pagination -->
                <div class="pagination">
                    <button class="page-btn" id="previousPage" type="button">Previous</button>
                    <span id="pageNumbers" class="page-numbers" aria-label="Page numbers"></span>
                    <button class="page-btn" id="nextPage" type="button">Next</button>
                </div>

                <p class="pagination-info" id="entriesInfo" aria-live="polite"></p>
            </section>
        </main>
    </div>

    <!-- Add Restaurant Modal -->
    <div class="modal" id="addRestaurantModal" role="dialog" aria-modal="true" aria-labelledby="modalTitle" aria-hidden="true">
        <div class="modal-content">
            <div class="modal-header">
                <h2 id="modalTitle">Add New Restaurant</h2>
                <button class="modal-close" id="closeModal" type="button">Close dialog</button>
            </div>
            <form id="addRestaurantForm">
                <div class="form-group">
                    <label for="restName">Restaurant Name *</label>
                    <input type="text" id="restName" placeholder="Enter restaurant name" required>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="ownerName">Owner Name *</label>
                        <input type="text" id="ownerName" placeholder="Enter owner name" required>
                    </div>
                    <div class="form-group">
                        <label for="ownerID">Owner ID *</label>
                        <input type="text" id="ownerID" placeholder="e.g., #QS-0821" required>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="location">Location *</label>
                        <input type="text" id="location" placeholder="City, State" required>
                    </div>
                    <div class="form-group">
                        <label for="plan">Plan *</label>
                        <select id="plan" required>
                            <option value="">Select Plan</option>
                            <option value="Standard">Standard</option>
                            <option value="Enterprise">Enterprise</option>
                            <option value="Premium">Premium</option>
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="mrr">MRR (Monthly Recurring Revenue) *</label>
                        <input type="number" id="mrr" placeholder="499" min="0" step="0.01" inputmode="decimal" required>
                    </div>
                    <div class="form-group">
                        <label for="status">Status *</label>
                        <select id="status" required>
                            <option value="">Select Status</option>
                            <option value="Active">Active</option>
                            <option value="Pending Review">Pending Review</option>
                            <option value="Suspended">Suspended</option>
                        </select>
                    </div>
                </div>

                <div class="modal-actions">
                    <button type="button" class="btn-cancel" id="cancelModal">Cancel</button>
                    <button type="submit" class="btn-submit" id="submitRestaurant">Add Restaurant</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Modal Overlay -->
    <div class="modal-overlay" id="modalOverlay"></div>

    <script>
        const sampleRestaurants = [
            { name: "Sakura Sushi", location: "New York, NY", owner: "Kenji Sato", id: "QS-0821", plan: "Enterprise", mrr: 899, status: "Active" },
            { name: "The Burger Joint", location: "Austin, TX", owner: "Sarah Jenkins", id: "QS-0642", plan: "Standard", mrr: 199, status: "Pending Review" },
            { name: "Morning Brew", location: "Seattle, WA", owner: "Vikram Sharma", id: "QS-4431", plan: "Premium", mrr: 499, status: "Suspended" }
        ];
        const storageKey = "quickserveSuperAdminRestaurants";
        const savedRestaurants = localStorage.getItem(storageKey);
        const restaurants = savedRestaurants === null ? sampleRestaurants : JSON.parse(savedRestaurants);
        if (!Array.isArray(restaurants)) throw new TypeError("Saved restaurant data is invalid.");
        const pageSize = 10;
        const form = document.getElementById("addRestaurantForm");
        const modal = document.getElementById("addRestaurantModal");
        const modalOverlay = document.getElementById("modalOverlay");
        const tableBody = document.getElementById("restaurantTableBody");
        const searchInput = document.getElementById("searchRestaurants");
        const statusFilter = document.getElementById("statusFilter");
        const pageNumbers = document.getElementById("pageNumbers");
        const entriesInfo = document.getElementById("entriesInfo");
        let currentPage = 1;
        let editingId = null;
        let returnFocus = null;

        const currency = amount => `\u20B9${new Intl.NumberFormat("en-IN", { maximumFractionDigits: 2 }).format(amount)}`;
        const saveRestaurants = () => localStorage.setItem(storageKey, JSON.stringify(restaurants));
        const visibleRestaurants = () => {
            const query = searchInput.value.trim().toLocaleLowerCase();
            const selectedStatus = statusFilter.value;
            return restaurants.filter(restaurant => {
                const matchesQuery = [restaurant.name, restaurant.owner, restaurant.id, restaurant.location, restaurant.plan, restaurant.status]
                    .some(value => value.toLocaleLowerCase().includes(query));
                return matchesQuery && (selectedStatus === "all" || restaurant.status === selectedStatus);
            });
        };

        function updateMetrics() {
            document.getElementById("totalRestaurants").textContent = restaurants.length.toLocaleString("en-IN");
            document.getElementById("totalUsers").textContent = new Set(restaurants.map(restaurant => restaurant.owner.trim().toLocaleLowerCase())).size.toLocaleString("en-IN");
            document.getElementById("platformRevenue").textContent = `${currency(restaurants.reduce((total, restaurant) => total + restaurant.mrr, 0))}/mo`;
            document.getElementById("restaurantChange").textContent = `${restaurants.length} sample records`;
        }

        function createCell(className, text) {
            const cell = document.createElement("td");
            if (className) cell.className = className;
            cell.textContent = text;
            return cell;
        }

        function createActionButton(action, label, restaurantId) {
            const button = document.createElement("button");
            button.type = "button";
            button.className = `action-btn ${action}-btn`;
            button.dataset.action = action;
            button.dataset.restaurantId = restaurantId;
            button.textContent = label;
            return button;
        }

        function renderTable() {
            const filtered = visibleRestaurants();
            const pageCount = Math.max(1, Math.ceil(filtered.length / pageSize));
            currentPage = Math.min(currentPage, pageCount);
            const start = (currentPage - 1) * pageSize;
            const currentRows = filtered.slice(start, start + pageSize);
            tableBody.replaceChildren();

            currentRows.forEach(restaurant => {
                const row = document.createElement("tr");
                const nameCell = document.createElement("td");
                nameCell.className = "rest-name";
                const avatar = document.createElement("span");
                avatar.className = "rest-avatar";
                avatar.textContent = restaurant.name.trim().charAt(0).toLocaleUpperCase();
                const details = document.createElement("div");
                const name = document.createElement("div");
                name.className = "name";
                name.textContent = restaurant.name;
                const location = document.createElement("div");
                location.className = "location";
                location.textContent = restaurant.location;
                details.append(name, location);
                nameCell.append(avatar, details);

                const ownerCell = document.createElement("td");
                const owner = document.createElement("div");
                owner.textContent = restaurant.owner;
                const ownerId = document.createElement("div");
                ownerId.className = "owner-id";
                ownerId.textContent = `#${restaurant.id}`;
                ownerCell.append(owner, ownerId);

                const planCell = document.createElement("td");
                const plan = document.createElement("span");
                plan.className = "plan-badge";
                plan.textContent = restaurant.plan;
                planCell.append(plan);

                const statusCell = document.createElement("td");
                const status = document.createElement("span");
                status.className = `status-badge ${restaurant.status.replace(/\s+/g, "-").toLocaleLowerCase()}`;
                status.textContent = restaurant.status;
                statusCell.append(status);

                const actionsCell = document.createElement("td");
                actionsCell.className = "actions-cell";
                actionsCell.append(
                    createActionButton("view", "View", restaurant.id),
                    createActionButton("edit", "Edit", restaurant.id),
                    createActionButton("delete", "Delete", restaurant.id)
                );
                row.append(nameCell, ownerCell, planCell, createCell("", `${currency(restaurant.mrr)}/mo`), statusCell, actionsCell);
                tableBody.append(row);
            });

            if (currentRows.length === 0) {
                const row = document.createElement("tr");
                const cell = createCell("empty-row", "No restaurants match your search and status filter.");
                cell.colSpan = 6;
                row.append(cell);
                tableBody.append(row);
            }

            renderPagination(filtered.length, pageCount);
        }

        function renderPagination(total, pageCount) {
            pageNumbers.replaceChildren();
            for (let page = 1; page <= pageCount; page += 1) {
                const button = document.createElement("button");
                button.type = "button";
                button.className = `page-btn${page === currentPage ? " active" : ""}`;
                button.textContent = String(page);
                button.setAttribute("aria-label", `Page ${page}`);
                button.setAttribute("aria-current", page === currentPage ? "page" : "false");
                button.addEventListener("click", () => {
                    currentPage = page;
                    renderTable();
                });
                pageNumbers.append(button);
            }

            document.getElementById("previousPage").disabled = currentPage === 1;
            document.getElementById("nextPage").disabled = currentPage === pageCount;
            const first = total === 0 ? 0 : (currentPage - 1) * pageSize + 1;
            const last = Math.min(currentPage * pageSize, total);
            entriesInfo.textContent = `Showing ${first} to ${last} of ${total} matching entries`;
        }

        function updateListing() {
            currentPage = 1;
            renderTable();
        }

        function openModal(mode, restaurant = null) {
            returnFocus = document.activeElement;
            form.reset();
            editingId = mode === "edit" ? restaurant.id : null;
            const readOnly = mode === "view";
            document.getElementById("modalTitle").textContent = readOnly ? restaurant.name : mode === "edit" ? "Edit Restaurant" : "Add New Restaurant";
            document.getElementById("submitRestaurant").hidden = readOnly;
            document.getElementById("submitRestaurant").textContent = mode === "edit" ? "Save Changes" : "Add Restaurant";
            for (const field of form.querySelectorAll("input, select")) field.disabled = readOnly;
            if (restaurant) {
                document.getElementById("restName").value = restaurant.name;
                document.getElementById("ownerName").value = restaurant.owner;
                document.getElementById("ownerID").value = restaurant.id;
                document.getElementById("location").value = restaurant.location;
                document.getElementById("plan").value = restaurant.plan;
                document.getElementById("mrr").value = String(restaurant.mrr);
                document.getElementById("status").value = restaurant.status;
            }
            modal.classList.add("active");
            modalOverlay.classList.add("active");
            modal.setAttribute("aria-hidden", "false");
            document.getElementById("closeModal").focus();
            if (readOnly) document.getElementById("cancelModal").textContent = "Close";
            else document.getElementById("cancelModal").textContent = "Cancel";
        }

        function closeModal() {
            modal.classList.remove("active");
            modalOverlay.classList.remove("active");
            modal.setAttribute("aria-hidden", "true");
            form.reset();
            for (const field of form.querySelectorAll("input, select")) field.disabled = false;
            document.getElementById("submitRestaurant").hidden = false;
            document.getElementById("cancelModal").textContent = "Cancel";
            editingId = null;
            if (returnFocus instanceof HTMLElement) returnFocus.focus();
        }

        document.getElementById("openAddRestaurant").addEventListener("click", () => openModal("add"));
        document.getElementById("closeModal").addEventListener("click", closeModal);
        document.getElementById("cancelModal").addEventListener("click", closeModal);
        modalOverlay.addEventListener("click", closeModal);
        document.addEventListener("keydown", event => {
            if (!modal.classList.contains("active")) return;
            if (event.key === "Escape") {
                closeModal();
                return;
            }
            if (event.key === "Tab") {
                const focusable = [...modal.querySelectorAll('button:not([disabled]):not([hidden]), input:not([disabled]), select:not([disabled])')];
                const first = focusable[0];
                const last = focusable[focusable.length - 1];
                if (event.shiftKey && document.activeElement === first) {
                    event.preventDefault();
                    last.focus();
                } else if (!event.shiftKey && document.activeElement === last) {
                    event.preventDefault();
                    first.focus();
                }
            }
        });
        form.addEventListener("submit", event => {
            event.preventDefault();
            if (!form.reportValidity()) return;
            const id = document.getElementById("ownerID").value.trim().replace(/^#/, "");
            if (restaurants.some(restaurant => restaurant.id.toLocaleLowerCase() === id.toLocaleLowerCase() && restaurant.id !== editingId)) {
                const idField = document.getElementById("ownerID");
                idField.setCustomValidity("This restaurant ID is already in use.");
                idField.reportValidity();
                idField.addEventListener("input", () => idField.setCustomValidity(""), { once: true });
                return;
            }
            const restaurant = {
                name: document.getElementById("restName").value.trim(),
                owner: document.getElementById("ownerName").value.trim(),
                id,
                location: document.getElementById("location").value.trim(),
                plan: document.getElementById("plan").value,
                mrr: Number(document.getElementById("mrr").value),
                status: document.getElementById("status").value
            };
            if (editingId) {
                const index = restaurants.findIndex(item => item.id === editingId);
                if (index < 0) throw new Error("The restaurant being edited no longer exists.");
                restaurants[index] = restaurant;
            } else {
                restaurants.push(restaurant);
            }
            saveRestaurants();
            closeModal();
            updateMetrics();
            updateListing();
        });

        tableBody.addEventListener("click", event => {
            const button = event.target.closest("button[data-action]");
            if (!button) return;
            const restaurant = restaurants.find(item => item.id === button.dataset.restaurantId);
            if (!restaurant) return;
            if (button.dataset.action === "view" || button.dataset.action === "edit") {
                openModal(button.dataset.action, restaurant);
            } else if (button.dataset.action === "delete" && window.confirm(`Delete ${restaurant.name}? This cannot be undone.`)) {
                restaurants.splice(restaurants.indexOf(restaurant), 1);
                saveRestaurants();
                updateMetrics();
                updateListing();
            }
        });

        searchInput.addEventListener("input", updateListing);
        statusFilter.addEventListener("change", updateListing);
        document.getElementById("previousPage").addEventListener("click", () => {
            if (currentPage > 1) {
                currentPage -= 1;
                renderTable();
            }
        });
        document.getElementById("nextPage").addEventListener("click", () => {
            const pageCount = Math.max(1, Math.ceil(visibleRestaurants().length / pageSize));
            if (currentPage < pageCount) {
                currentPage += 1;
                renderTable();
            }
        });
        document.querySelector(".nav-menu").addEventListener("click", event => {
            const link = event.target.closest(".nav-link[href^='#']");
            if (!link) return;
            document.querySelectorAll(".nav-menu .nav-link").forEach(item => {
                item.classList.toggle("active", item === link);
                if (item === link) item.setAttribute("aria-current", "page");
                else item.removeAttribute("aria-current");
            });
        });

        updateMetrics();
        renderTable();
    </script>
</body>
</html>
