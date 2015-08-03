class ImageInput < FormtasticBootstrap::Inputs::FileInput

  def to_html
    bootstrap_wrapping do
      out = ''
      if object.send(input_name) && object.errors[input_name].blank?
        out << template.image_for(object, '60x60#', :method => input_name)
      end
      out << '<div class="image-inputs">'
      out << builder.file_field(method, input_html_options)
      if object.send(input_name).present?
        out << template.content_tag(:label, :class => 'checkbox remove-image') do
          builder.check_box("remove_#{input_name}") + " Remove #{label_text.downcase.gsub('<abbr title="required">*</abbr>', '')}"
        end
      end
      out << '</div>'
    end << '<div class="clearfix"></div>'.html_safe
  end

  def wrapper_html_options
    super.merge(:class => super[:class].sub('file', 'image'))
  end

end
