describe Battle do

  feature 'homepage' do
    before do
      visit '/'
    end

    scenario 'user is asked to enter name on the homepage' do
      expect(page).to have_content('Enter your name:')
    end

    scenario 'user fills in their name on the homepage then sees it on screen' do
      fill_in "name", with: "James"
      click_button 'Submit'
      expect(page).to have_content("Welcome James")
    end
  end
end
