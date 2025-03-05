import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["subcategoryContainer"]

  connect() {
    console.log("Controller de categorias conectado!")
  }

  loadSubcategories(event) {
    const categoryId = event.target.value
    if (!categoryId) return

    console.log(`Carregando subcategorias para a categoria ID: ${categoryId}`)

    fetch(`/categorias/${categoryId}/subcategorias`)
      .then(response => response.json())
      .then(data => {
        console.log("Subcategorias recebidas:", data)

        this.subcategoryContainerTarget.innerHTML = ""

        if (data.length > 0) {
          const select = document.createElement("select")
          select.classList.add("form-control")
          select.innerHTML = `<option value="">Selecione uma subcategoria</option>`

          data.forEach(subcategory => {
            const option = document.createElement("option")
            option.value = subcategory.id
            option.textContent = subcategory.name
            select.appendChild(option)
          })

          this.subcategoryContainerTarget.appendChild(select)
        } else {
          this.subcategoryContainerTarget.innerHTML = "<p>Nenhuma subcategoria encontrada.</p>"
        }
      })
      .catch(error => console.error("Erro ao carregar subcategorias:", error))
  }
}
