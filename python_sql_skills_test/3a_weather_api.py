import requests

# 5 day forecast (40 checks (1 check per 3 h))

url = "http://api.openweathermap.org/data/2.5/forecast?lat={}&lon={}&units=metric&cnt=40&appid=05443b3ba2b770a860712cc4afb3a43e"

# Ufa coordinates
lat = '54'
lon = '56'

url_to_request = url.format(lat, lon)

bulk_data = requests.get(url_to_request).json()['list']

pressures = []
temp_difference = {}

for i in range(len(bulk_data)):

    data = bulk_data[i]
    date = data['dt_txt']
    pressure = data['main']['pressure']
    min_temp = data['main']['temp_min']
    max_temp = data['main']['temp_max']

    pressures.append(pressure)
    temp_difference[date] = max_temp - min_temp

max_pressure = max(pressures)
temp_difference = sorted(temp_difference.items(), key=lambda x: x[1])
day_of_min_temp_difference = temp_difference[0][0].split()

print('The max pressure in nearest 5 days is: {} hPa'.format(max_pressure))
print()
print('The day of the minimal difference \nbetween the highest and the lowest \ntemperatures in nearest 5 days: {}'.format(day_of_min_temp_difference[0]))


