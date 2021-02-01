module UserConcern
  extend ActiveSupport::Concern
  included do

    PASSWORD_REQUIREMENTS = /((?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{7,})/
    USER_ROLES = { gp: 0, gp_trainee: 1, admin: 2, moderator: 3}.freeze
    USER_GP_TYPES = {GP_Principal: 0, Salaried_GP: 1, Locum: 2, Other: 3}.freeze
    USER_COUNTIES = {Dublin: 0, Galway: 1, Kerry: 2, Kildare: 3, Kilkenny: 4, Laois: 5, Leitrim: 6, Limerick: 7}.freeze
    USER_COUNTRIES = {ireland: 0, ukraine: 1, hungary: 2}.freeze


  end

end
