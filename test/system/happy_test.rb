require "application_system_test_case"

class HappyTest < ApplicationSystemTestCase
  setup do
    # @comment = comments(:one)
  end

  test "visiting the dashbord" do
    visit '/'
    assert_selector "h1", text: "Welcome!"
    Office.create!(building: "room42", floor: 1, number: 2)
    visit offices_path
    assert_selector "td", text: 'room42'

    assert_equal Office.where(building: 'AVZ').count, 0

    click_on "Neues Büro"

    fill_in "Building", with: "AVZ"
    fill_in "Floor", with: "1"
    fill_in "Number", with: "44"
    click_on "Create Office"

    assert_selector "td", text: 'AVZ'
    assert_equal Office.where(building: 'AVZ').count, 1

    assert_selector "p", text: 'Es gibt 2 Büros!'

    10.times do |i|
      click_on "Neues Büro"

      fill_in "Building", with: "AVZ"
      fill_in "Floor", with: "1"
      fill_in "Number", with: i+1
      click_on "Create Office"
      assert_selector "p", text: "Es gibt #{3+i} Büros!"
    end
    assert_selector "p", text: "Es gibt 12 Büros!"
    assert_equal 12, Office.count
  end


end

