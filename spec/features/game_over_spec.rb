feature "game over" do
  scenario "player 2 loses" do
    sign_in_and_play
    allow(Kernel).to receive(:rand).with(10).and_return 10
    19.times { click_button('attack_button') }
    expect(page).to have_content("James wins!")
  end
end
