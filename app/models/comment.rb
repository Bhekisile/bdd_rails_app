# frozen_string_literal: true

# This is the comment model
class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user

  validates :body, presence: true
end
