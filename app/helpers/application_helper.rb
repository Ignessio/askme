module ApplicationHelper
  def user_avatar(user)
    user.avatar_url.presence || asset_pack_path('media/images/avatar.jpg')
  end

  # def inclination(number, one, some, many)
  #   modulo100 = number % 100
  #   modulo = number % 10

  #   return many if (11..14).include?(modulo100)

  #   case modulo
  #   when 1
  #     one
  #   when 2..4
  #     some
  #   else
  #     many
  #   end
  # end
  # puts "#{@questions.size} #{inclination(how_many, 'вопрос', 'вопроса', 'вопрсов')}!"
end
