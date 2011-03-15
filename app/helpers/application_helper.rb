module ApplicationHelper
  
  # Return a title on a per-page basis.
  def title
    base_title = "Autoworker Community"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

   def meta_description
    return @meta_description = "autoworker retired autoworker GM employees " +
         " Ford employees Toytoa employees Honda employees Chryssler employees"
  end
  
  def logo
    image_tag("awlogo.png", :alt => "Autoworker", :class => "round")
  end
end
