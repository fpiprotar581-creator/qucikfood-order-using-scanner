<%@ Page Language="VB" AutoEventWireup="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Tracking | QuickServe Portal</title>
    <link rel="stylesheet" href="../css/orders.css">
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
                <a class="nav-link active" href="orders.aspx" aria-current="page">Order Tracking</a>
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

        <main class="orders-main">
            <header class="page-heading">
                <div>
                    <h1>Incoming Orders</h1>
                    <p>Review sample tickets, update quantities, and track kitchen handoffs.</p>
                </div>
                <div class="toolbar-actions">
                    <label class="order-search">
                        <input id="order-search" type="search" placeholder="Search order ID or table..." aria-label="Search order ID or table">
                    </label>
                    <button class="filter-button" id="filter-toggle" type="button" aria-expanded="false">Filters</button>
                    <button class="add-order-button" id="add-order" type="button">Add Order</button>
                    <label class="filter-select" id="filter-panel" hidden>
                        <span class="visually-hidden">Filter orders</span>
                        <select id="order-filter" aria-label="Filter orders">
                            <option value="all">All orders</option>
                            <option value="New Order">New orders</option>
                            <option value="Sent to Kitchen">Sent to kitchen</option>
                        </select>
                    </label>
                </div>
            </header>

            <div class="orders-workspace">
                <section class="queue-panel" aria-labelledby="queue-title">
                    <div class="queue-heading">
                        <h2 id="queue-title">Pending Queue</h2>
                        <span class="new-count" id="new-count">2 New</span>
                    </div>
                    <div class="queue-list" id="queue-list" aria-live="polite"></div>
                </section>

                <section class="order-details" id="order-details" aria-label="Selected order details">
                    <div class="empty-state" id="empty-state" hidden>No orders match your search.</div>
                    <div id="order-content">
                        <header class="order-header">
                            <div class="order-title-row">
                                <h2 id="detail-table">Table 12</h2>
                                <span class="order-status" id="detail-status">New Order</span>
                            </div>
                            <p class="order-meta">
                                <span>Order ID: <strong id="detail-id">#4092</strong></span>
                                <span>Placed: <strong id="detail-time">13:42 PM</strong></span>
                                <span>Guest: <strong id="detail-guest">Walk-in</strong></span>
                            </p>
                            <p class="payment-line"><strong id="detail-payment">Online Payment Complete</strong></p>
                            <p class="total-line"><span id="detail-total">&#8377;42.50</span> Total</p>
                        </header>
                        <div class="ticket-body">
                            <h3>KITCHEN TICKET DETAILS</h3>
                            <div class="ticket-items" id="ticket-items"></div>
                        </div>
                        <footer class="order-actions">
                            <button class="modify-button" id="modify-order" type="button">Modify Order</button>
                            <div class="decision-actions">
                                <button class="reject-button" id="reject-order" type="button">Reject</button>
                                <button class="kitchen-button" id="send-kitchen" type="button">Send to Kitchen</button>
                            </div>
                        </footer>
                    </div>
                </section>
            </div>
            <p class="action-message" id="action-message" role="status" aria-live="polite"></p>
        </main>
    </div>

    <dialog class="order-dialog" id="order-dialog" aria-labelledby="order-dialog-title">
        <form id="order-form">
            <header class="order-dialog-header">
                <div>
                    <h2 id="order-dialog-title">Add Order</h2>
                    <p>Enter the order details and one or more items.</p>
                </div>
                <button class="dialog-close" id="close-order-dialog" type="button" aria-label="Close">×</button>
            </header>
            <div class="order-form-fields">
                <label>Table
                    <input id="order-table" name="table" type="text" placeholder="Table 01" maxlength="40" required>
                </label>
                <label>Guest
                    <input id="order-guest" name="guest" type="text" placeholder="Walk-in" maxlength="80" required>
                </label>
                <label>Payment
                    <select id="order-payment" name="payment" required>
                        <option value="Online Paid">Online Payment Complete</option>
                        <option value="Cash Pending">Cash Payment Pending</option>
                    </select>
                </label>
            </div>
            <section class="order-item-editor-section" aria-labelledby="order-items-title">
                <div class="order-item-editor-heading">
                    <h3 id="order-items-title">Order items</h3>
                    <button class="add-item-button" id="add-order-item" type="button">Add item</button>
                </div>
                <div class="order-item-editors" id="order-item-editors"></div>
            </section>
            <p class="order-form-error" id="order-form-error" role="alert" hidden></p>
            <footer class="order-dialog-actions">
                <button class="dialog-cancel" id="cancel-order-dialog" type="button">Cancel</button>
                <button class="dialog-save" type="submit">Save Order</button>
            </footer>
        </form>
    </dialog>

    <script>
        const sampleOrders = [
            {
                id: "4092",
                table: "Table 12",
                time: "13:42 PM",
                guest: "Walk-in",
                payment: "Online Payment Complete",
                paymentType: "Online Paid",
                status: "New Order",
                elapsed: "04:22 elapsed",
                items: [
                    { quantity: 2, name: "Classic Smash Burger", notes: "- NO Onions\n- Extra Pickles\n- Allergy: Sesame (Use Brioche)", unitPrice: 14 },
                    { quantity: 1, name: "Truffle Parmesan Fries", notes: "- Sauce on side", unitPrice: 9.5 },
                    { quantity: 2, name: "House Lemonade", notes: "", unitPrice: 2.5 }
                ]
            },
            {
                id: "4093",
                table: "Table 04",
                time: "13:28 PM",
                guest: "Walk-in",
                payment: "Cash Payment Pending",
                paymentType: "Cash Pending",
                status: "New Order",
                elapsed: "01:15 elapsed",
                items: [
                    { quantity: 1, name: "Caesar Salad", notes: "- Dressing on the side", unitPrice: 9 },
                    { quantity: 1, name: "Iced Tea", notes: "", unitPrice: 9 }
                ]
            }
        ];

        const storageKey = "quickserveOrders";
        const savedOrders = localStorage.getItem(storageKey);
        const orders = savedOrders === null ? sampleOrders : JSON.parse(savedOrders);
        if (!Array.isArray(orders)) throw new TypeError("Saved order data is invalid.");
        const saveOrders = () => localStorage.setItem(storageKey, JSON.stringify(orders));
        let selectedOrderId = orders[0]?.id ?? null;
        let orderFilter = "all";
        const queueList = document.getElementById("queue-list");
        const searchInput = document.getElementById("order-search");
        const details = document.getElementById("order-details");
        const orderContent = document.getElementById("order-content");
        const emptyState = document.getElementById("empty-state");
        const actionMessage = document.getElementById("action-message");
        const orderDialog = document.getElementById("order-dialog");
        const orderForm = document.getElementById("order-form");
        const orderItemEditors = document.getElementById("order-item-editors");
        const orderFormError = document.getElementById("order-form-error");
        const currency = amount => `\u20B9${amount.toFixed(2)}`;
        const currentOrder = () => orders.find(order => order.id === selectedOrderId);
        let editingOrderId = null;

        function orderTotal(order) {
            return order.items.reduce((total, item) => total + item.quantity * item.unitPrice, 0);
        }

        function renderQueue() {
            const query = searchInput.value.trim().toLowerCase();
            const visibleOrders = orders.filter(order => {
                const matchesSearch = `${order.id} ${order.table}`.toLowerCase().includes(query);
                const matchesFilter = orderFilter === "all" || order.status === orderFilter;
                return matchesSearch && matchesFilter;
            });

            if (!currentOrder() || !visibleOrders.some(order => order.id === selectedOrderId)) {
                selectedOrderId = visibleOrders[0]?.id ?? null;
            }

            queueList.replaceChildren();
            visibleOrders.forEach(order => {
                const card = document.createElement("button");
                card.type = "button";
                card.className = `queue-card${order.id === selectedOrderId ? " selected" : ""}${order.status === "Sent to Kitchen" ? " sent" : ""}`;
                card.dataset.orderId = order.id;

                const top = document.createElement("span");
                top.className = "queue-card-top";
                const table = document.createElement("span");
                table.textContent = order.table;
                const id = document.createElement("small");
                id.textContent = `#${order.id}`;
                const amount = document.createElement("strong");
                amount.textContent = currency(orderTotal(order));
                top.append(table, id, amount);

                const bottom = document.createElement("span");
                bottom.className = "queue-card-bottom";
                const elapsed = document.createElement("span");
                elapsed.className = order.status === "New Order" ? "elapsed" : "sent-label";
                elapsed.textContent = order.status === "New Order" ? order.elapsed : "Sent to Kitchen";
                const payment = document.createElement("span");
                payment.className = `payment-badge${order.paymentType === "Cash Pending" ? " cash" : " online"}`;
                payment.textContent = order.paymentType;
                bottom.append(elapsed, payment);

                const summary = document.createElement("span");
                summary.className = "queue-summary";
                summary.textContent = order.items.map(item => `${item.quantity}x ${item.name}`).join(", ");
                card.append(top, bottom, summary);
                card.addEventListener("click", () => {
                    selectedOrderId = order.id;
                    actionMessage.textContent = "";
                    renderQueue();
                    renderDetails();
                });
                queueList.append(card);
            });

            document.getElementById("new-count").textContent = `${orders.filter(order => order.status === "New Order").length} New`;
            emptyState.textContent = orders.length ? "No orders match your search or filter." : "No incoming orders.";
            renderDetails();
        }

        function renderDetails() {
            const order = currentOrder();
            const isVisible = order && [...queueList.querySelectorAll(".queue-card")].some(card => card.dataset.orderId === order.id);
            orderContent.hidden = !isVisible;
            emptyState.hidden = Boolean(isVisible);
            if (!isVisible) return;

            document.getElementById("detail-table").textContent = order.table;
            document.getElementById("detail-id").textContent = `#${order.id}`;
            document.getElementById("detail-time").textContent = order.time;
            document.getElementById("detail-guest").textContent = order.guest;
            document.getElementById("detail-payment").textContent = order.payment;
            document.getElementById("detail-total").textContent = currency(orderTotal(order));
            const status = document.getElementById("detail-status");
            status.textContent = order.status === "New Order" ? "New Order" : "Sent to Kitchen";
            status.classList.toggle("sent-status", order.status === "Sent to Kitchen");
            document.getElementById("modify-order").disabled = order.status !== "New Order";
            document.getElementById("reject-order").disabled = order.status !== "New Order";
            const kitchenButton = document.getElementById("send-kitchen");
            kitchenButton.disabled = order.status !== "New Order";
            kitchenButton.textContent = order.status === "New Order" ? "Send to Kitchen" : "Sent to Kitchen";

            const list = document.getElementById("ticket-items");
            list.replaceChildren();
            order.items.forEach(item => {
                const row = document.createElement("article");
                row.className = "ticket-item";

                const quantity = document.createElement("span");
                quantity.textContent = `${item.quantity}x`;

                const itemCopy = document.createElement("div");
                itemCopy.className = "item-copy";
                const name = document.createElement("strong");
                name.textContent = item.name;
                itemCopy.append(name);
                if (item.notes) {
                    const notes = document.createElement("p");
                    notes.className = "item-notes";
                    notes.textContent = item.notes;
                    itemCopy.append(notes);
                }

                const lineTotal = document.createElement("strong");
                lineTotal.className = "line-total";
                lineTotal.textContent = currency(item.quantity * item.unitPrice);
                row.append(quantity, itemCopy, lineTotal);
                list.append(row);
            });
        }

        function addOrderItemEditor(item = { quantity: 1, name: "", notes: "", unitPrice: 0 }) {
            const row = document.createElement("div");
            row.className = "order-item-editor";

            const fields = [
                { key: "name", label: "Item name", type: "text", value: item.name, required: true, maxLength: 80 },
                { key: "quantity", label: "Qty", type: "number", value: item.quantity, required: true, min: 1, max: 99 },
                { key: "unitPrice", label: "Unit price (₹)", type: "number", value: item.unitPrice, required: true, min: 0, step: "0.01" },
                { key: "notes", label: "Notes", type: "text", value: item.notes, maxLength: 200 }
            ];

            fields.forEach(field => {
                const label = document.createElement("label");
                label.textContent = field.label;
                const input = document.createElement("input");
                input.type = field.type;
                input.name = field.key;
                input.value = field.value;
                input.required = Boolean(field.required);
                if (field.min !== undefined) input.min = String(field.min);
                if (field.max !== undefined) input.max = String(field.max);
                if (field.step !== undefined) input.step = field.step;
                if (field.maxLength !== undefined) input.maxLength = field.maxLength;
                label.append(input);
                row.append(label);
            });

            const removeButton = document.createElement("button");
            removeButton.className = "remove-order-item";
            removeButton.type = "button";
            removeButton.textContent = "Remove";
            removeButton.setAttribute("aria-label", `Remove ${item.name || "item"}`);
            removeButton.addEventListener("click", () => row.remove());
            row.append(removeButton);
            orderItemEditors.append(row);
        }

        function openOrderDialog(order = null) {
            editingOrderId = order?.id ?? null;
            orderForm.reset();
            orderItemEditors.replaceChildren();
            orderFormError.hidden = true;
            orderFormError.textContent = "";
            document.getElementById("order-dialog-title").textContent = order ? `Edit Order #${order.id}` : "Add Order";
            document.getElementById("order-table").value = order?.table ?? "";
            document.getElementById("order-guest").value = order?.guest ?? "Walk-in";
            document.getElementById("order-payment").value = order?.paymentType ?? "Online Paid";
            (order?.items ?? [{ quantity: 1, name: "", notes: "", unitPrice: 0 }]).forEach(addOrderItemEditor);
            orderDialog.showModal();
        }

        document.getElementById("add-order").addEventListener("click", () => openOrderDialog());
        document.getElementById("add-order-item").addEventListener("click", () => addOrderItemEditor());
        document.getElementById("close-order-dialog").addEventListener("click", () => orderDialog.close());
        document.getElementById("cancel-order-dialog").addEventListener("click", () => orderDialog.close());
        document.getElementById("modify-order").addEventListener("click", () => {
            const order = currentOrder();
            if (!order) return;
            openOrderDialog(order);
        });

        orderForm.addEventListener("submit", event => {
            event.preventDefault();
            const items = [...orderItemEditors.querySelectorAll(".order-item-editor")].map(row => {
                const values = Object.fromEntries([...row.querySelectorAll("input")].map(input => [input.name, input.value.trim()]));
                return {
                    quantity: Number(values.quantity),
                    name: values.name,
                    notes: values.notes,
                    unitPrice: Number(values.unitPrice)
                };
            });
            if (!items.length) {
                orderFormError.textContent = "Add at least one item to the order.";
                orderFormError.hidden = false;
                return;
            }

            const paymentType = document.getElementById("order-payment").value;
            let order = editingOrderId === null ? null : orders.find(existing => existing.id === editingOrderId);
            if (editingOrderId !== null && !order) {
                throw new Error(`Order #${editingOrderId} could not be found.`);
            }
            if (order) {
                order.table = document.getElementById("order-table").value.trim();
                order.guest = document.getElementById("order-guest").value.trim();
                order.paymentType = paymentType;
                order.payment = paymentType === "Online Paid" ? "Online Payment Complete" : "Cash Payment Pending";
                order.items = items;
            } else {
                let numericId = Math.max(0, ...orders.map(existing => Number(existing.id) || 0)) + 1;
                while (orders.some(existing => existing.id === String(numericId))) numericId++;
                order = {
                    id: String(numericId),
                    table: document.getElementById("order-table").value.trim(),
                    time: new Intl.DateTimeFormat("en-IN", { hour: "2-digit", minute: "2-digit", hour12: true }).format(new Date()),
                    guest: document.getElementById("order-guest").value.trim(),
                    payment: paymentType === "Online Paid" ? "Online Payment Complete" : "Cash Payment Pending",
                    paymentType,
                    status: "New Order",
                    elapsed: "Just now",
                    items
                };
                orders.unshift(order);
            }
            selectedOrderId = order.id;
            orderFilter = "all";
            document.getElementById("order-filter").value = "all";
            searchInput.value = "";
            saveOrders();
            orderDialog.close();
            renderQueue();
            actionMessage.textContent = `Order #${order.id} ${editingOrderId === null ? "added" : "updated"}.`;
        });

        document.getElementById("reject-order").addEventListener("click", () => {
            const order = currentOrder();
            if (!order) return;
            actionMessage.textContent = `Order #${order.id} was rejected.`;
            orders.splice(orders.indexOf(order), 1);
            selectedOrderId = null;
            saveOrders();
            renderQueue();
        });

        document.getElementById("send-kitchen").addEventListener("click", () => {
            const order = currentOrder();
            if (!order) return;
            order.status = "Sent to Kitchen";
            actionMessage.textContent = `Order #${order.id} was sent to the kitchen.`;
            saveOrders();
            renderQueue();
        });

        searchInput.addEventListener("input", renderQueue);
        document.getElementById("filter-toggle").addEventListener("click", event => {
            const panel = document.getElementById("filter-panel");
            panel.hidden = !panel.hidden;
            event.currentTarget.setAttribute("aria-expanded", String(!panel.hidden));
        });
        document.getElementById("order-filter").addEventListener("change", event => {
            orderFilter = event.target.value;
            renderQueue();
        });

        renderQueue();
    </script>
</body>
</html>
