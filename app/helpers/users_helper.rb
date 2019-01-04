module UsersHelper
  def url_switcher
    if current_page?(controller: 'users', action:'index')
      users_path
    elsif current_page?(controller: 'users', action:'cemetary')
      cemetary_path
    else
      nil
    end
  end
end
