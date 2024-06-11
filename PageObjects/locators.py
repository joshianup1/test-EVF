# WordPress Login form locator
username_id = "id:user_login"
password_id = "id:user_pass"
submit_id = "id:wp-submit"

# WordPress Dashboard locator
everest_form_hover = "xpath://div[contains(text(),'Everest Forms')]"
view_all_forms = "xpath://li[@id='toplevel_page_everest-forms']//ul//li//a[contains(text(),'Add New')]"
edit_form = "xpath://figure[@class='everest-forms-screenshot evf-template-select']"
start_from_scratch = "xpath://figure[@class='everest-forms-screenshot evf-template-select']"
start_from_scratch_alt = "id:everest-forms-template-blank"
click_element = [everest_form_hover, view_all_forms, start_from_scratch]
add_new_form = "id:everest-forms-setup-name"
form_name_text = "xpath://div[contains(@class,'jconfirm-content')]//input"
form_name_text1 = "id:everest-forms-setup-name"
continue_button = "xpath://button[normalize-space()='Continue']"

# Drag and drop fields locator
grid = "css:.evf-admin-row.ui-sortable-handle"
target = "xpath://div[starts-with(@class,'evf-admin-grid evf-grid-1 ui-sortable')]"
add_row = 'css:.everest-forms-btn.everest-forms-btn-primary.dashicons.dashicons-plus-alt'
edit = "css:span[title='Edit']"
single_col = "xpath://div[@class='evf-toggle-row-content']//div[2]//span[1]"
first_name = "id:everest-forms-add-fields-first-name"
last_name = "id:everest-forms-add-fields-last-name"
single_line_text = "id:everest-forms-add-fields-text"
Paragraph_text = "id:everest-forms-add-fields-textarea"
dropdown = "id:everest-forms-add-fields-select"
multiple_choice = "id:everest-forms-add-fields-radio"
checkboxes = "id:everest-forms-add-fields-checkbox"
number = "id:everest-forms-add-fields-number"
email = 'id:everest-forms-add-fields-email'
website_url = "id:everest-forms-add-fields-url"
date_time = "id:everest-forms-add-fields-date-time"
save_form = "name:save_form"
fields = [first_name, last_name, single_line_text, dropdown, multiple_choice, checkboxes, email, number, Paragraph_text]
four_fields = [email, checkboxes, Paragraph_text, number]
general_field_dropdown = "xpath://a[.='General Fields']"

# Preview button locator
preview_button = "xpath://a[contains(.,'Preview')]"

# Individual form settings locator
individual_form_settings = "xpath://a[contains(@data-panel,'settings')]"

# Ajax checkbox locator
ajax_checkbox = "id:everest-forms-panel-field-settings-ajax_form_submission"

# Entry checkbox locator
form_entries_checkbox = "id:everest-forms-panel-field-settings-disabled_entries"

# dashboard analytics checkbox locator
dashboard_analytics_checkbox = "id:everest-forms-panel-field-settings-enable_entries_dashboard_analytics"
dashboard_analytics_html_element = "id:evf-dashboard-analytics"

# Form fields locator
lastname_field = "xpath://form[1]/div[1]/div[1]/div[1]/div[1]/input[1]"
dropdown_field = "xpath://select"
url_field = "xpath://input[@type='url']"
paragraph_text_field = "xpath://textarea[@class='input-text']"
number_field = "xpath://input[@type='number']"
email_field = "xpath://input[@type='email']"
checkbox_field = "xpath://input[@type='checkbox'][@value='Third Choice']"
field_firstname = "xpath://form[1]/div[1]/div[1]/div[1]/div[4]/input[1]"
firstname_field = "xpath://form[1]/div[1]/div[1]/div[1]/div[9]/input[1]"
single_line_text_field = "xpath://form[1]/div[1]/div[1]/div[1]/div[10]/input[1]"
date_field_click = "xpath://input[@class='flatpickr-field input-text flatpickr-input']"
input_year_2023 = "xpath://input[@aria-label='Year']"
date_field_click_month = "xpath://select[@class='flatpickr-monthDropdown-months']"
date_field_click_month_date_year = "xpath://span[@aria-label='February 21, 2023']"
form_submission_button = "xpath://button[@name='everest_forms[submit]']"
first_name_field_individual = "xpath://input[starts-with(@name, 'everest_forms[form_fields]')]"

# all forms locator
click_all_form = "xpath://li/a[text()='All Forms']"
form_mouse_hover = "xpath:(//td[@class='title column-title'])[1]"
form_click_entries = "xpath:(//a[@title='View Entries'][normalize-space()='Entries'])[1]"

# Entries locator
click_entries = "xpath://a[text()='Entries']"
view_entry = "xpath://tbody//a[contains(.,'View')]"
click_export = "xpath://span[@class='evf-nav-icon export']"
input_everest_form = "xpath://li/input[contains(@placeholder,'Select Form(s)')]"
export_top_form = "//li[@role='option'][1]"
export_button = "xpath://button[normalize-space()='Export']"
click_import = "xpath://span[@class='evf-nav-icon import']"
import_everest_form = "xpath://input[@id='everest-forms-import']"
import_button = "xpath://button[normalize-space()='Import Form']"

# Tools locator
click_tools = "xpath://a[text()='Tools']"
click_logs = "xpath://span[@class='evf-nav-icon logs']"
click_view_button = "xpath://button[normalize-space()='View']"
select_form_dropdown_icon = "xpath://span[@role='presentation']"
select_field_dropdown_icon = "xpath:(//span[@role='presentation'])[2]"
select_field_select_all_button = "xpath://button[normalize-space()='Select All']"
select_additional_information_icon = "xpath:(//span[@role='presentation'])[3]"
select_additional_information_all_button = "xpath://button[normalize-space()='Select All']"
export_formats_dropdown = "xpath://select[@name='export_format']"
export_entries_button = "xpath://button[@name='submit-entries-export']"
date_range_id = "id:evf-tools-entries-export-date-range"
select_month_dropdown = "xpath://select[@class='flatpickr-monthDropdown-months']"
enter_year = "xpath://input[@aria-label='Year']"
select_day = "xpath://span[@aria-label='January 4, 2023']"
enter_another_year = "xpath://input[@aria-label='Year']"
select_another_day = "xpath://span[@aria-label='January 20, 2024']"

# Global settings keyword locator
global_settings = "xpath://a[text()='Settings']"
log_checkbox = "id:everest_forms_enable_log"
save_settings = "xpath://button[@name='save']"

# Redirect locator
redirect_dropdown = "css:#everest-forms-panel-field-settings-redirect_to"
input_external_url = "id:everest-forms-panel-field-settings-external_url"

# Mailinator locator
input_mailinator_email = "xpath://input[@id='search']"
mailinator_go_button = "xpath://button[normalize-space()='GO']"
entry_form = "//td[contains(text(),'New Form Entry')]"

# Individual form settings (Email Settings) locator
email_settings = "link:Email"
email_smart_tag = "id:everest-forms-panel-field-email-connection_1-evf_to_email"
recipient_email_admin = "id:everest-forms-panel-field-email-connection_1-evf_to_email"
add_new_email_button = "xpath://button[@class='everest-forms-btn everest-forms-btn-primary everest-forms-email-add']"
input_title = "xpath://input[@id='provider-connection-name']"
click_ok_button = "xpath://button[normalize-space()='OK']"
admin_email_smart_tag = "(//input[@value='{admin_email}'])[3]"
select_email_smart_tag = "xpath://li[normalize-space()='Email']"
click_smart_tag_dropdown = "//div[@class='evf-content-email-settings-inner active-connection']//div[@id='everest-forms-panel-field-email-connection_1-evf_to_email-wrap']//span[@class='dashicons dashicons-editor-code']"

# Security locator
security_settings = "link:Anti-Spam and Security"
blacklist_ip = "id:everest-forms-panel-field-settings-ip_block"
blacklist_email = "id:everest-forms-panel-field-settings-email_black_list"
blacklist_words = "id:everest-forms-panel-field-settings-whole_form_black_list_words"

# field options locator
click_email = "xpath://span[normalize-space()='Email']"
validate_as_unique_checkbox = "xpath://label[normalize-space()='Validate as unique']"
click_firstname = "xpath://span[normalize-space()='First Name']"
advanced_options = "xpath://a[.='Advanced Options']"
allowed_domain = "xpath://input[@placeholder='Allowed Domain(s)']"
denied_domain = "xpath://input[@placeholder='Denied Domain(s)']"
select_denied_domain = "xpath://select[@class='widefat '] "
locators_edit_form = "xpath://label[@class='label-title ']"

# form restriction locator
form_restriction_link = "link:Form Restriction"

mouse_over_everest_forms = "xpath://*[@id='toplevel_page_everest-forms']/a/div[3]"
everest_all_forms = "xpath://a[@href='admin.php?page=evf-builder']"

# Survey Fields Locator
rating_add_field = "xpath://button[@id='everest-forms-add-fields-rating']"
yes_no_field = "xpath://button[@id='everest-forms-add-fields-yes-no']"
likert_field = "xpath://button[@id='everest-forms-add-fields-likert']"
scale_rating_field = "xpath://button[@id='everest-forms-add-fields-scale-rating']"
target_survey = "xpath://div[starts-with(@class,'evf-admin-grid evf-grid-1 ui-sortable')]"
survey_fields = [rating_add_field, yes_no_field, likert_field, scale_rating_field]
general_field = "xpath://a[normalize-space()='General Fields']"
advance_field = "xpath://a[normalize-space()='Advanced Fields']"
payment_field = "xpath://a[normalize-space()='Payment Fields']"

# Survey Locators at frontend
select_yes_no = "xpath:(//div[contains(@class,'everest-forms-field-yes-no-container')]/child::label)[1]"
select_likert_opt1 = "xpath://tbody/tr[1]/td[1]/label"
select_likert_opt2 = "xpath://tbody/tr[2]/td[2]/label"
select_likert_opt3 = "xpath://tbody/tr[3]/td[3]/label"
select_star_rating = "xpath:(//div[contains(@class,'everest-forms-field-rating-container')]/child::label)[2]"
select_scale_rating = "//label[normalize-space()='2']"

# Quiz
dropdown = "xpath://button[@id='everest-forms-add-fields-select']"
checkboxes = "id:everest-forms-add-fields-checkbox"
select_dropdown = "xpath://select[@class='input-text evf-valid']"
select_from_dropdown = "xpath=/html[1]/body[1]/div[2]/main[1]/div[2]/div[1]/div[1]/form[1]/div[1]/div[1]/div[1]/div[1]/select[1]"
select_from_multiple = "(//input[@Class='input-text'])[3]"
all_quiz_fields = [checkboxes, multiple_choice, dropdown]
