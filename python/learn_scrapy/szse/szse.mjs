import axios from 'axios';

const response = await axios.post(
    'http://www.szse.cn/api/disc/announcement/annList',
    {
        'seDate': [
            '2007-01-01',
            '2022-12-31'
        ],
        'searchKey': [
            '\u52DF\u96C6'
        ],
        'channelCode': [
            'bondinfoNotice_disc'
        ],
        'smallCategoryId': [
            '013901'
        ],
        'pageSize': 50,
        'pageNum': 1
    },
    {
        params: {
            'random': '0.8842877360766206'
        },
        headers: {
            'Accept': 'application/json, text/javascript, */*; q=0.01',
            'Accept-Language': 'zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7',
            'Connection': 'keep-alive',
            'Content-Type': 'application/json',
            'Cookie': 'SL_G_WPT_TO=eo; SL_GWPT_Show_Hide_tmp=1; SL_wptGlobTipTmp=1',
            'Origin': 'http://www.szse.cn',
            'Referer': 'http://www.szse.cn/disclosure/bond/notice/index.html',
            'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36',
            'X-Request-Type': 'ajax',
            'X-Requested-With': 'XMLHttpRequest'
        }
    }
);

console.log(response.data);