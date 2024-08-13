#!/usr/bin/env python3

'''0x01. NoSQL task 8'''

from pymongo import MongoClient
from typing import Iterator


def list_all(mongo_collection: MongoClient) -> Iterator:
    '''lists all documents in a collection'''
    if mongo_collection.count() != 0:
        return mongo_collection.find()
    return []
