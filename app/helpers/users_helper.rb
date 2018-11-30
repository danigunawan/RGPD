module UsersHelper
  def choice_type choice
    available_choices = []
    available_choices[0] = "e droit d'accès"
    available_choices[1] = "e rectification"
    available_choices[2] = "e limitation"
    available_choices[3] = "'effacement"
    available_choices[choice - 1]
  end
end
