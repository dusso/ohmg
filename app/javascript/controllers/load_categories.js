document.addEventListener("turbo:load", function () { // Turbo para recarregar corretamente ao navegar
  const categorySelect = document.getElementById("category-select");

  if (!categorySelect) return; // Sai se o select não existir na página

  fetch("/categories")
    .then(response => response.json())
    .then(categories => {
      categorySelect.innerHTML = ""; // Limpa as opções anteriores

      categories.forEach(category => {
        let option = document.createElement("option");
        option.value = category.id;
        option.textContent = category.name;
        categorySelect.appendChild(option);
      });
    })
    .catch(error => console.error("Erro ao carregar categorias:", error));
});
