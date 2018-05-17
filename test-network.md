#!/usr/bin/python
# -*- coding:utf-8 -*-

import httplib

server = '0411.xxx.cn-north-1.xxx.com'
port = 80
path = '/260GB.temp'
method = 'GET'
chuckSize = 65536

conn = httplib.HTTPConnection(server, port, timeout=60)

headers = {'Host' : server}

conn.request(method, path, headers=headers)

response = conn.getresponse()

if response and response.status < 300:
    while True:
        chunk = response.read(chuckSize)
        if not chunk:
            break
#         print(chunk)
else:
    print(response.status)
    
