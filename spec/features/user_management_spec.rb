feature 'user sign up' do
  scenario 'user submits incorrect password' do
    expect{ sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(page.current_path).to eq '/sign_in'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'user cant sign up without entering an email' do
    expect{ sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq '/sign_in'
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'user cant sign up with invalid email format' do
  visit '/sign_in'
    expect{ sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(current_path).to eq '/sign_in'
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'User cannot sign up if previously registered' do
    sign_in
    expect{ sign_up }.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken Please sign in'
  end

def sign_up(email: 'cats@gmail.com', password: 'cats', password_confirmation: 'cats')
  visit '/sign_in'
  fill_in(:email, with: email)
  fill_in(:password, with: password)
  fill_in(:password_confirmation, with: password_confirmation)
  click_button 'Submit'
end

end
