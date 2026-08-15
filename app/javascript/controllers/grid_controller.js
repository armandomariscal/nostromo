import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["grid", "button"];

  connect() {
    console.log("GRID CONNECTED");
  }

  select(event) {
    const columns = event.currentTarget.dataset.columns;

    this.gridTarget.style.gridTemplateColumns = `repeat(${columns}, minmax(0, 1fr))`;

    this.element.classList.toggle("compact-grid", columns === "7");

    this.buttonTargets.forEach((button) => {
      const active = button.dataset.columns === columns;

      button.classList.toggle("bg-zinc-800", active);
      button.classList.toggle("text-zinc-100", active);
      button.classList.toggle("text-zinc-400", !active);
    });
  }
}
