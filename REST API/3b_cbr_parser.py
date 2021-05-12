"""
<Item ID="R01820">
<Name>Японская иена</Name>
<EngName>Japanese Yen</EngName>
<Nominal>100</Nominal>
<ParentCode>R01820 </ParentCode>
</Item>
"""

import requests
from lxml import etree


url = "http://www.cbr.ru/scripts/XML_daily.asp"
yena_code = 'R01820'

def exchange_rate(url, code):
    response = requests.get(url)
    root = etree.fromstring(response.content)

    currency = {}
    for x in root.getchildren():
        currency[x.attrib['ID']] = x.getchildren()

    try:
        yena_bulk_data = currency[code]
    except ValueError:
        return 'Something has gone wrong...'

    result = {}
    for u in yena_bulk_data:
        result[u.tag] = u.text

    return result['Value'] + ' ' + result['Name'] + ' эквивалентны ' + result['Nominal'] + ' Российским рублям'

print(exchange_rate(url, yena_code))