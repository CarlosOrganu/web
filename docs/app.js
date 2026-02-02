// app.js

// Menú móvil
const navbtn = document.getElementById("navbtn");
const nav = document.getElementById("nav");

if (navbtn && nav) {
  navbtn.addEventListener("click", () => {
    nav.classList.toggle("open");
  });

  // Cierra menú al clicar un link
  nav.querySelectorAll("a").forEach(a => {
    a.addEventListener("click", () => nav.classList.remove("open"));
  });
}

// Accordion (Book / Vídeos)
document.querySelectorAll(".accordion").forEach(acc => {
  const btn = acc.querySelector(".accordion-title");
  const contentId = btn?.getAttribute("aria-controls");
  const content = contentId ? document.getElementById(contentId) : null;

  if (!btn || !content) return;

  btn.addEventListener("click", () => {
    const isOpen = acc.classList.toggle("open");
    btn.setAttribute("aria-expanded", isOpen ? "true" : "false");
    content.hidden = !isOpen;
  });
});

// Lightbox (Book)
const lightbox = document.getElementById("lightbox");
const lightboxImg = document.getElementById("lightboxImg");
const lightboxClose = document.getElementById("lightboxClose");

function openLightbox(src, alt = "") {
  if (!lightbox || !lightboxImg) return;
  lightboxImg.src = src;
  lightboxImg.alt = alt || "Imagen ampliada";
  lightbox.classList.add("show");
  lightbox.setAttribute("aria-hidden", "false");
}

function closeLightbox() {
  if (!lightbox || !lightboxImg) return;
  lightbox.classList.remove("show");
  lightbox.setAttribute("aria-hidden", "true");
  lightboxImg.src = "";
}

document.querySelectorAll(".card img").forEach(img => {
  img.addEventListener("click", (e) => {
    e.preventDefault();
    openLightbox(img.src, img.alt);
  });
});

if (lightboxClose) {
  lightboxClose.addEventListener("click", closeLightbox);
}

if (lightbox) {
  lightbox.addEventListener("click", (e) => {
    if (e.target === lightbox) closeLightbox();
  });
}

document.addEventListener("keydown", (e) => {
  if (e.key === "Escape") closeLightbox();
});
