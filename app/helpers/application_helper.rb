module ApplicationHelper
  def show_img filename
    return image_tag('people/' + filename, :size => Person::IMG_SIZE, :alt => 'brak obrazu')
  end
end
