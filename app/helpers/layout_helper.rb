module LayoutHelper
  def title
    if @title.present?
      [title_string, default_title].join(" - ")
    else
      default_title
    end
  end

  def default_title
    store_name
  end
end
