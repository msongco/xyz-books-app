require "test_helper"

class AuthorTest < ActiveSupport::TestCase
  test 'author first name presence validation' do
    author = Author.new
    author.first_name = nil
    author.last_name = "Cruz"

    assert_not author.valid?
  end

  test 'author last name presence validation' do
    author = Author.new
    author.first_name = "Lexy"
    author.last_name = nil

    assert_not author.valid?
  end

  test 'author first name and last name presence validation' do
    author = Author.new
    author.first_name = "Lexy"
    author.last_name = "Cruz"

    assert author.valid?
  end
end
