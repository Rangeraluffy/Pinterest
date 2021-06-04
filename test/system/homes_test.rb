require "application_system_test_case"

class HomesTest < ApplicationSystemTestCase
  test 'visiting the index' do
    visit '/'
    assert_selector 'h1', text: 'FOUND YOUR IDEA'
  end
end
