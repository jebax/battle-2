describe Battle do

  feature 'homepage' do
    scenario 'user sees text on the homepage' do
      visit '/'
      expect(page).to have_content('Hello Battle')
    end
  end

end
