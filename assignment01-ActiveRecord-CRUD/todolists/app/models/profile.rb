class Profile < ActiveRecord::Base
  validates :gender,
            inclusion: {
              in: %w[female male],
              message: '%{value} is not a valid relationship status'
            }
end