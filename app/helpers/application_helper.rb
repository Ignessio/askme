module ApplicationHelper
  def user_avatar(user)
    user.avatar_url.presence || asset_pack_path('media/images/avatar.jpg')
  end

  def inclination(number, one, some, many)
    mod_ex = number % 100
    mod = number % 10

    return many if (11..14).include?(mod_ex)

    case mod
    when 1
      one
    when 2..4
      some
    else
      many
    end
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end
