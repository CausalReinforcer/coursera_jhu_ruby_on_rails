class Profile < ActiveRecord::Base
  belongs_to :user

  validates :gender,
            inclusion: {
                in: %w[female male],
                message: '%{value} is not a valid relationship status'
            }

  validate :name_not_null
  validate :sue_is_female

  def name_not_null
    if (first_name.nil? || first_name.empty?) && (last_name.nil? || last_name.empty?)
      errors.add(:base, 'First name and last name cannot both be empty!')
    end
  end

  def sue_is_female
    if first_name == 'Sue' && gender == 'male'
      errors.add(:base, 'Sue cannot be a male. Please validate data.')
    end
  end

  def self.get_all_profiles(min_birth_year, max_birth_year)
    Profile.where(
      'birth_year BETWEEN :min_birth_year AND :max_birth_year',
      min_birth_year: min_birth_year,
      max_birth_year: max_birth_year
    ).order(birth_year: :asc)
  end
end