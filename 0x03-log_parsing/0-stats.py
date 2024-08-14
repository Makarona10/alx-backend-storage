#!/usr/bin/python3

'''0x03. Log Parsing Problem'''

import sys


def main():
    lines = []
    fileSize = 0
    statusDic = {}
    statusCodes = [200, 301, 400, 401, 403, 404, 405, 500]
    while True:
        try:
            print('Enter a line:')
            line = sys.stdin.readline()
            lines.append(line)
            fileSize += int((line.split(' '))[-1])
            status = int((line.split(' '))[-2])
            if not isinstance(status, int) or status not in statusCodes:
                pass
            else:
                statusDic[status] = (statusDic[status] + 1)\
                    if (statusDic.get(status)) else 1
            if len(lines) % 10 == 0:
                print(f'File size: {fileSize}')
                for k, val in statusDic.items():
                    print(f'{k}: {val}')
        except KeyboardInterrupt:
            print(f'File size: {fileSize}')
            for k, val in statusDic.items():
                print(f'{k}: {val}')
