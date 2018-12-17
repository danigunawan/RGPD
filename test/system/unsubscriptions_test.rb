require "application_system_test_case"

class UnsubscriptionsTest < ApplicationSystemTestCase
  setup do
    @unsubscription = unsubscriptions(:one)
  end

  test "visiting the index" do
    visit unsubscriptions_url
    assert_selector "h1", text: "Unsubscriptions"
  end

  test "creating a Unsubscription" do
    visit unsubscriptions_url
    click_on "New Unsubscription"

    click_on "Create Unsubscription"

    assert_text "Unsubscription was successfully created"
    click_on "Back"
  end

  test "updating a Unsubscription" do
    visit unsubscriptions_url
    click_on "Edit", match: :first

    click_on "Update Unsubscription"

    assert_text "Unsubscription was successfully updated"
    click_on "Back"
  end

  test "destroying a Unsubscription" do
    visit unsubscriptions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Unsubscription was successfully destroyed"
  end
end
