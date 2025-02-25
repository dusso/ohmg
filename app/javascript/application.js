import "@hotwired/turbo-rails";  // Turbo deve ser carregado primeiro
import { Popper } from "popper";  // Importando Popper (se necessário)
import * as bootstrap from "bootstrap";  // Importando o Bootstrap
import "controllers";  // Importação dos controladores Stimulus (se necessário)

document.addEventListener("turbo:load", () => {
  // Reinicializar os componentes do Bootstrap após o Turbo carregar a página
  const bootstrapElements = document.querySelectorAll('[data-bs-toggle="dropdown"], [data-bs-toggle="modal"], [data-bs-toggle="tooltip"], [data-bs-toggle="popover"]');
  
  bootstrapElements.forEach(element => {
    const type = element.getAttribute('data-bs-toggle');
    if (type === "dropdown") {
      new bootstrap.Dropdown(element);
    } else if (type === "modal") {
      new bootstrap.Modal(element);
    } else if (type === "tooltip") {
      new bootstrap.Tooltip(element);
    } else if (type === "popover") {
      new bootstrap.Popover(element);
    }
  });
});
