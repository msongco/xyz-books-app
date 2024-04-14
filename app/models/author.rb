class Author < ApplicationRecord

  validates :first_name, presence: true
  validates :last_name, presence: true
  has_and_belongs_to_many :books

  def full_name
    [first_name, middle_name, last_name].compact.join(" ")
  end
end
