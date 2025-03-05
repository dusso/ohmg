require "csv"

csv_file = Rails.root.join("db", "seeds", "category_fields.csv")

CSV.foreach(csv_file, headers: true) do |row|
  category = Category.find_by(name: row["category"])
  next unless category

  CategoryField.create!(
    category:       category,
    name:           row["field_name"],
    input_type:     row["input_type"],
    options:        row["options"] ? row["options"].split(",") : [],
    required:       row["required"] == "TRUE",
    placeholder:    row["placeholder"],
    order:          row["order"].to_i
  )
end

puts "✅ Campos específicos importados com sucesso!"
