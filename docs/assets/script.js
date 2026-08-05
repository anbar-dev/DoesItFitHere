const menuButton = document.querySelector("[data-menu-button]");
const navLinks = document.querySelector("[data-nav-links]");

if (menuButton && navLinks) {
  menuButton.addEventListener("click", () => {
    const isOpen = navLinks.classList.toggle("open");
    menuButton.setAttribute("aria-expanded", String(isOpen));
  });
}

const choices = document.querySelectorAll("[data-choice]");
const resultTitle = document.querySelector("[data-result-title]");
const resultCopy = document.querySelector("[data-result-copy]");
const resultLink = document.querySelector("[data-result-link]");

const finderResults = {
  width: {
    title: "Start with the Narrow Kitchen category.",
    copy: "Width is the first filter for slim trash cans, rolling carts, shallow pantry shelves, and tight counter storage.",
    href: "guides/narrow-kitchen/"
  },
  pipes: {
    title: "Use Under-Sink & Cabinets.",
    copy: "Pipe position, valves, cabinet hinges, disposal size, and door swing decide which organizer can actually fit.",
    href: "guides/under-sink-cabinets/"
  },
  height: {
    title: "Check Low-Clearance Storage.",
    copy: "Under-bed bins, over-toilet shelves, and drying racks all need real usable height, not just a rough guess.",
    href: "guides/low-clearance-storage/"
  },
  door: {
    title: "Try Vertical Storage or cabinet guides.",
    copy: "Door swing and hook thickness matter for over-door racks, cabinet organizers, and tight entryway storage.",
    href: "guides/vertical-storage/"
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
