module ApplicationHelper
  def user_avatar(user)
    user.avatar_url.presence || asset_pack_path('media/images/avatar.jpg')
  end

  def inclination(number)
    mod_ex = number % 100
    mod = number % 10

    return "Всего: #{number} ответов" if (11..14).include?(mod_ex)

    case mod
    when 1
      "Всего: #{number} вопросов"
    when 2..4
      "Всего: #{number} вопросов"
    else
      "Всего: #{number} вопросов"
    end
  end
end
