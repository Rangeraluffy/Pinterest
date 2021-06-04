require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "get index" do
    get home_index_url
  end
end
