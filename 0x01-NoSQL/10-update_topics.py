#!/usr/bin/env python3
'''
Defines a function that changes
all topics of a school document based on the name
'''
from pymongo import MongoClient
from typing import List


def update_topics(mongo_collection: MongoClient,
                  name: str, topics: List[str]) -> str:
    '''changes all topics of a school document based on the name'''
    mongo_collection.update_many({'name': name}, {'$set': {'topics': topics}})

