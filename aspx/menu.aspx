<%@ Page Language="VB" AutoEventWireup="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu Management | QuickServe Portal</title>
    <link rel="stylesheet" href="../css/menu.css">
</head>
<body>
    <div class="portal-layout">
        <aside class="sidebar">
            <a class="portal-brand" href="dashboard.aspx">
                <strong>QuickServe</strong>
                <small>Management Console</small>
            </a>
            <nav class="sidebar-nav" aria-label="Portal navigation">
                <a class="nav-link" href="dashboard.aspx">Dashboard</a>
                <a class="nav-link active" href="menu.aspx" aria-current="page">Menu Management</a>
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

        <main class="menu-main">
            <header class="page-heading">
                <div>
                    <h1>Menu Items</h1>
                    <p>Manage sample dishes, prices, descriptions, and photos. Changes are saved in this browser.</p>
                </div>
                <button class="add-button" id="add-item" type="button">Add New Item</button>
            </header>

            <section class="menu-toolbar" aria-label="Menu filters">
                <div class="category-tabs" role="group" aria-label="Filter menu category">
                    <button class="category-tab selected" type="button" data-category="all" aria-pressed="true">All Items</button>
                    <button class="category-tab" type="button" data-category="Appetizers" aria-pressed="false">Appetizers</button>
                    <button class="category-tab" type="button" data-category="Mains" aria-pressed="false">Mains</button>
                    <button class="category-tab" type="button" data-category="Drinks" aria-pressed="false">Drinks</button>
                </div>
                <label class="search-box">
                    <input id="menu-search" type="search" placeholder="Search menu..." aria-label="Search menu">
                </label>
            </section>

            <section class="menu-grid" id="menu-grid" aria-label="Menu items">
                <article class="menu-card" data-category="Mains" data-name="Classic Burger">
                    <div class="image-wrap">
                        <img src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&amp;fit=crop&amp;w=500&amp;h=430&amp;q=85" alt="Classic burger with fries">
                        <span class="category-label">Mains</span>
                        <span class="editing-overlay">Editing Mode</span>
                        <label class="photo-picker">
                            Choose Photo
                            <input class="photo-input" type="file" accept="image/*" aria-label="Choose menu item photo">
                        </label>
                    </div>
                    <div class="item-content">
                        <div class="item-heading">
                            <h2>Classic Burger</h2>
                            <span class="price">&#8377;14.50</span>
                        </div>
                        <p class="description">Angus beef patty, cheddar, lettuce, tomato, house sauce on brioche.</p>
                        <div class="edit-fields">
                            <input class="edit-name" aria-label="Item name" value="Classic Burger">
                            <input class="edit-price" aria-label="Item price" value="&#8377;14.50">
                            <textarea class="edit-description" aria-label="Item description">Angus beef patty, cheddar, lettuce, tomato, house sauce on brioche.</textarea>
                        </div>
                        <div class="item-footer">
                            <span class="item-status">Active</span>
                            <button class="quick-edit" type="button">Quick Edit</button>
                            <button class="delete-item" type="button">Delete</button>
                            <div class="edit-actions">
                                <button class="cancel-edit" type="button">Cancel</button>
                                <button class="save-edit" type="button">Save Changes</button>
                            </div>
                        </div>
                    </div>
                </article>

                <article class="menu-card" data-category="Appetizers" data-name="Caesar Salad">
                    <div class="image-wrap">
                        <img src="https://images.unsplash.com/photo-1546793665-c74683f339c1?auto=format&amp;fit=crop&amp;w=500&amp;h=430&amp;q=85" alt="Caesar salad with croutons">
                        <span class="category-label">Appetizers</span>
                        <span class="editing-overlay">Editing Mode</span>
                        <label class="photo-picker">
                            Choose Photo
                            <input class="photo-input" type="file" accept="image/*" aria-label="Choose menu item photo">
                        </label>
                    </div>
                    <div class="item-content">
                        <div class="item-heading">
                            <h2>Caesar Salad</h2>
                            <span class="price">&#8377;9.00</span>
                        </div>
                        <p class="description">Romaine lettuce, croutons, parmesan cheese, house-made Caesar dressing.</p>
                        <div class="edit-fields">
                            <input class="edit-name" aria-label="Item name" value="Caesar Salad">
                            <input class="edit-price" aria-label="Item price" value="&#8377;9.00">
                            <textarea class="edit-description" aria-label="Item description">Romaine lettuce, croutons, parmesan cheese, house-made Caesar dressing.</textarea>
                        </div>
                        <div class="item-footer">
                            <span class="item-status">Active</span>
                            <button class="quick-edit" type="button">Quick Edit</button>
                            <button class="delete-item" type="button">Delete</button>
                            <div class="edit-actions">
                                <button class="cancel-edit" type="button">Cancel</button>
                                <button class="save-edit" type="button">Save Changes</button>
                            </div>
                        </div>
                    </div>
                </article>

                <article class="menu-card" data-category="Drinks" data-name="Old Fashioned">
                    <div class="image-wrap">
                        <img src="https://images.unsplash.com/photo-1470337458703-46ad1756a187?auto=format&amp;fit=crop&amp;w=500&amp;h=430&amp;q=85" alt="Old fashioned cocktail">
                        <span class="category-label">Drinks</span>
                        <span class="editing-overlay">Editing Mode</span>
                        <label class="photo-picker">
                            Choose Photo
                            <input class="photo-input" type="file" accept="image/*" aria-label="Choose menu item photo">
                        </label>
                    </div>
                    <div class="item-content">
                        <div class="item-heading">
                            <h2>Old Fashioned</h2>
                            <span class="price">&#8377;12.00</span>
                        </div>
                        <p class="description">Bourbon, simple syrup, angostura bitters, orange peel garnish.</p>
                        <div class="edit-fields">
                            <input class="edit-name" aria-label="Item name" value="Old Fashioned">
                            <input class="edit-price" aria-label="Item price" value="&#8377;12.00">
                            <textarea class="edit-description" aria-label="Item description">Bourbon, simple syrup, angostura bitters, orange peel garnish.</textarea>
                        </div>
                        <div class="item-footer">
                            <span class="item-status">Active</span>
                            <button class="quick-edit" type="button">Quick Edit</button>
                            <button class="delete-item" type="button">Delete</button>
                            <div class="edit-actions">
                                <button class="cancel-edit" type="button">Cancel</button>
                                <button class="save-edit" type="button">Save Changes</button>
                            </div>
                        </div>
                    </div>
                </article>

                <article class="menu-card" data-category="Mains" data-name="Margherita Pizza">
                    <div class="image-wrap">
                        <img src="https://images.unsplash.com/photo-1579751626657-72bc17010498?auto=format&amp;fit=crop&amp;w=500&amp;h=430&amp;q=85" alt="Margherita pizza">
                        <span class="category-label">Mains</span>
                        <span class="editing-overlay">Editing Mode</span>
                        <label class="photo-picker">
                            Choose Photo
                            <input class="photo-input" type="file" accept="image/*" aria-label="Choose menu item photo">
                        </label>
                    </div>
                    <div class="item-content">
                        <div class="item-heading">
                            <h2>Margherita Pizza</h2>
                            <span class="price">&#8377;16.00</span>
                        </div>
                        <p class="description">San Marzano tomato sauce, fresh mozzarella, basil, extra virgin olive oil.</p>
                        <div class="edit-fields">
                            <input class="edit-name" aria-label="Item name" value="Margherita Pizza">
                            <input class="edit-price" aria-label="Item price" value="&#8377;16.00">
                            <textarea class="edit-description" aria-label="Item description">San Marzano tomato sauce, fresh mozzarella, basil, extra virgin olive oil.</textarea>
                        </div>
                        <div class="item-footer">
                            <span class="item-status draft-status">Draft</span>
                            <button class="quick-edit" type="button">Quick Edit</button>
                            <button class="delete-item" type="button">Delete</button>
                            <div class="edit-actions">
                                <button class="cancel-edit" type="button">Cancel</button>
                                <button class="save-edit" type="button">Save Changes</button>
                            </div>
                        </div>
                    </div>
                </article>
            </section>
            <p class="menu-message" id="menu-message" role="status" aria-live="polite"></p>
        </main>
    </div>
    <script>
        let cards = [...document.querySelectorAll(".menu-card")];
        const search = document.getElementById("menu-search");
        const menuGrid = document.getElementById("menu-grid");
        const placeholderImage = cards[0].querySelector(".image-wrap img").src;
        const cardTemplate = cards[0].cloneNode(true);
        const menuMessage = document.getElementById("menu-message");
        const storageKey = "quickserveMenuItems";
        let selectedCategory = "all";

        function saveMenu() {
            const items = cards.map(card => ({
                category: card.dataset.category,
                name: card.querySelector(".edit-name").value.trim(),
                price: card.querySelector(".edit-price").value.trim(),
                description: card.querySelector(".edit-description").value.trim(),
                image: card.querySelector(".image-wrap img").src,
                draft: card.querySelector(".item-status").classList.contains("draft-status")
            }));
            localStorage.setItem(storageKey, JSON.stringify(items));
        }

        function buildCard(item) {
            const card = cardTemplate.cloneNode(true);
            card.dataset.category = item.category;
            card.dataset.name = item.name;
            card.classList.remove("is-editing");
            const image = card.querySelector(".image-wrap img");
            image.src = item.image || placeholderImage;
            image.alt = `${item.name} photo`;
            card.querySelector(".category-label").textContent = item.category;
            card.querySelector(".item-heading h2").textContent = item.name;
            card.querySelector(".item-heading .price").textContent = item.price;
            card.querySelector(".description").textContent = item.description;
            card.querySelector(".edit-name").value = item.name;
            card.querySelector(".edit-price").value = item.price;
            card.querySelector(".edit-description").value = item.description;
            card.querySelector(".item-status").textContent = item.draft ? "Draft" : "Active";
            card.querySelector(".item-status").classList.toggle("draft-status", item.draft);
            return card;
        }

        const storedItems = localStorage.getItem(storageKey);
        if (storedItems) {
            const items = JSON.parse(storedItems);
            if (!Array.isArray(items)) throw new TypeError("Saved menu data is invalid.");
            menuGrid.replaceChildren();
            cards = items.map(buildCard);
            menuGrid.append(...cards);
        }

        function filterCards() {
            const query = search.value.trim().toLowerCase();
            cards.forEach(card => {
                const matchesCategory = selectedCategory === "all" || card.dataset.category === selectedCategory;
                const matchesSearch = card.dataset.name.toLowerCase().includes(query);
                card.hidden = !matchesCategory || !matchesSearch;
            });
            menuMessage.textContent = cards.some(card => !card.hidden) ? "" : "No menu items match this search or category.";
        }

        document.querySelectorAll(".category-tab").forEach(tab => {
            tab.addEventListener("click", () => {
                document.querySelector(".category-tab.selected").classList.remove("selected");
                tab.classList.add("selected");
                document.querySelectorAll(".category-tab").forEach(item => item.setAttribute("aria-pressed", String(item === tab)));
                selectedCategory = tab.dataset.category;
                filterCards();
            });
        });
        search.addEventListener("input", filterCards);

        function setupCard(card, isNew = false) {
            const nameInput = card.querySelector(".edit-name");
            const priceInput = card.querySelector(".edit-price");
            const descriptionInput = card.querySelector(".edit-description");
            const image = card.querySelector(".image-wrap img");
            const photoInput = card.querySelector(".photo-input");
            let originalValues = [nameInput.value, priceInput.value, descriptionInput.value];
            let originalImage = image.src;

            card.querySelector(".quick-edit").addEventListener("click", () => {
                originalValues = [nameInput.value, priceInput.value, descriptionInput.value];
                originalImage = image.src;
                card.classList.add("is-editing");
                nameInput.focus();
            });
            card.querySelector(".delete-item").addEventListener("click", () => {
                const name = nameInput.value.trim() || "this draft";
                if (!window.confirm(`Delete ${name} from the menu?`)) return;
                card.remove();
                cards = cards.filter(item => item !== card);
                saveMenu();
                filterCards();
                menuMessage.textContent = `${name} deleted.`;
            });
            photoInput.addEventListener("change", () => {
                const file = photoInput.files[0];
                if (!file || !file.type.startsWith("image/")) {
                    photoInput.value = "";
                    menuMessage.textContent = "Choose an image file to update the menu photo.";
                    return;
                }
                const reader = new FileReader();
                reader.addEventListener("load", () => {
                    if (typeof reader.result === "string") {
                        image.src = reader.result;
                        menuMessage.textContent = "Photo selected. Save changes to keep it in this browser.";
                    }
                });
                reader.readAsDataURL(file);
            });
            card.querySelector(".cancel-edit").addEventListener("click", () => {
                if (isNew) {
                    card.remove();
                    cards.splice(cards.indexOf(card), 1);
                    filterCards();
                    return;
                }
                [nameInput.value, priceInput.value, descriptionInput.value] = originalValues;
                image.src = originalImage;
                photoInput.value = "";
                card.classList.remove("is-editing");
                menuMessage.textContent = "Changes cancelled.";
            });
            card.querySelector(".save-edit").addEventListener("click", () => {
                const name = nameInput.value.trim();
                const price = Number(priceInput.value.replace(/[\u20B9,\s]/g, ""));
                if (!name || !Number.isFinite(price) || price < 0) {
                    menuMessage.textContent = "Enter an item name and a valid non-negative price.";
                    (name ? priceInput : nameInput).focus();
                    return;
                }
                card.querySelector(".item-heading h2").textContent = name;
                priceInput.value = `\u20B9${price.toFixed(2)}`;
                card.querySelector(".item-heading .price").textContent = priceInput.value;
                card.querySelector(".description").textContent = descriptionInput.value.trim();
                image.alt = `${name} photo`;
                card.dataset.name = name;
                originalValues = [nameInput.value, priceInput.value, descriptionInput.value];
                originalImage = image.src;
                photoInput.value = "";
                isNew = false;
                card.querySelector(".item-status").textContent = "Active";
                card.querySelector(".item-status").classList.remove("draft-status");
                card.classList.remove("is-editing");
                saveMenu();
                filterCards();
                menuMessage.textContent = `${name} saved.`;
            });
        }

        cards.forEach(card => setupCard(card));

        document.getElementById("add-item").addEventListener("click", () => {
            const card = buildCard({ category: "Mains", name: "", price: "", description: "", image: placeholderImage, draft: true });
            const category = selectedCategory === "all" ? "Mains" : selectedCategory;
            card.dataset.category = category;
            card.dataset.name = "";
            card.hidden = false;
            card.classList.add("is-editing");
            card.querySelector(".image-wrap img").alt = "New menu item photo";
            card.querySelector(".category-label").textContent = category;
            card.querySelector(".edit-name").required = true;
            card.querySelector(".edit-price").required = true;
            menuGrid.append(card);
            cards.push(card);
            setupCard(card, true);
            card.querySelector(".edit-name").focus();
            search.value = "";
            filterCards();
        });
    </script>
</body>
</html>
