require "rails_helper"

describe 'Session authentication', type: :system do
  before(:all) do
    User.create(email: 'michael@gmail.com', password: 'password', password_confirmation: 'password',name: 'Mike')
    Post.create(user_id: 1, content: 'Rspec test post')
  end

  let(:email) { 'michael@gmail.com' }
  let(:password) { 'password' }

  context 'like a post' do
    it 'there is an existing post, like that first post ' do
      visit root_path

      fill_in 'user_email', with: email
      fill_in 'user_password', with: password

      click_button 'Log in'
   
      click_link('Like', match: :first)
    expect(page).to have_content('Dislike!')
    end
  end


end