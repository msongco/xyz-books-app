# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

authors = [
  { first_name: "Joel", last_name: "Hartse"},
  { first_name: "Hannah", last_name: "Templer", middle_name: "P." },
  { first_name: "Marguerite", last_name: "Duras", middle_name: "Z." },
  { first_name: "Kingsley", last_name: "Amis"},
  { first_name: "Fannie", last_name: "Flagg", middle_name: "Peters" },
  { first_name: "Camille", last_name: "Paglia", middle_name: "Byron" },
  { first_name: "Rainer", last_name: "Rilke", middle_name: "Steel" }
]

puts "\n -- creating authors table -- \n"
if Author.count == 0
  authors.each do |author|
    Author.create!(author)
  end
end
puts "\n -- authors created -- \n"

publishers = [
  { name: "Paste Magazine"},
  { name: "Publishers Weekly"},
  { name: "Graywolf Press"},
  { name: "McSweeney's"}
]

puts "\n -- creating publishers table -- \n"
if Publisher.count == 0
  publishers.each do |publisher|
    Publisher.create!(publisher)
  end
end
puts "\n -- publishers created -- \n"

books = [
  {
    details: { title: "American Elf", list_price: 1000, isbn_13: "978-1-891830-85-3", publication_year: 2004, edition: "Book 2", publisher: Publisher.find_by_name("Paste Magazine") },
    authors: { names: [Author.find_by_first_name_and_last_name("Joel", "Hartse"), Author.find_by_first_name_and_last_name("Hannah", "Templer"), Author.find_by_first_name_and_last_name("Marguerite", "Duras")] }
  },
  {
    details: { title: "Cosmoknights", list_price: 2000, isbn_13: "978-1-60309-454-2", publication_year: 2019, edition: "Book 1", publisher: Publisher.find_by_name("Publishers Weekly") },
    authors: { names: [Author.find_by_first_name_and_last_name("Kingsley", "Amis")] }
  },
  {
    details: { title: "Essex County", list_price: 500, isbn_13: "978-1-60309-038-4", publication_year: 1990, publisher: Publisher.find_by_name("Graywolf Press") },
    authors: { names: [Author.find_by_first_name_and_last_name("Kingsley", "Amis")]}
  },
  {
    details: { title: "Hey, Mister (Vol 1)", list_price: 1200, isbn_13: "978-1-891830-02-0", publication_year: 2000, edition: "After School Special", publisher: Publisher.find_by_name("Graywolf Press") },
    authors: { names: [Author.find_by_first_name_and_last_name("Hannah", "Templer"), Author.find_by_first_name_and_last_name("Fannie","Flagg"), Author.find_by_first_name_and_last_name("Camille","Paglia") ] }
  },
  {
    details: { title: "The Underwater Welder", list_price: 3000, isbn_13: "978-1-60309-398-9", publication_year: 2022, publisher: Publisher.find_by_name("McSweeney's") },
    authors: { names: [Author.find_by_first_name_and_last_name("Rainer","Rilke")] }
  }
]

puts "\n -- creating books table -- \n"
if Book.count == 0
  books.each do |book|
    new_book = Book.new(book[:details])
    book_authors = book[:authors][:names]

    book_authors.each do |b_author|
      new_book.authors << b_author
    end
    new_book.save!
  end
end
puts "\n -- books created -- \n"
