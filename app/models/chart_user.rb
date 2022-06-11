class ChartUser < ApplicationRecord
  belongs_to :user
  belongs_to :chart
end
