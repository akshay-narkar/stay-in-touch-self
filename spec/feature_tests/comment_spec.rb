require "rails_helper"

describe 'Session authentication', type: :system do
  before(:all) do
    User.create(email: 'michael@gmail.com', password: 'password', password_confirmation: 'password',name: 'Mike')
    Post.create(user_id: 1, content: 'Rspec test post')
  end

  let(:email) { 'michael@gmail.com' }
  let(:password) { 'password' }

  context 'Create a comment on a post ' do
    it 'Logs in and creates a comment on the first post' do
      visit root_path

      fill_in 'user_email', with: email
      fill_in 'user_password', with: password

      click_button 'Log in'
    fill_in('comment_content', with:'This is a comment on rspec test post',match: :first)
    click_button('Comment', match: :first)
    expect(page).to have_content('This is a comment on rspec test post')
    end
  end


end