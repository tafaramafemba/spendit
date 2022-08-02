module CategoriesHelper
  def group_avatar(image)
    if image.present?
      image_tag(url_for(image), alt: 'icon', class: 'thumbnail icon-img', width: '100', height: '100')
    else
      image_tag('expenses.png', alt: 'icon', class: 'thumbnail icon-img')
    end
  end
end
