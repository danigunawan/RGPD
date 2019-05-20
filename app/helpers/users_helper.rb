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

  def request_from_user
    Request.find(@user.request_id).title
  end

  def archived_col_sizer
    if @user.archived
      3
    else
      6
    end
  end
  
end
