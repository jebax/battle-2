feature "switching turns" do
  scenario "attacks alternate once" do
    sign_in_and_play
    2.times { click_button('attack_button')}
    expect(page).to have_content("James\nHP: 90 / 100")
  end
end
