module NotesHelper
  def favorite_icon(user, note)
    classes = ['favorite_icon']

    if user
      classes << (user.favorite?(note) ? 'favorite-on' : 'favorite-off')
    end

    tag.div class: classes, "data-favorite-target": "icon"
  end
end

    # if user
    #   if user.favorite?(note)

    #     tag.div class: 'favorite_icon favorite-on'

    #     # content.tag(:div, '', class: 'favorite_icon favorite-on')

    #     # '<div class="favorite_icon favorite-on">'.html_safe
    #   else
    #     tag.div class: 'favorite_icon favorite-off'

    #   end

    # else
    #   tag.div class: 'favorite_icon'
    # end
    

  # end


