class BusinessPerformance < ApplicationRecord
  validates :number_of_nominations, presence: true
  validates :on_site_nomination, presence: true
  validates :sales_subtotal, presence: true
  validates :duty_hours, presence: true
end
