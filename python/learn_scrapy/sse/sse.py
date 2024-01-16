import requests
import json
import pandas as pd

def get_and_download_pdf_file():
    # pageSize = 100, total page = 629
    start_date = '2007-01-01'
    end_date = '2022-12-31'
    COLUMN_NAMES = ['fileName', 'securityCode', 'sseDate', 'title', 'url', 'keyWord', 'bulletinType', 'bulletinHeading', 'orgBulletinType', 'securityAbbr', 'bulletinId', 'orgFileType', 'orgBulletinId', 'bulletinYear', 'createTime', 'bondType', 'orgBulletinTypeDesc']
    df = pd.DataFrame(columns=COLUMN_NAMES)
    for i in range(1, 158):
        print(i)
        
        url = f'http://query.sse.com.cn/commonSoaQuery.do?jsonCallBack=jsonpCallback98098647&isPagination=true&pageHelp.pageSize=100&pageHelp.cacheSize=1&type=inParams&sqlId=BS_ZQ_GGLL&sseDate={start_date}+00%3A00%3A00&sseDateEnd={end_date}+23%3A59%3A59&securityCode=&title=%E5%8B%9F%E9%9B%86&orgBulletinType=1101&bondType=COMPANY_BOND_BULLETIN&order=sseDate%7Cdesc%2CsecurityCode%7Casc%2CbulletinId%7Casc&pageHelp.pageNo={i}&pageHelp.beginPage={i}&pageHelp.endPage={i}&_=1691030683665'
        referer = 'http://www.sse.com.cn/'
        # print(url)
        response = requests.get(url=url, headers={'Referer': referer})
        json_data = response.text.split('jsonpCallback98098647(')[-1].replace(')', '')
        format_data = json.loads(json_data)

        for every_report in format_data['result']:
            df = pd.concat([df, pd.DataFrame([every_report])])
            # print(every_report)
    # df.to_excel('sse.xlsx')
    df.to_csv('sse.csv')

if __name__ == '__main__':
    get_and_download_pdf_file()