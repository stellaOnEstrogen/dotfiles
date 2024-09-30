import requests
from bs4 import BeautifulSoup

# Settings
city = "Tokyo"
units = "imperial"  # Unit system {imperial or metric}


def convert_units(temp, units):
        return f"{temp:.1f}°F"
    
def normalize_condition(condition):
    # Take something like "cloudy" and return "Cloudy"
    return condition.capitalize()

def get_weather():
    try:
        url = f"https://www.google.com/search?q=weather+{city}"
        response = requests.get(url)
        soup = BeautifulSoup(response.text, "html.parser")
        
        # Extract temperature
        temp = soup.find("div", class_="BNeawe iBp4i AP7Wnd").text
        temp = float(temp.split("°")[0])
        
        # Extract weather condition
        condition = soup.find("div", class_="BNeawe tAd8D AP7Wnd").text.split("\n")[1].lower().replace(" ", "_")
        condition = normalize_condition(condition)
        return f"{convert_units(temp, units)} ({condition})"
    except Exception as e:
        return ""  # Return empty string if there's an error

def main():
    weather_info = get_weather()
    return weather_info

if __name__ == "__main__":
    print(main())

