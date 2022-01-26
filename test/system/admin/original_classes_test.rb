require "application_system_test_case"

class Admin::OriginalClassesTest < ApplicationSystemTestCase
  setup do
    @admin_original_class = admin_original_classes(:one)
  end

  test "visiting the index" do
    visit admin_original_classes_url
    assert_selector "h1", text: "Admin/Original Classes"
  end

  test "creating a Original class" do
    visit admin_original_classes_url
    click_on "New Admin/Original Class"

    fill_in "Code", with: @admin_original_class.code
    fill_in "Name", with: @admin_original_class.name
    click_on "Create Original class"

    assert_text "Original class was successfully created"
    click_on "Back"
  end

  test "updating a Original class" do
    visit admin_original_classes_url
    click_on "Edit", match: :first

    fill_in "Code", with: @admin_original_class.code
    fill_in "Name", with: @admin_original_class.name
    click_on "Update Original class"

    assert_text "Original class was successfully updated"
    click_on "Back"
  end

  test "destroying a Original class" do
    visit admin_original_classes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Original class was successfully destroyed"
  end
end
