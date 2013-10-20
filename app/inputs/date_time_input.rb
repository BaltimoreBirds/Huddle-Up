class DateTimeInput < SimpleForm::Inputs::DateTimeInput
  def input_html_classes
    super.push('small-4 large-2 columns')
  end
end
