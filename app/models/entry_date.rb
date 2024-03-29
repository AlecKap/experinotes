class EntryDate < ApplicationRecord
  belongs_to :experience
  has_many :events, dependent: :destroy

  validates :date, presence: true, uniqueness: { scope: :experience_id }

  scope :ordered, -> { order(date: :asc) }

  def previous_date
    experience.entry_dates.ordered.where("date < ?", date).last
  end
end
