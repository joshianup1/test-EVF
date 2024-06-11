import requests
from robot.api.deco import keyword


@keyword
def get_public_ip():
    try:
        response = requests.get('https://api.ipify.org?format=json')
        data = response.json()
        return data['ip']
    except Exception as e:
        return str(e)


if __name__ == "__main__":
    public_ip = get_public_ip()
    print(f"Your public IP address is: {public_ip}")
