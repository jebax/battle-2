describe Battle do

  feature 'homepage' do
    before do
      visit '/'
    end

    scenario 'user is asked to enter name on the homepage' do
      expect(page).to have_content("Enter your name player 1:\nEnter your name player 2:")
    end

    scenario 'user fills in their name on the homepage then sees it on screen' do
      fill_in "name1", with: "James"
      fill_in "name2", with: "Joel"
      click_button 'Submit'
      expect(page).to have_content("James vs Joel")
    end
  end
end
