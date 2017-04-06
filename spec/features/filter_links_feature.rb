feature 'filter links' do
before(:each) do
		 Link.create(url: 'www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
     Link.create(url: 'www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
     Link.create(url: 'www.zombo.com', title: 'This is Zombocom', tags: [Tag.first_or_create(name: 'bubbles')])
     Link.create(url: 'www.bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
end
  
  scenario 'I can filter links by tag' do
    visit('/')
    fill_in 'filter', with: 'bubbles'
    click_button 'Submit'
    
    expect(page.status_code).to eq 200
    within 'ul#url' do
      expect(page).to have_content "This is Zombocom"
      expect(page).to have_content "Bubble Bobble"
      expect(page).not_to have_content "Makers Academy"
      expect(page).not_to have_content "Google"
    end
  end
end
