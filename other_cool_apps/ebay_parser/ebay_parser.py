import requests
import unidecode
import csv
from bs4 import BeautifulSoup

link = "https://www.ebay.com/sch/4713/i.html?_nkw=4+string+bass+guitar&_sop=12&_ipg=200&rt=nc&Brand=Fender&_dcat=4713&_pgn=1"


def get_html(link):
    try: 
        result = requests.get(link)
    except requests.exceptions.ConnectionError:
        print('banned!!!!!!')
        return 'Connection refused'
    return result.text


def get_data(html):

    try:
        soup = BeautifulSoup(html, 'lxml')

        base = soup.find('div', class_='srp-river-results clearfix')

        item = base.find_all('li', class_='s-item')

        res = []
        for i in range(len(item)):
            try:
                title =  item[i].find('h3', class_='s-item__title').text
                price = unidecode.unidecode(item[i].find('span', class_='s-item__price').text)
                lnk = item[i].find('a', class_='s-item__link').get('href')
                link = '<a href=\"' + str(lnk) + '\">Link</a>'
            except:
                title, price, link = '', '', ''
            res.append([title, price, link])
        return res
    except:
        return ['', '', '']


def get_total_pages(html):

    soup = BeautifulSoup(html, 'lxml')

    pages = soup.find('ol', class_='pagination__items').find_all('a', class_='pagination__item')
    return [int(page.text) for page in pages]


page_content = get_html(link)
all_pages = get_total_pages(page_content)

link_template = 'https://www.ebay.com/sch/4713/i.html?_nkw=4+string+bass+guitar&_sop=12&_ipg=200&rt=nc&Brand=Fender&_dcat=4713&_pgn='


outcome = []
for page in all_pages:
    url = link_template + str(page)
    content = get_html(url)
    result = get_data(content)
    for record in result:
        outcome.append(record)

print(len(outcome))


with open('result.csv', 'a') as file:
    writer = csv.writer(file)
    for record in outcome:
        writer.writerow(
            (record[0],
            record[1],
            record[2])  
        )
