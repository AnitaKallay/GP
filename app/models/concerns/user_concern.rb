module UserConcern
  extend ActiveSupport::Concern

  included do

    PASSWORD_REQUIREMENTS = /((?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{7,})/
    USER_ROLES = { user: 0, admin: 1, moderator: 2}.freeze
    USER_TYPES = {gp: 0, gp_trainee: 1}
    USER_GP_TYPES = {GP_Principal: 0, Salaried_GP: 1, Locum: 2, Other: 3}.freeze
    USER_COUNTIES = {Dublin: 0, Galway: 1, Kerry: 2, Kildare: 3, Kilkenny: 4, Laois: 5, Leitrim: 6, Limerick: 7}.freeze
    USER_COUNTRIES = {ireland: 0, ukraine: 1, hungary: 2}.freeze
  end

  def set_defaults
    self.country ||= 'ireland'
  end

  def send_email
    UserMailer.registration_confirmation(self).deliver_now
  end
  def present_column
    if self.user_types == 'gp_trainee';self.update_column(:gp_type,nil) && self.update_column(:practice_name,nil)
    end
  end
end
