module AjaxHelpers
  def wait_for_ajax
    begin
      Timeout.timeout(Capybara.default_wait_time) do
        loop until finished_all_ajax_requests?
      end
    rescue Capybara::NotSupportedByDriverError => e
      puts "Javascript not enabled, not waiting for script to finish"
    end
  end

  def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active').zero?
  end

  def fill_autocomplete(css_id, options = {})
    find("#{css_id}").native.send_keys options[:with]
    page.execute_script %{ $('#{css_id}').trigger('focus') }
    page.execute_script %{ $('#{css_id}').trigger('keydown') }
    selector = %{ul.ui-autocomplete li.ui-menu-item:contains("#{options[:select]}")}
    expect(page).to have_selector('ul.ui-autocomplete li.ui-menu-item')
    page.execute_script %{ $('#{selector}').trigger('mouseenter').click() }
  end
end
