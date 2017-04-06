feature 'inputting tags' do
  before do
    sign_in
    visit '/links/new'
    fill_in(:name, with: 'Makers Academy')
    fill_in(:url, with: 'http://www.makersacademy.com')
  end

  scenario 'let user add tags to links' do
    fill_in(:tags, with: 'coding')
    click_button 'Submit'
    link = Link.first
    expect(link.tags.map(&:name)).to include('coding')
  end

  scenario 'let user add multiple tags to links' do
    fill_in(:tags, with: 'coding, bootcamp, education')
    click_button 'Submit'
    link = Link.first
    expect(link.tags.map(&:name)).to include('bootcamp')
    expect(link.tags.map(&:name)).to include('coding')
    expect(link.tags.map(&:name)).to include('education')
  end

end
