# frozen_string_literal: true

# Articles controller method
require 'rails_helper'

RSpec.feature 'Deleting an article' do
  before do
    @john = User.create!(email: 'john@example.com', password: 'password')

    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: @john.email
    fill_in 'Password', with: @john.password
    click_button 'Log in'
    @article = Article.create(title: 'Title One', body: 'Body of article one.')
  end

  scenario 'A user deletes an article' do
    visit '/'

    click_link @article.title
    click_link 'Delete Article'

    expect(page).to have_content('Article has been deleted')
    expect(current_path).to eq(articles_path)
  end
end
