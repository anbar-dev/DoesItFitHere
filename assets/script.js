const menuButton = document.querySelector("[data-menu-button]");
const navLinks = document.querySelector("[data-nav-links]");

if (menuButton && navLinks) {
  menuButton.addEventListener("click", () => {
    const isOpen = navLinks.classList.toggle("open");
    menuButton.setAttribute("aria-expanded", String(isOpen));
    menuButton.setAttribute("aria-label", isOpen ? "Close menu" : "Open menu");
  });
}

const choices = document.querySelectorAll("[data-choice]");
const resultTitle = document.querySelector("[data-result-title]");
const resultCopy = document.querySelector("[data-result-copy]");
const resultLink = document.querySelector("[data-result-link]");

const finderResults = {
  width: {
    title: "Start with a narrow-kitchen guide.",
    copy: "Width is the first filter for slim trash cans, rolling carts, shallow pantry shelves, and tight counter storage.",
    href: "guides/narrow-kitchen/narrow-trash-can-under-10-inches/"
  },
  pipes: {
    title: "Start with an under-sink guide.",
    copy: "Pipe position, valves, cabinet hinges, disposal size, and door swing decide which organizer can actually fit.",
    href: "guides/under-sink-cabinets/under-sink-organizer-around-pipes/"
  },
  height: {
    title: "Start with a low-clearance guide.",
    copy: "Under-bed bins, over-toilet shelves, and drying racks all need real usable height, not just a rough guess.",
    href: "guides/low-clearance-storage/under-bed-storage-bins-low-clearance/"
  },
  door: {
    title: "Check a door-clearance guide first.",
    copy: "Door swing, hinges, lid paths, and handle clearance can decide whether a product works after installation.",
    href: "guides/narrow-kitchen/trash-can-under-sink-door-clearance/"
  }
};

choices.forEach((choice) => {
  choice.addEventListener("click", () => {
    choices.forEach((item) => item.classList.remove("active"));
    choice.classList.add("active");
    const result = finderResults[choice.dataset.choice];
    if (!result) return;
    resultTitle.textContent = result.title;
    resultCopy.textContent = result.copy;
    resultLink.href = result.href;
  });
});

document.querySelectorAll('a[href*="amazon.com"]').forEach((link) => {
  link.rel = "sponsored nofollow noopener";
  link.target = "_blank";
});

document.querySelectorAll(".product-media img").forEach((image) => {
  const showFallback = () => {
    if (image.naturalWidth > 2 && image.naturalHeight > 2) return;
    image.classList.add("is-missing");
    const media = image.closest(".product-media");
    if (!media || media.querySelector(".image-fallback")) return;
    const fallback = document.createElement("span");
    fallback.className = "image-fallback";
    fallback.textContent = "Image unavailable";
    media.appendChild(fallback);
  };

  if (image.complete) showFallback();
  image.addEventListener("load", showFallback);
  image.addEventListener("error", showFallback);
});

document.querySelectorAll("[data-static-form]").forEach((form) => {
  form.addEventListener("submit", (event) => {
    event.preventDefault();
    const message = form.querySelector("[data-form-message]");
    if (message) message.hidden = false;
  });
});
