require "test_helper"

class PublisherTest < ActiveSupport::TestCase
  test 'publisher name presence validation' do
    publisher = Publisher.new
    publisher.name = nil

    assert_not publisher.valid?
  end
end
