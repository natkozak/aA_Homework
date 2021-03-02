module ApplicationHelper
  def auth_token
"<input type='hidden' name='authenticity_token' value=#{h(form_authenticity_token)} />".html_safe
  end

end

#Sweet! Looking good? Now go through your app and replace all of the form_authenticity_token input fields with calls to your snazzy new method, <%= auth_token %>, to dry up your code and simplify your life.

#Is there a way to find examples of a particular snippet across multiple files in vscode?