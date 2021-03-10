require "rails_helper"

describe 'Session authentication', type: :system do
  before(:all) do
    User.create(email: 'michael@gmail.com', password: 'password', password_confirmation: 'password',name: 'Mike')
  end

  let(:email) { 'michael@gmail.com' }
  let(:password) { 'password' }

  context 'Create a new post' do
    it 'they are on time and create a post' do
      visit root_path

      fill_in 'user_email', with: email
      fill_in 'user_password', with: password

      click_button 'Log in'
      fill_in 'post_content', with: 'Rspec test post'
      click_button 'Save'
      expect(page).to have_content('Rspec test post')
    #   click_link 'All users'
    #   click_link('See Profile', match: :first)
    #   expect(page).to have_content('Mike')
    end
  end


end