require "test_helper"

class BookTest < ActiveSupport::TestCase
  test 'book title presence validation' do
    book = Book.new
    book.title = nil
    isbn_13 = "979-8-888302-56-9"
    list_price = 1500
    publication_year = 2012
    publisher_id = 3

    author = Author.new
    book.authors << author

    assert_not book.valid?
  end

  test 'book isbn_13 presence validation' do
    book = Book.new
    book.title = "Myths and Legends of Ancient Greece and Rome"
    isbn_13 = nil
    list_price = 1500
    publication_year = 2012
    publisher_id = 3

    author = Author.new
    book.authors << author

    assert_not book.valid?
  end

  test 'book list_price presence validation' do
    book = Book.new
    book.title = "Myths and Legends of Ancient Greece and Rome"
    isbn_13 = "979-8-888302-56-9"
    list_price = nil
    publication_year = 2012
    publisher_id = 3

    author = Author.new
    book.authors << author

    assert_not book.valid?
  end

  test 'book publication_year presence validation' do
    book = Book.new
    book.title = "Myths and Legends of Ancient Greece and Rome"
    isbn_13 = "979-8-888302-56-9"
    list_price = 1500
    publication_year = nil
    publisher_id = 3

    author = Author.new
    book.authors << author

    assert_not book.valid?
  end

  test 'book publisher presence validation' do
    book = Book.new
    book.title = "Myths and Legends of Ancient Greece and Rome"
    isbn_13 = "979-8-888302-56-9"
    list_price = 1500
    publication_year = 2012
    publisher_id = nil

    author = Author.new
    book.authors << author

    assert_not book.valid?
  end

  test 'book should have at least one author' do
    book = Book.new
    book.title = "Myths and Legends of Ancient Greece and Rome"
    isbn_13 = "979-8-888302-56-9"
    list_price = 1500
    publication_year = 2012
    publisher_id = 3

    assert_not book.valid?
  end
end
