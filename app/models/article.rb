# frozen_string_literal: true

# This is the validation class
class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  # default_scope { order(created_at: desc) }
end
