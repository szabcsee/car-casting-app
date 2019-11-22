# :nodoc:
module ApplicationHelper
  def left_menu
    filtered_content = filter_left_menu_content(left_menu_content)
    left_menu_entries(filtered_content)
  end

  private

  def selected_locale
    locale = I18n.locale
    locale_list.detect {|entry| entry[:locale].to_sym == locale}
  end

  def get_body_class
    body_class = Setting.first
    body_class.theme
  end

  def locale_list
    [
        {
            flag: 'hu',
            locale: 'hu',
            name: 'Magyar',
            alt_name: 'Hungarian'
        },
        {
            flag: 'us',
            locale: 'en',
            name: 'English (US)',
            alt_name: 'United States'
        },
        {
            flag: 'es',
            locale: 'es',
            name: 'Español',
            alt_name: 'Spanish'
        }
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
            title: I18n.t('blank'),
            content: "<i class='fa fa-lg fa-fw fa-home'></i> <span class='menu-item-parent'>" + t('home') + "</span>",
            admin: false,
            profile: false
        },
        {
            href: user_profile_path(current_user.id),
            title: I18n.t('blank'),
            content: "<i class='fa fa-lg fa-fw fa-user'></i> <span class='menu-item-parent'>" + t('my_profile') + "</span>",
            admin: false,
            profile: true
        },
        {
            href: user_profiles_path,
            title:I18n.t('blank'),
            content: "<i class='fa fa-lg fa-fw fa-list'></i> <span class='menu-item-parent'>" + t('profiles') + "</span>",
            admin: true,
            profile: true
        },
        {
            href: '#',
            title: I18n.t('vehicles'),
            content: "<i class='fa fa-lg fa-fw fa-car'></i> <span class='menu-item-parent'>" + t('vehicles') + "</span>",
            admin: false,
            profile: false,
            children: [
                {
                    href: vehicles_path,
                    title: I18n.t('list_vehicles'),
                    content: "<span class='menu-item-parent'>" + t('list_vehicles') + "</span>",
                    admin: true,
                    profile: false
                },
                {
                    href: my_vehicle_path(current_user.id),
                    title: I18n.t('my_vehicles'),
                    content: "<span class='menu-item-parent'>" + t('my_vehicles') + "</span>",
                    admin: false,
                    profile: false
                },
                {
                    href: new_vehicle_path,
                    title: I18n.t('new_vehicle'),
                    content: "<span class='menu-item-parent'>" + t('new_vehicle') + "</span>",
                    admin: false,
                    profile: false
                }
            ]
        },
        {
            href: settings_path,
            title:I18n.t('blank'),
            content: "<i class='fa fa-lg fa-fw fa-gear'></i> <span class='menu-item-parent'>" + t('settings') + "</span>",
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
      if item[:children].present?
        item[:children] = filter_left_menu_content(item[:children])
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
