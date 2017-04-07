feature 'user sign up' do
  scenario 'user submits incorrect password' do
    expect{sign_up(password_validation: 'wrong') }.not_to change(User, :count)
  end

def sign_up(email: 'nazwhale@gmail.com', password: 'vimmaster', password_validation: 'vimmaster')
  visit '/users/new'
  fill_in(:email, with: email)
  fill_in(:password, with: password)
  fill_in(:password_validation, with: password_confirmation)
  click_button 'Submit'
end

end
