feature 'Viewing links' do
  scenario 'shows existing links on the links page' do
    Link.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
    sign_in
    expect(page.status_code).to eq 200

    within 'ul#url' do
      expect(page).to have_content('Title:')
    end
  end
end
