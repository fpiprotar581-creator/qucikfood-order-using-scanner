<%@ Page Language="VB" AutoEventWireup="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restaurant Profile Setup | QuickServe Portal</title>
    <link rel="stylesheet" href="../css/settings.css">
</head>
<body>
    <div class="portal-layout">
        <aside class="sidebar">
            <a class="portal-brand" href="dashboard.aspx">
                <strong>QuickServe Portal</strong>
                <small>Management Console</small>
            </a>
            <nav class="sidebar-nav" aria-label="Portal navigation">
                <a class="nav-link" href="dashboard.aspx">Dashboard</a>
                <a class="nav-link" href="menu.aspx">Menu Management</a>
                <a class="nav-link" href="orders.aspx">Order Tracking</a>
                <a class="nav-link" href="qrmetrics.aspx">QR Metrics</a>
                <a class="nav-link" href="feedback.aspx">Feedback</a>
                <a class="nav-link active" href="settings.aspx" aria-current="page">Settings</a>
            </nav>
            <div class="sidebar-bottom">
                <a class="upgrade-button" href="index.aspx#portals">Workspace Options</a>
                <a class="bottom-link" href="index.aspx">Back to Home</a>
                <a class="bottom-link" href="index.aspx#support">Help Center</a>
                <a class="bottom-link" href="login.aspx">Logout</a>
            </div>
        </aside>

        <main class="settings-main">
            <header class="page-heading">
                <div>
                    <h1>Restaurant Profile Setup</h1>
                    <p>Configure your restaurant details. Profile fields are saved in this browser demo.</p>
                </div>
            </header>

            <form class="settings-form" id="settings-form">
                <section class="photo-upload-section">
                    <div class="upload-area" id="upload-area">
                        <h2>Upload Background Photo</h2>
                        <p>This image will appear on your digital menu and customer portal. (Recommended: 1920×1080px)</p>
                        <input type="file" id="photo-input" accept="image/*" hidden aria-label="Choose background photo">
                        <img class="photo-preview" id="photo-preview" alt="Selected restaurant background preview" hidden>
                        <button class="choose-file-button" type="button" id="choose-file-btn">Choose File</button>
                    </div>
                    <div class="photo-guidelines">
                        <strong>Photo Guidelines</strong>
                        <ul>
                            <li>High resolution (Min: 1080p)</li>
                            <li>Landscape orientation</li>
                            <li>No overlaid text or logos</li>
                            <li>Bright, appetizing lighting</li>
                        </ul>
                    </div>
                    <p class="file-name" id="file-name" hidden>
                        File: <span id="selected-file"></span>
                    </p>
                </section>

                <section class="form-grid">
                    <div class="form-section">
                        <h2>Basic Information</h2>
                        <div class="form-group">
                            <label for="restaurant-name">Restaurant Name</label>
                            <input id="restaurant-name" type="text" placeholder="e.g., The Rustic Fork" required value="The Rustic Fork">
                        </div>
                        <div class="form-group">
                            <label for="business-desc">Business Description</label>
                            <textarea id="business-desc" placeholder="Briefly describe your cuisine, atmosphere, and what makes you unique..." required>Casual dining with farm-to-table ingredients, craft cocktails, and a vibrant atmosphere perfect for families and groups.</textarea>
                        </div>
                    </div>

                    <div class="form-section">
                        <h2>Contact & Location</h2>
                        <div class="form-group">
                            <label for="phone-number">Public Phone Number</label>
                            <input id="phone-number" type="tel" placeholder="(555) 123-4567" required value="(555) 123-4567">
                        </div>
                        <div class="form-group">
                            <label for="public-email">Public Email</label>
                            <input id="public-email" type="email" placeholder="hello@therusticfork.com" required value="hello@therusticfork.com">
                        </div>
                        <div class="form-group">
                            <label for="physical-address">Physical Address</label>
                            <input id="physical-address" type="text" placeholder="123 Main St, City, State, ZIP" required value="123 Main St, Downtown, NY 10001">
                        </div>
                    </div>
                </section>

                <footer class="form-actions">
                    <button class="draft-button" type="button" id="save-draft-btn">Save as Draft</button>
                    <button class="next-button" type="submit">Next: Menu Setup</button>
                </footer>
            </form>
            <p class="status-message" id="status-message" role="status" aria-live="polite"></p>
        </main>
    </div>

    <script>
        const photoInput = document.getElementById("photo-input");
        const chooseFileBtn = document.getElementById("choose-file-btn");
        const uploadArea = document.getElementById("upload-area");
        const fileName = document.getElementById("file-name");
        const selectedFile = document.getElementById("selected-file");
        const settingsForm = document.getElementById("settings-form");
        const saveDraftBtn = document.getElementById("save-draft-btn");
        const statusMessage = document.getElementById("status-message");
        const photoPreview = document.getElementById("photo-preview");
        let selectedPhotoFile = null;
        let selectedPhotoUrl = "";

        const savedProfile = localStorage.getItem("restaurantProfile");
        if (savedProfile) {
            const profile = JSON.parse(savedProfile);
            const fields = {
                "restaurant-name": "restaurantName",
                "business-desc": "businessDesc",
                "phone-number": "phoneNumber",
                "public-email": "publicEmail",
                "physical-address": "physicalAddress"
            };
            for (const [fieldId, key] of Object.entries(fields)) {
                if (typeof profile[key] === "string") document.getElementById(fieldId).value = profile[key];
            }
            if (profile.photoFile) {
                selectedFile.textContent = `${profile.photoFile} (select it again to preview)`;
                fileName.hidden = false;
            }
            statusMessage.textContent = "Saved restaurant profile loaded from this browser.";
        }

        function selectPhoto(file) {
            if (!file.type.startsWith("image/")) {
                statusMessage.textContent = "Choose an image file for the restaurant background.";
                return;
            }
            if (file.size > 2 * 1024 * 1024) {
                statusMessage.textContent = "Choose an image smaller than 2 MB.";
                return;
            }
            selectedPhotoFile = file;
            if (selectedPhotoUrl) URL.revokeObjectURL(selectedPhotoUrl);
            selectedPhotoUrl = URL.createObjectURL(file);
            photoPreview.src = selectedPhotoUrl;
            photoPreview.hidden = false;
            selectedFile.textContent = file.name;
            fileName.hidden = false;
            statusMessage.textContent = `Photo "${file.name}" selected. Save the profile to keep its name.`;
        }

        chooseFileBtn.addEventListener("click", event => {
            event.preventDefault();
            photoInput.click();
        });

        photoInput.addEventListener("change", () => {
            const file = photoInput.files[0];
            if (file) selectPhoto(file);
        });

        uploadArea.addEventListener("dragover", event => {
            event.preventDefault();
            uploadArea.classList.add("dragover");
        });

        uploadArea.addEventListener("dragleave", () => {
            uploadArea.classList.remove("dragover");
        });

        uploadArea.addEventListener("drop", event => {
            event.preventDefault();
            uploadArea.classList.remove("dragover");
            const files = event.dataTransfer.files;
            if (files.length > 0) selectPhoto(files[0]);
        });

        saveDraftBtn.addEventListener("click", () => {
            const formData = {
                restaurantName: document.getElementById("restaurant-name").value,
                businessDesc: document.getElementById("business-desc").value,
                phoneNumber: document.getElementById("phone-number").value,
                publicEmail: document.getElementById("public-email").value,
                physicalAddress: document.getElementById("physical-address").value,
                photoFile: selectedPhotoFile ? selectedPhotoFile.name : null
            };
            localStorage.setItem("restaurantProfile", JSON.stringify(formData));
            statusMessage.textContent = "Profile saved as draft.";
        });

        settingsForm.addEventListener("submit", event => {
            event.preventDefault();
            const restaurantName = document.getElementById("restaurant-name").value.trim();
            const phoneNumber = document.getElementById("phone-number").value.trim();
            const publicEmail = document.getElementById("public-email").value.trim();
            const physicalAddress = document.getElementById("physical-address").value.trim();

            if (!restaurantName || !phoneNumber || !publicEmail || !physicalAddress) {
                statusMessage.textContent = "Please fill in all required fields.";
                return;
            }

            const formData = {
                restaurantName,
                businessDesc: document.getElementById("business-desc").value.trim(),
                phoneNumber,
                publicEmail,
                physicalAddress,
                photoFile: selectedPhotoFile ? selectedPhotoFile.name : null
            };
            localStorage.setItem("restaurantProfile", JSON.stringify(formData));
            statusMessage.textContent = "Profile saved successfully. Proceeding to menu setup...";
            setTimeout(() => {
                window.location.href = "menu.aspx";
            }, 1500);
        });
    </script>
</body>
</html>
