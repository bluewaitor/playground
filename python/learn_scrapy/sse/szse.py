import requests
import json
import pandas as pd

cookies = {
    'SL_G_WPT_TO': 'eo',
    'SL_GWPT_Show_Hide_tmp': '1',
    'SL_wptGlobTipTmp': '1',
}

headers = {
    'Accept': 'application/json, text/javascript, */*; q=0.01',
    'Accept-Language': 'zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7',
    'Connection': 'keep-alive',
    'Content-Type': 'application/json',
    'Origin': 'http://www.szse.cn',
    'Referer': 'http://www.szse.cn/disclosure/bond/notice/index.html',
    'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36',
    'X-Request-Type': 'ajax',
    'X-Requested-With': 'XMLHttpRequest',
}

params = {
    'random': '0.8842877360766206',
}

json_data = {
    'seDate': [
        '2007-01-01',
        '2022-12-31',
    ],
    'searchKey': [
        '募集',
    ],
    'channelCode': [
        'bondinfoNotice_disc',
    ],
    'smallCategoryId': [
        '013901',
    ],
    'pageSize': 50,
    'pageNum': 1,
}

def get_notices():
    COLUMN_NAMES = ['id', 'annId', 'title', 'content', 'attachPath', 'attachFormat', 'attachSize', '_index']
    df = pd.DataFrame(columns=COLUMN_NAMES)
    
    for i in range(1, 74):
        print(i)
        json_data['pageNum']= i
        response = requests.post(
            'http://www.szse.cn/api/disc/announcement/annList',
            params=params,
            cookies=cookies,
            headers=headers,
            json=json_data,
            verify=False,
        )
        format_data = json.loads(response.text)

        for every_report in format_data['data']:
            df = pd.concat([df, pd.DataFrame([every_report])])
    df.to_csv('szse.csv')

if __name__ == '__main__':
    get_notices()
