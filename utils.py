from datetime import datetime

import requests

CURRENCY_RATE_BASE_URL = 'https://nbg.gov.ge/gw/api/ct/monetarypolicy/currencies/?'

def get_currency_rate_on_date():
    req = requests.PreparedRequest()
    current_date = datetime.now().strftime('%Y-%m-%d')
    params = {'currencies': 'USD', 'date': current_date}
    req.prepare_url(CURRENCY_RATE_BASE_URL, params)
    currency_rate = requests.get(url=req.url).json()[0].get('currencies')
    return currency_rate[0].get('rate') if len(currency_rate) == 1 else 1

