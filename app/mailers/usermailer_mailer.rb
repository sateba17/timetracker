class UsermailerMailer < ApplicationMailer

	def workcreated_email(work)
		@work = work
		mail(to: work.project.user.email, subject: "Work Item Posted")
	end
end
