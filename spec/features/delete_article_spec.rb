# frozen_string_literal: true

# Articles controller method
require 'rails_helper'

RSpec.feature 'Deleting an article' do
  before do
    john = User.create(email: 'john@example.com', password: 'password')
    login_as(john)
    @article = Article.create(title: 'Title One', body: 'Body of article one.', user: john)
  end

  scenario 'A user deletes an article' do
    visit '/'

    click_link @article.title
    click_button 'Delete Article'

    expect(page).to have_content('Article has been deleted')
    expect(current_path).to eq(articles_path)
  end
end
