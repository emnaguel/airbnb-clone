require "application_system_test_case"

class BoatsTest < ApplicationSystemTestCase
  setup do
    @boat = boats(:one)
  end

  test "visiting the index" do
    visit boats_url
    assert_selector "h1", text: "Boats"
  end

  test "creating a Boat" do
    visit boats_url
    click_on "New Boat"

    fill_in "Address", with: @boat.address
    fill_in "Description", with: @boat.description
    fill_in "Name", with: @boat.name
    fill_in "Stars", with: @boat.stars
    fill_in "User", with: @boat.user_id
    click_on "Create Boat"

    assert_text "Boat was successfully created"
    click_on "Back"
  end

  test "updating a Boat" do
    visit boats_url
    click_on "Edit", match: :first

    fill_in "Address", with: @boat.address
    fill_in "Description", with: @boat.description
    fill_in "Name", with: @boat.name
    fill_in "Stars", with: @boat.stars
    fill_in "User", with: @boat.user_id
    click_on "Update Boat"

    assert_text "Boat was successfully updated"
    click_on "Back"
  end

  test "destroying a Boat" do
    visit boats_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Boat was successfully destroyed"
  end
end
