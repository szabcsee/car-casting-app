# :nodoc:
module ApplicationHelper
  def left_menu
    filtered_content = filter_left_menu_content(left_menu_content)
    left_menu_entries(filtered_content)
  end

  private

  def selected_locale
    locale = FastGettext.locale
    locale_list.detect {|entry| entry[:locale] == locale}
  end

  def get_body_class
    body_class = Setting.first
    body_class.theme
  end

  def locale_list
    [
        {
            flag: 'us',
            locale: 'en',
            name: 'English (US)',
            alt_name: 'United States'
        },
        {
            flag: 'fr',
            locale: 'fr',
            name: 'Français',
            alt_name: 'France'
        },
        {
            flag: 'es',
            locale: 'es',
            name: 'Español',
            alt_name: 'Spanish'
        },
        {
            flag: 'de',
            locale: 'de',
            name: 'Deutsch',
            alt_name: 'German'
        },
        {
            flag: 'jp',
            locale: 'ja',
            name: '日本語',
            alt_name: 'Japan'
        },
        {
            flag: 'cn',
            locale: 'zh',
            name: '中文',
            alt_name: 'China'
        },
        {
            flag: 'it',
            locale: 'it',
            name: 'Italiano',
            alt_name: 'Italy'
        },
        {
            flag: 'pt',
            locale: 'pt',
            name: 'Portugal',
            alt_name: 'Portugal'
        },
        {
            flag: 'ru',
            locale: 'ru',
            name: 'Русский язык',
            alt_name: 'Russia'
        },
        {
            flag: 'kr',
            locale: 'kr',
            name: '한국어',
            alt_name: 'Korea'
        },
    ]
  end

  def left_menu_entries(entries = [])
    output = ''
    entries.each do |entry|
      children_selected = entry[:children] &&
          entry[:children].any? {|child| current_page?(child[:href])}
      entry_selected = current_page?(entry[:href])
      li_class =
          case
          when children_selected
            'open'
          when entry_selected
            'active'
          end
      output +=
          content_tag(:li, class: li_class) do
            subentry = ''
            subentry +=
                link_to entry[:href], title: entry[:title], class: entry[:class], target: entry[:target] do
                  link_text = ''
                  link_text += entry[:content].html_safe
                  if entry[:children]
                    if children_selected
                      link_text += '<b class="collapse-sign"><em class="fa fa-minus-square-o"></em></b>'
                    else
                      link_text += '<b class="collapse-sign"><em class="fa fa-plus-square-o"></em></b>'
                    end
                  end

                  link_text.html_safe
                end
            if entry[:children]
              if children_selected
                ul_style = 'display: block'
              else
                ul_style = ''
              end
              subentry +=
                  "<ul style='#{ul_style}'>" +
                      left_menu_entries(entry[:children]) +
                      "</ul>"
            end

            subentry.html_safe
          end
    end
    output.html_safe
  end

  def left_menu_content
    [
        {
            href: root_path,
            title: _('blank'),
            content: "<i class='fa fa-lg fa-fw fa-home'></i> <span class='menu-item-parent'>" + _('Home') + "</span>",
            admin: false,
            profile: false
        },
        {
            href: user_profile_path(current_user.id),
            title: _('blank'),
            content: "<i class='fa fa-lg fa-fw fa-user'></i> <span class='menu-item-parent'>" + _('My Profile') + "</span>",
            admin: false,
            profile: true
        },
        {
            href: user_profiles_path,
            title: _('blank'),
            content: "<i class='fa fa-lg fa-fw fa-list'></i> <span class='menu-item-parent'>" + _('Profiles') + "</span>",
            admin: true,
            profile: true
        },
        {
            href: settings_path,
            title: _('blank'),
            content: "<i class='fa fa-lg fa-fw fa-gear'></i> <span class='menu-item-parent'>" + _('Settings') + "</span>",
            admin: false,
            profile: false
        },
    ]
  end

  def filter_left_menu_content(content_array)
    profile_available = session[:user_profile].present?
    content_array.each do |item|
      if item[:admin] == true && (current_user.admin == false || current_user.admin.nil?)
        content_array.delete(item)
      end
      if item[:profile] == true && profile_available == false
        content_array.delete(item)
      end
    end
    return content_array
  end

  def user_profile
    if session[:user_profile].present?
      return session[:user_profile]
    end
  end
end
