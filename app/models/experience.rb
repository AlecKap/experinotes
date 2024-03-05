class Experience < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  after_create_commit -> { broadcast_prepend_to "experiences" }
  # the above is equivalent to:
  # after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self }, target: "quotes" }
  after_update_commit -> { broadcast_replace_to "experiences" }
  after_destroy_commit -> { broadcast_remove_to "experiences" }
end
