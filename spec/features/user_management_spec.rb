feature 'user sign up' do
  scenario 'user submits incorrect password' do
    expect{ sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(page.current_path).to eq '/sign_in'
    expect(page).to have_content 'Password and confirmation password do not match'
  end

def sign_up(email: 'nazwhale@gmail.com', password: 'vimmaster', password_confirmation: 'vimmaster')
  visit '/sign_in'
  fill_in(:email, with: email)
  fill_in(:password, with: password)
  fill_in(:password_confirmation, with: password_confirmation)
  click_button 'Submit'
end

end
