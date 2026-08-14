const MOVIE_CARD_SELECTOR = "[data-movie-card]";
const SELECTED_CLASS = "border-green-600";

let selectedIndex = 0;

document.addEventListener("keydown", (event) => {
  const openModal = document.querySelector("dialog[open]");

  if (openModal) {
    handleModalNavigation(event, openModal);
    return;
  }

  handleMovieNavigation(event);
});

function handleMovieNavigation(event) {
  const movieCards = [...document.querySelectorAll(MOVIE_CARD_SELECTOR)];

  if (!movieCards.length) return;

  const currentIndex = movieCards.findIndex((card) =>
    card.classList.contains(SELECTED_CLASS),
  );

  if (currentIndex >= 0) {
    selectedIndex = currentIndex;
  }

  switch (event.key) {
    case "ArrowRight":
      event.preventDefault();
      moveSelection(movieCards, selectedIndex + 1);
      break;

    case "ArrowLeft":
      event.preventDefault();
      moveSelection(movieCards, selectedIndex - 1);
      break;

    case "ArrowDown":
      event.preventDefault();
      moveSelection(movieCards, selectedIndex + getColumns(movieCards[0]));
      break;

    case "ArrowUp":
      event.preventDefault();
      moveSelection(movieCards, selectedIndex - getColumns(movieCards[0]));
      break;

    case "Enter":
      event.preventDefault();
      window.location.href = movieCards[selectedIndex].dataset.movieUrl;
      break;

    case " ":
      event.preventDefault();

      const button = movieCards[selectedIndex].querySelector(
        "[data-movie-viewed-button]",
      );

      button?.click();
      break;
  }
}

function handleModalNavigation(event, modal) {
  const buttons = [...modal.querySelectorAll("[data-modal-option]")];

  if (!buttons.length) return;

  let currentIndex = buttons.findIndex((button) =>
    button.classList.contains("ring-2"),
  );

  if (currentIndex < 0) {
    currentIndex = 0;
    selectModalButton(buttons, currentIndex);
  }

  switch (event.key) {
    case "ArrowRight":
    case "ArrowDown":
      event.preventDefault();
      selectModalButton(buttons, (currentIndex + 1) % buttons.length);
      break;

    case "ArrowLeft":
    case "ArrowUp":
      event.preventDefault();
      selectModalButton(
        buttons,
        (currentIndex - 1 + buttons.length) % buttons.length,
      );
      break;

    case "Enter":
      event.preventDefault();
      buttons[currentIndex].click();
      break;

    case "Escape":
      modal.close();
      break;
  }
}

function selectModalButton(buttons, index) {
  buttons.forEach((button) => {
    button.classList.remove("ring-2");
  });

  buttons[index].classList.add("ring-2");
}

function moveSelection(movieCards, index) {
  if (index < 0 || index >= movieCards.length) return;

  movieCards.forEach((card) => {
    card.classList.remove(SELECTED_CLASS);
  });

  const card = movieCards[index];

  card.classList.add(SELECTED_CLASS);
  card.scrollIntoView({
    behavior: "smooth",
    block: "center",
  });

  selectedIndex = index;
}

function getColumns(card) {
  const grid = card.closest(".grid");

  return getComputedStyle(grid).gridTemplateColumns.split(" ").length;
}
