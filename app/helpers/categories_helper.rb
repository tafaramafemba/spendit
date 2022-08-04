module CategoriesHelper
  def group_avatar(image)
    if image.present?
      image_tag(url_for(image), alt: 'icon', class: 'thumbnail icon-img', width: '64', height: '64')
    else
      image_tag('expenses.png', alt: 'icon', class: 'thumbnail icon-img')
    end
  end
end
