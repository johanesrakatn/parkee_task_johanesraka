import pandas as pd
import numpy as np
import argparse
import requests

def get_api(country):
    url = "http://universities.hipolabs.com/search"
    params = {"country": country}
    # Send a GET request to the API
    response = requests.get(url, params=params)
    return response

parser = argparse.ArgumentParser(description='')
parser.add_argument('-c', dest='country', action='store', default='United States', help="Filter by country")
parser.add_argument('-s', dest='state_prov', action='store', default='0', help="Filter data with no state-province (0 : display all data, 1 : filter out data with no 'state-province', 2 : show all data with no 'state-province')")
args = parser.parse_args()

df = pd.DataFrame(get_api(args.country).json())
df.replace(to_replace='None', value=np.nan)
if (args.state_prov == "1"):
    print("test")
    df.dropna(subset=['state-province'], inplace=True)
elif (args.state_prov == "2"):
    df = df[df['state-province'].isna()]

# Select the desired columns
df = df[["name", "web_pages", "country", "domains", "state-province"]]

# Rename the columns
df.columns = ["Name", "Web pages", "Country", "Domains", "State Province"]

# Print the resulting DataFrame
print(df.head().to_string(index=False))