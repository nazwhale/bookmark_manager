feature 'inputting links' do
  scenario 'page works' do
    visit '/links/new'
    expect(page.status_code).to eq 200
  end
  scenario 'can submit a new link to bookmark manager' do
    visit '/links/new'
    fill_in(:name, with: 'Makers Academy')
    fill_in(:url, with: 'http://www.makersacademy.com')
    click_button 'Submit'
    expect(current_path).to eq '/links'

    within 'ul#url' do
      expect(page).to have_content 'Makers Academy'
    end
  end
end

feature 'inputting tags' do
  scenario 'let user add tags to links' do
    visit '/links/new'
    fill_in(:name, with: 'Makers Academy')
    fill_in(:url, with: 'http://www.makersacademy.com')
    fill_in(:tags, with: 'coding')
    click_button 'Submit'
    link = Link.first
    expect(link.tags.map(&:name)).to include('coding')
  end
end
