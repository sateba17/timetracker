class Work < ApplicationRecord
	belongs_to :project
	belongs_to :user

	validates :project_id, :user_id, :datetimeperformed, presence: true
	validates :hours, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 8 }
	validate :date_is_in_past

	#validates :date_is_in_past

	scope :fullday, -> { where("hours >= 8") }
	scope :recent, -> { where("datetimeperformed > '#{Time.now - 7.days}'")}

	def date_is_in_past
		if datetimeperformed.present? && datetimeperformed > Time.now
			errors.add(:datetimeperformed, "can't be in the future")
		end
	end

	def to_s
		"#{user}: #{datetimeperformed.strftime('%m/%d/%Y %H:%M')} - #{hours} hours"
	end
end
