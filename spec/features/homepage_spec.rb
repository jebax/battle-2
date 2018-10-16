describe Battle do
  feature 'homepage' do
    scenario 'user is asked to enter name on the homepage' do
      visit '/'
      expect(page).to have_content("Enter your name player 1:\nEnter your name player 2:")
    end
  end
end
