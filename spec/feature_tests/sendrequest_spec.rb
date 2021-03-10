require "rails_helper"

describe 'Session authentication', type: :system do
  before(:all) do
    User.create(email: 'michael@gmail.com', password: 'password', password_confirmation: 'password',name: 'Mike')
    User.create(email: 'jackson@gmail.com', password: 'password', password_confirmation: 'password',name: 'Jackson')
  end

  let(:email) { 'michael@gmail.com' }
  let(:password) { 'password' }

  context 'Login as a new user' do
    it 'they are on login page and try to login in and succeeds' do
      visit root_path

      fill_in 'user_email', with: email
      fill_in 'user_password', with: password

      click_button 'Log in'

    visit user_path(2)
    click_link ('Send Request')
    visit user_path(2)
    expect(page).to have_content('Awaiting Confirmation')

    end
  end
end