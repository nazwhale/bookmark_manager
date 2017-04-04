feature 'Viewing links' do
  scenario 'shows existing links on the links page' do
    Link.create(name: 'Makers Academy', url: 'http://www.makersacademy.com')
    visit '/links'
    expect(page.status_code).to eq 200

    whitin 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end

    # expect(page).to have_link("Makers Academy", :href => "http://www.makersacademy.com")
  end
end
