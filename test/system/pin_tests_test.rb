require "application_system_test_case"

class PinTestsTest < ApplicationSystemTestCase
  test 'create pin' do
    visit new_user_path
    fill_in 'Email', with: 'alexandre@epfl.ch'
    click_on 'Log in', match: :first

    visit new_pin_path
    fill_in 'Title', with: 'Create pin test'
    fill_in 'Image url', with: 'http://fpoimg.com/255x170'
    click_on 'Create', match: :first
    find('.card').hover
    assert page.has_content? 'Create pin test'
  end

  test 'validation for pin without a title' do
    visit new_user_path
    fill_in 'Email', with: 'alexandre@epfl.ch'
    click_on 'Log in', match: :first

    visit new_pin_path
    click_on 'Create', match: :first

    assert page.has_content? "Title can't be blank"
  end
  #
  test 'This text is much too long' do
    visit new_user_path
    fill_in 'Email', with: 'alexandre@epfl.ch'
    click_on 'Log in', match: :first

    visit new_pin_path
    fill_in 'Title', with: 'Create pin test'
    fill_in 'Tag', with: 'This text is much too long but i want to use it'
    click_on 'Create', match: :first

    assert page.has_content? 'Tag is too long (maximum is 30 characters)'
  end

  test 'Edit pin' do
    user = User.new email: 'alexandre@epfl.ch'
    pin = Pin.new title: 'Edit pin', user: user
    pin.save!

    visit new_user_path
    fill_in 'Email', with: 'alexandre@epfl.ch'
    click_on 'Log in', match: :first

    visit pins_path
    find('.card').hover
    assert page.has_content? 'Edit pin'

    visit edit_pin_path(pin)
    fill_in 'Title', with: 'This is the first title'
    fill_in 'Tag', with: 'First, Title, Edit'
    click_on 'Update', match: :first

    visit pins_path
    find('.card').hover
    assert page.has_content? 'This is the first title'
    assert page.has_content? 'First, Title, Edit'
  end
end
