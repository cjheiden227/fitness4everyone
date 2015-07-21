module ApplicationHelper
	def is_active?(link_path)
  		current_page?(link_path) ? "active" : ""
 	end

 	def full_title(page_title='')
		base_title = "Fitness for Everyone"
		if page_title.empty?
			base_title
		else
			"#{page_title} | #{base_title}"
		end		
	end
	def indefinite_articlerize(params_word)
    	%w(a e i o u).include?(params_word[0].downcase) ? "an #{params_word}" : "a #{params_word}"
	end
end
