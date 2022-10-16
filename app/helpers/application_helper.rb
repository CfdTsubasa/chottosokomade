module ApplicationHelper
  BASE_TITLE = "Chottosokomade!!"

  def full_title(page_title)
    if page_title.present?
      "#{page_title} - #{BASE_TITLE}"
    else
      BASE_TITLE
    end
  end
end
