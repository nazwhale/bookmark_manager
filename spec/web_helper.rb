def sign_in
  visit '/sign_in'
  fill_in(:email, with: 'nazwhale@gmail.com')
  fill_in(:password, with: 'vimmaster')
  click_button 'Submit'
end
