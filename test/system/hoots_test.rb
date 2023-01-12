require "application_system_test_case"

class HootsTest < ApplicationSystemTestCase
  setup do
    @hoot = hoots(:one)
  end

  test "visiting the index" do
    visit hoots_url
    assert_selector "h1", text: "Hoots"
  end

  test "should create hoot" do
    visit hoots_url
    click_on "New hoot"

    fill_in "Body", with: @hoot.body
    fill_in "User", with: @hoot.user_id
    click_on "Create Hoot"

    assert_text "Hoot was successfully created"
    click_on "Back"
  end

  test "should update Hoot" do
    visit hoot_url(@hoot)
    click_on "Edit this hoot", match: :first

    fill_in "Body", with: @hoot.body
    fill_in "User", with: @hoot.user_id
    click_on "Update Hoot"

    assert_text "Hoot was successfully updated"
    click_on "Back"
  end

  test "should destroy Hoot" do
    visit hoot_url(@hoot)
    click_on "Destroy this hoot", match: :first

    assert_text "Hoot was successfully destroyed"
  end
end
