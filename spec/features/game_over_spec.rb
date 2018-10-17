feature "game over" do
  scenario "player 2 loses" do
    sign_in_and_play
    19.times { click_button('attack_button') }
    expect(page).to have_content("James wins!")
  end
end
