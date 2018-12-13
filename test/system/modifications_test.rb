require "application_system_test_case"

class ModificationsTest < ApplicationSystemTestCase
  setup do
    @modification = modifications(:one)
  end

  test "visiting the index" do
    visit modifications_url
    assert_selector "h1", text: "Modifications"
  end

  test "creating a Modification" do
    visit modifications_url
    click_on "New Modification"

    fill_in "Address", with: @modification.address
    fill_in "City", with: @modification.city
    fill_in "Email", with: @modification.email
    fill_in "Name", with: @modification.name
    fill_in "Phone", with: @modification.phone
    fill_in "String", with: @modification.string
    fill_in "Surname", with: @modification.surname
    fill_in "Zipcode", with: @modification.zipcode
    click_on "Create Modification"

    assert_text "Modification was successfully created"
    click_on "Back"
  end

  test "updating a Modification" do
    visit modifications_url
    click_on "Edit", match: :first

    fill_in "Address", with: @modification.address
    fill_in "City", with: @modification.city
    fill_in "Email", with: @modification.email
    fill_in "Name", with: @modification.name
    fill_in "Phone", with: @modification.phone
    fill_in "String", with: @modification.string
    fill_in "Surname", with: @modification.surname
    fill_in "Zipcode", with: @modification.zipcode
    click_on "Update Modification"

    assert_text "Modification was successfully updated"
    click_on "Back"
  end

  test "destroying a Modification" do
    visit modifications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Modification was successfully destroyed"
  end
end
