#!/usr/bin/env python3
'''
Defines a function that returns the list of school having a specific topic
'''
from typing import List
from pymongo import MongoClient


def schools_by_topic(mongo_collection: MongoClient,
                     topic: str) -> List[object]:
    '''returns the list of school having a specific topic'''
    return mongo_collection.find({"topics": topic})

