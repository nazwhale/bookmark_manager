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
