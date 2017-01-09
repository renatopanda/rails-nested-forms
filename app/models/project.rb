class Project < ApplicationRecord
	# inverse_of used due to Rails5 bug
	# bug + solutions: https://github.com/rails/rails/issues/25198
	has_many :people, dependent: :destroy, inverse_of: :project
	
	accepts_nested_attributes_for :people, allow_destroy: true, reject_if: proc { |att| att['name'].blank? || att['email'].blank? }
end

