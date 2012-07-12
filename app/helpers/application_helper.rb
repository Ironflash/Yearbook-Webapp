module ApplicationHelper

	#returns the full page title per individual page
	def full_title(page_title)
		base_title = "Texas A&M Yearbook"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
end
