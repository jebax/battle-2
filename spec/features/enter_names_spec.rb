describe Battle do
  feature 'entering names' do
    scenario 'user fills in their name on the homepage then sees it on screen' do
      sign_in_and_play
      expect(page).to have_content("James vs Joel")
    end
  end
end
