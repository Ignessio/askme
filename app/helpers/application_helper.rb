module ApplicationHelper
  def user_avatar(user)
    user.avatar_url.presence || asset_pack_path('media/images/avatar.jpg')
  end

  def inclination(number)
    mod_ex = number % 100
    mod = number % 10

    return "Всего: #{number} вопросов" if (11..14).include?(mod_ex)

    case mod
    when 1
      "Всего: #{number} вопрос"
    when 2..4
      "Всего: #{number} вопроса"
    else
      "Всего: #{number} вопросов"
    end
  end
end
