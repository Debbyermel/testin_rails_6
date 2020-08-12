require "application_system_test_case"

class CategotiesTest < ApplicationSystemTestCase
  setup do
    @categoty = categoties(:one)
  end

  test "visiting the index" do
    visit categoties_url
    assert_selector "h1", text: "Categoties"
  end

  test "creating a Categoty" do
    visit categoties_url
    click_on "New Categoty"

    click_on "Create Categoty"

    assert_text "Categoty was successfully created"
    click_on "Back"
  end

  test "updating a Categoty" do
    visit categoties_url
    click_on "Edit", match: :first

    click_on "Update Categoty"

    assert_text "Categoty was successfully updated"
    click_on "Back"
  end

  test "destroying a Categoty" do
    visit categoties_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Categoty was successfully destroyed"
  end
end
