require "rails_helper"

describe 'Session authentication', type: :system do
  

  context 'Create a New user ' do
    it 'Creates a new user and goes to timeline' do
      visit new_user_registration_path

      fill_in 'user_name', with: 'Mike'
      fill_in 'user_email', with: 'mickeyjackson@gmail.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'


      click_button 'Sign up'
    expect(page).to have_content('FRIEND REQUESTS')
    end
  end


end