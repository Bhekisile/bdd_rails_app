# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Editing an article' do
  before do
    @john = User.create!(email: 'john@example.com', password: 'password')
    @article = Article.create(title: 'Title One', body: 'Body of article one')
  end

  scenario 'A user updates an article' do
    visit '/'
    click_link @article.title
    click_link 'Edit Article'

    fill_in 'Email', with: @john.email
    fill_in 'Password', with: @john.password
    click_button 'Log in'

    fill_in 'Title', with: 'Updated Title'
    fill_in 'Body', with: 'Updated Body of Article'
    click_button 'Update Article'

    expect(page).to have_content('Article has been updated')
    expect(page.current_path).to eq(article_path(@article))
  end

  scenario 'A user fails to update an article' do
    visit '/'
    click_link @article.title
    click_link 'Edit Article'

    fill_in 'Email', with: @john.email
    fill_in 'Password', with: @john.password
    click_button 'Log in'

    fill_in 'Title', with: ''
    fill_in 'Body', with: 'Updated Body of Article'
    click_button 'Update Article'

    expect(page).to have_content('Article has not been updated')
    expect(page.current_path).to eq(article_path(@article))
  end
end
