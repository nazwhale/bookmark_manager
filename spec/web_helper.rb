def sign_in
  visit '/sign_in'
  fill_in(:email, with: 'nazwhale@gmail.com')
  fill_in(:password, with: 'cats')
  fill_in(:password_confirmation, with: 'cats')
  click_button 'Submit'
end
