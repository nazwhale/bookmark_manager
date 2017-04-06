feature 'signing in' do
  scenario 'can submit a form with details' do
    sign_in
    expect(page).to have_content('Welcome, nazwhale')
  end

  scenario 'signing in increases user count' do
    expect{sign_in}.to change(User, :count).by 1
  end
end
