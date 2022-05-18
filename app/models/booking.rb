class Booking < ApplicationRecord
  belongs_to :animal
  belongs_to :user
  enum status: { pending: 0, confirmed: 1, denied: 2 }
  validate :end_date_after_start_date, :start_date_before_today

  def end_date_after_start_date
    errors.add(:end_date, "cannot be selected before start date!") if end_date <= start_date
  end

  def start_date_before_today
    errors.add(:start_date, "cannot be selected before today!") if start_date < Date.today
  end
end
