require "application_system_test_case"

class SupportticketsTest < ApplicationSystemTestCase
  setup do
    @supportticket = supporttickets(:one)
  end

  test "visiting the index" do
    visit supporttickets_url
    assert_selector "h1", text: "Supporttickets"
  end

  test "creating a Supportticket" do
    visit supporttickets_url
    click_on "New Supportticket"

    fill_in "Closed date", with: @supportticket.closed_date
    fill_in "Description", with: @supportticket.description
    fill_in "Open date", with: @supportticket.open_date
    fill_in "Status", with: @supportticket.status
    fill_in "Title", with: @supportticket.title
    fill_in "User", with: @supportticket.user_id
    click_on "Create Supportticket"

    assert_text "Supportticket was successfully created"
    click_on "Back"
  end

  test "updating a Supportticket" do
    visit supporttickets_url
    click_on "Edit", match: :first

    fill_in "Closed date", with: @supportticket.closed_date
    fill_in "Description", with: @supportticket.description
    fill_in "Open date", with: @supportticket.open_date
    fill_in "Status", with: @supportticket.status
    fill_in "Title", with: @supportticket.title
    fill_in "User", with: @supportticket.user_id
    click_on "Update Supportticket"

    assert_text "Supportticket was successfully updated"
    click_on "Back"
  end

  test "destroying a Supportticket" do
    visit supporttickets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Supportticket was successfully destroyed"
  end
end
