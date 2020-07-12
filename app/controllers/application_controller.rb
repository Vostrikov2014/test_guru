class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :authenticate_user!

  # Для работы локалей
  before_action :set_locale

  # Хелпер Дивайса - перенаправляет после входа на нужную страницу
  def after_sign_in_path_for(resource)
    flash[:notice] = t('.hello', first_name: resource.first_name)
    if resource.admin?
      admin_tests_path
    else
      super
    end
  end

  # Устанавливаем локаль поумолчанию
  # Специальный метод - какой не сказали, надо посмотреть...
  # Наверное I18n с ним работает поумолчанию
  # По умолчанию URL параметр языка не добавляется
  # если установленная локаль = локаль по умолчанию
  def default_url_options
    { lang: I18n.locale == I18n.default_locale ? {} : I18n.locale }
  end

  private

  # Устанавливаем локализацию
  def set_locale
    # I18n.locale_available?(params[:lang]) - проверяет доступность локали
    # Нужно тернарное выражение "?", так как I18n.locale не принимает Лож или Истину - принимает только параметр
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
