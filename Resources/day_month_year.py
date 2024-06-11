import datetime
from robot.api.deco import keyword

# Get the current date
current_date = datetime.date.today()

# Convert the integer to the corresponding day name
day_name = current_date.strftime("%A").lower()

print("Day of the week (name):", day_name)


@keyword
def get_day_name_locator():
    day_name_locator = f"id:everest-forms-panel-field-form_restriction-{day_name}"
    return day_name_locator


print(get_day_name_locator())

# Calculate the date for tomorrow
tomorrow_date = current_date + datetime.timedelta(days=1)

# Convert the integer to the corresponding day name
day_name_tomorrow = tomorrow_date.strftime("%A").lower()


@keyword
def get_day_name_tomorrow_locator():
    day_name_tomorrow_locator = f"id:everest-forms-panel-field-form_restriction-{day_name_tomorrow}"
    return day_name_tomorrow_locator


print(get_day_name_tomorrow_locator())
