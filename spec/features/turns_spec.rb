feature "switching turns" do
  scenario "attacks alternate once" do
    sign_in_and_play
    click_button "Attack Joel!"
    click_button "Attack James!"
    expect(page).to have_content("James\nHP: 90 / 100")
  end
end
